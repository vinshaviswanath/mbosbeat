import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/data_sources/user/party_MasterSync/party_MasterSync.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/models/product.dart';
import 'package:mpos_beat/presentation/views/transactions/transaction_order_booking/transaction_order_booking_screen.dart';
import 'package:rxdart/rxdart.dart';

class CustomerTransactionProvider extends ChangeNotifier {
  CustomerTransactionProvider();

  /// Database
  AppDb _db = sl<AppDb>();

  /// ---------------------------------------------------------------------------
  /// CustomerTransactionProvider
  /// ---------------------------------------------------------------------------
  ///
  /// This provider manages the complete business logic for:
  ///
  /// • Product listing (stream + pagination)
  /// • Item selection & quantity handling
  /// • Discount calculations
  /// • Tax calculations (CGST / SGST / CESS)
  /// • Unit conversion
  /// • Filtering (Group / Category / Search)
  /// • Pagination with caching
  ///
  /// It is designed to power the "Add Item" screen in a transaction flow.
  ///
  /// Architecture style:
  /// - State stored locally in memory
  /// - Notifies UI using ChangeNotifier
  /// - Supports incremental pagination
  /// - Supports multi-slab tax calculation
  ///
  /// ---------------------------------------------------------------------------
  // =========================================================
  // ======================== VARIABLES =======================
  // =========================================================

  // -------------------------------------------------------------------------
  // ITEM SOURCE
  // -------------------------------------------------------------------------

  /// Broadcast stream that provides product updates.
  /// Attached using [attachItemsStream].
  late Stream<List<Product>> _itemsStream;

  /// Holds the complete in-memory product list.
  /// Used for filtering and group/category stream generation.
  List<Product> _allItems = [];

  /// Cached normal (unfiltered) paginated list.
  /// Used to quickly restore state when search/filter is cleared.
  List<Product> _normalCache = [];

  /// Stores the page index when cache was last updated.
  int _normalCachePage = 0;

  /// Indicates whether a valid normal cache exists.
  bool _hasNormalCache = false;

  // -------------------------------------------------------------------------
  // ITEM STATE (Transaction Level)
  // -------------------------------------------------------------------------
  /// Stores quantity per itemId.
  final Map<int, double> _itemQty = {};

  /// Stores computed net total (after discount) per itemId.
  final Map<int, double> _itemTotal = {};

  /// Stores inclusive rate per itemId.
  /// This is important for recalculation when discount changes.
  final Map<int, double> _itemInclusiveRate = {};

  /// Stores selected quantity unit per itemId.
  final Map<int, String> _selectedQtyUnit = {};

  /// Stores selected free quantity unit per itemId.
  final Map<int, String> _selectedFreeUnit = {};

  /// Stores discount value per itemId.
  final Map<int, double> _itemDiscount = {};

  /// Stores discount type (percentage or amount) per itemId.
  final Map<int, DiscountType> _discountType = {};

  /// Stores free quantity per itemId.
  final Map<int, double> _freeQty = {};

  /// Stores full Product object for selected items.
  /// Used for tax & subtotal calculations.
  final Map<int, Product> _selectedItemObjects = {};

  /// Stores selected itemIds.
  final Set<int> _selectedItems = {};

  /// Stores currently expanded itemId in UI.
  int? expandedItemId;

  /// Stores selected price level (if multi price level support).
  int? selectedPriceLevelId;

  /// Stores selected UI index (for selection highlighting).
  int? _selectedIndex;

  /// Last moved item to the top of the list
  int? lastMovedToTopItemId;

  // -------------------------------------------------------------------------
  // FILTER STATE
  // -------------------------------------------------------------------------

  /// Current search keyword.
  String _search = '';

  /// Selected group filter.
  String _selectedGroup = 'All';

  /// Selected category filter.
  String _selectedCategory = 'All';

  // -------------------------------------------------------------------------
  // PAGINATION STATE
  // -------------------------------------------------------------------------

  /// Currently loaded paginated items.
  List<Product> _pagedItems = [];

  /// Current page index.
  int _page = 1;

  /// Items per page limit.
  final int _limit = 100;

  /// Prevents multiple concurrent API calls.
  bool _isLoadingPage = false;

  /// Indicates if more pages are available.
  bool _hasMore = true;

  // -------------------------------------------------------------------------
  // TAX RATES (Default Slab)
  // -------------------------------------------------------------------------

  /// Default CGST rate.
  final double cgstRate = 9;

  /// Default SGST rate.
  final double sgstRate = 9;

  /// Default CESS rate.
  final double cessRate = 0;

  // =========================================================
  // ======================== GETTERS =========================
  // =========================================================

  /// Returns selected item IDs.
  Set<int> get selectedItemIds => _selectedItems;

  /// Returns currently selected index.
  int? get selectedIndex => _selectedIndex;

  /// Returns pagination loading state.
  bool get isLoadingPage => _isLoadingPage;

  /// Returns whether more pages exist.
  bool get hasMore => _hasMore;

  /// Returns current search value.
  String get searchValue => _search;

  /// Returns selected group.
  String get selectedGroup => _selectedGroup;

  /// Returns selected category.
  String get selectedCategory => _selectedCategory;

  /// Returns paginated items.
  List<Product> get pagedItems => _pagedItems;

  /// Returns subtotal of selected items (after discount).
  double get subTotal => _itemTotal.values.fold(0.0, (sum, v) => sum + v);

  /// Grand total currently equals subtotal.
  /// (Tax added separately in billTotal)
  double get grandTotal => subTotal;

  /// Total bill including tax.
  double get billTotal => subTotal + totalCgst + totalSgst;

  /// Number of selected items.
  int get selectedItemCount => _selectedItems.length;

  /// Total quantity of all selected items.
  double get totalQty => _itemQty.values.fold(0.0, (sum, v) => sum + v);

  /// CGST based on subtotal.
  double get cgst => subTotal * cgstRate / 100;

  /// SGST based on subtotal.
  double get sgst => subTotal * sgstRate / 100;

  /// CESS based on subtotal.
  double get cess => subTotal * cessRate / 100;

  // =========================================================
  // ======================== TAX LOGIC =======================
  // =========================================================

  /// Calculates subtotal BEFORE tax but AFTER discount.
  double get billSubTotal {
    double total = 0;

    for (final itemId in _selectedItems) {
      final item = _selectedItemObjects[itemId];
      if (item == null) continue;

      final qty = _itemQty[itemId] ?? 0;
      final discount = _itemDiscount[itemId] ?? 0;
      final type = _discountType[itemId];

      double base = item.rate * qty;

      // Apply discount BEFORE tax calculation
      if (type == DiscountType.percentage) {
        base -= base * discount / 100;
      } else if (type == DiscountType.amount) {
        base -= discount;
      }

      total += base.clamp(0, double.infinity);
    }

    return total;
  }

  /// Calculates total CGST across all selected items.
  /// Supports multi tax slab via product.taxPercent.
  double get totalCgst {
    double cgst = 0;

    for (final itemId in _selectedItems) {
      final product = _selectedItemObjects[itemId];
      if (product == null) continue;

      double base = _calculateDiscountedBase(product, itemId);

      cgst += base * (product.taxPercent / 2) / 100;
    }

    return cgst;
  }

  /// Calculates total SGST across all selected items.
  double get totalSgst {
    double sgst = 0;

    for (final itemId in _selectedItems) {
      final product = _selectedItemObjects[itemId];
      if (product == null) continue;

      double base = _calculateDiscountedBase(product, itemId);

      sgst += base * (product.taxPercent / 2) / 100;
    }

    return sgst;
  }

  /// Calculates total CESS across all selected items.
  double get totalCess {
    double cess = 0;

    for (final itemId in _selectedItems) {
      final product = _selectedItemObjects[itemId];
      if (product == null) continue;

      final base = _itemTotal[itemId] ?? 0;
      cess += base * (product.cess ?? 0) / 100;
    }

    return cess;
  }

  /// Helper: calculates discounted base before tax.
  double _calculateDiscountedBase(Product product, int itemId) {
    final qty = _itemQty[itemId] ?? 0;
    final discount = _itemDiscount[itemId] ?? 0;
    final type = _discountType[itemId];

    double base = product.rate * qty;

    if (type == DiscountType.percentage) {
      base -= base * discount / 100;
    } else if (type == DiscountType.amount) {
      base -= discount;
    }

    return base.clamp(0, double.infinity);
  }

  List<Product> get sortedPagedItems {
    final selectedItems = _selectedItemObjects.values.toList();

    final pageItems = _pagedItems.where(
      (item) => !_selectedItems.contains(item.stockItemId),
    );

    return [...selectedItems, ...pageItems];
  }

  List<SelectedOrderItem> get selectedOrderItems {
    final list = <SelectedOrderItem>[];

    for (final itemId in _selectedItems) {
      final item = _selectedItemObjects[itemId];
      if (item == null) continue;

      final qty = _itemQty[itemId] ?? 0;
      final discount = _itemDiscount[itemId] ?? 0;

      final exclusiveRate = item.rate;
      final taxPercent = item.taxPercent;

      final sub = exclusiveRate * qty;

      double net = sub;
      final type = _discountType[itemId];

      if (type == DiscountType.percentage) {
        net -= sub * discount / 100;
      } else if (type == DiscountType.amount) {
        net -= discount;
      }

      final tax = net * taxPercent / 100;
      final finalAmount = net + tax;

      final amount = qty * exclusiveRate;
      final inclRate = qty > 0 ? finalAmount / qty : 0;

      list.add(
        SelectedOrderItem(
          item: item,
          qty: qty,
          rate: exclusiveRate,
          discount: discount,
          amount: amount,
          inclRate: inclRate.toDouble(),
        ),
      );
    }

    return list;
  }

  // ===================== ITEM SOURCE =====================

  void setProducts(List<Product> products) {
    _allItems = products;
    attachItemsStream(Stream.value(_allItems));
  }

  void attachItemsStream(Stream<List<Product>> stream) {
    _itemsStream = stream.asBroadcastStream();
    _itemsStream.listen((items) {
      _allItems = items;
      notifyListeners();
    });
  }

  // ===================== ITEM STATE =====================
  bool hasDiscount(int itemId) {
    return _itemDiscount.containsKey(itemId);
  }

  bool hasFreeQty(int id) => _freeQty.containsKey(id);

  double getFreeQty(int id) => _freeQty[id] ?? 0;

  void updateFreeQty(int id, double v) {
    _freeQty[id] = v;
    notifyListeners();
  }

  void toggleExpanded(int itemId) {
    if (expandedItemId == itemId) {
      expandedItemId = null;
    } else {
      expandedItemId = itemId;
    }
    notifyListeners();
  }

  void collapseExpanded() {
    expandedItemId = null;
    notifyListeners();
  }

  // ===================== INDEX SELECTION =====================

  bool isSelectedByIndex(int index) => _selectedIndex == index;

  void selectIndex(int index) {
    _selectedIndex = _selectedIndex == index ? null : index;
    notifyListeners();
  }

  void clearSelection() {
    _selectedIndex = null;
    notifyListeners();
  }

  // ===================== ITEM SELECTION =====================
  bool isSelected(int itemId) => _selectedItems.contains(itemId);

  // ===================== ITEM ACTIONS =====================
  double getQty(int itemId) => _itemQty[itemId] ?? 0;

  void updateQty(int itemId, double qty, double inclRate, {Product? item}) {
    /// If qty becomes zero → remove item
    if (qty <= 0) {
      resetQty(itemId);
      return;
    }

    /// 🔥 Check if item was NOT previously selected
    final wasAlreadySelected = _selectedItems.contains(itemId);

    /// Update quantity & inclusive rate
    _itemQty[itemId] = qty;
    _itemInclusiveRate[itemId] = inclRate;

    /// Add to selected set
    _selectedItems.add(itemId);

    /// Store product reference if available
    if (item != null) {
      _selectedItemObjects[itemId] = item;
    }

    /// 🔥 If this is a NEW selection → mark for scroll
    if (!wasAlreadySelected) {
      lastMovedToTopItemId = itemId;
    }

    /// Recalculate total
    _recalculateItemTotal(itemId);

    notifyListeners();
  }

  void incrementQty(int itemId, double inclRate, {Product? item}) {
    final newQty = (_itemQty[itemId] ?? 0) + 1;
    updateQty(itemId, newQty, inclRate, item: item);
  }

  void decrementQty(int itemId, double inclRate) {
    final current = _itemQty[itemId] ?? 0;
    final newQty = current - 1;

    if (newQty <= 0) {
      resetQty(itemId);
    } else {
      updateQty(itemId, newQty, inclRate);
    }
  }

  void incrementFreeQty(int itemId) {
    final current = _freeQty[itemId] ?? 0;
    _freeQty[itemId] = current + 1;
    notifyListeners();
  }

  void decrementFreeQty(int itemId) {
    final current = _freeQty[itemId] ?? 0;
    if (current > 0) {
      _freeQty[itemId] = current - 1;
      notifyListeners();
    }
  }

  void resetQty(int itemId) {
    _itemQty.remove(itemId);
    _itemTotal.remove(itemId);
    _selectedQtyUnit.remove(itemId);
    _itemDiscount.remove(itemId);
    _discountType.remove(itemId);
    _selectedItems.remove(itemId);
    _freeQty.remove(itemId);
    _selectedItemObjects.remove(itemId);
    notifyListeners();
  }

  void clearSelectedItems() {
    _itemQty.clear();
    _freeQty.clear();
    _itemTotal.clear();
    _selectedQtyUnit.clear();
    _itemDiscount.clear();
    _discountType.clear();
    _selectedItems.clear();
    expandedItemId = null;
    _selectedIndex = null;
    _selectedItemObjects.clear();
    notifyListeners();
  }

  // ===================== UNIT =====================
  String getSelectedUnit(int itemId, [Product? item]) {
    if (item == null) return _selectedQtyUnit[itemId] ?? '';
    return _selectedQtyUnit[itemId] ?? item.unitName;
  }

  void setUnit(int itemId, String unit, double inclRate) {
    if (_selectedQtyUnit[itemId] == unit) return;

    _selectedQtyUnit[itemId] = unit;
    _recalculateItemTotal(itemId);
    notifyListeners();
  }

  String getSelectedFreeUnit(int itemId, Product item) {
    return _selectedFreeUnit[itemId] ?? item.unitName;
  }

  void setFreeUnit(int itemId, String unit) {
    _selectedFreeUnit[itemId] = unit;
    notifyListeners();
  }

  // ===================== DISCOUNT =====================
  void setInitialDiscount(int itemId, double value, DiscountType type) {
    _itemDiscount[itemId] = value;
    _discountType[itemId] = type;
  }

  void updateDiscount(int itemId, double value, double inclRate) {
    if (!_itemDiscount.containsKey(itemId)) return;

    _itemDiscount[itemId] = value;
    _recalculateItemTotal(itemId);
    notifyListeners();
  }

  double getDiscount(int itemId) => _itemDiscount[itemId] ?? 0;
  DiscountType? getDiscountType(int itemId) => _discountType[itemId];

  double calculateNetTotal({
    required int itemId,
    required double qty,
    required double inclRate,
  }) {
    final discount = getDiscount(itemId);
    final type = getDiscountType(itemId);

    double total = inclRate * qty;

    if (type == DiscountType.percentage) {
      total -= total * discount / 100;
    } else if (type == DiscountType.amount) {
      total = (total - discount).clamp(0, total);
    }

    return total;
  }

  void _recalculateItemTotal(int itemId) {
    final qty = _itemQty[itemId];
    final inclRate = _itemInclusiveRate[itemId];

    if (qty == null || inclRate == null) return;

    /// inclusive base
    final base = inclRate * qty;

    final discount = _itemDiscount[itemId] ?? 0;
    final type = _discountType[itemId];

    double net = base;

    if (type == DiscountType.percentage) {
      net -= base * discount / 100;
    } else if (type == DiscountType.amount) {
      net -= discount;
    }

    _itemTotal[itemId] = net.clamp(0, double.infinity);
  }

  // ===================== GROUP STREAM =====================
  Stream<List<String>> get groupStream async* {
    final items = _allItems;
    final groups =
        items
            .map((e) => e.groupName)
            .where((e) => e.isNotEmpty)
            .toSet()
            .toList()
          ..sort();
    yield ['All', ...groups];
  }

  void applyAllFilterFromCache() {
    if (_normalCache.isEmpty) return;

    /// ⭐ reset filter state
    _selectedGroup = 'All';
    _selectedCategory = 'All';
    _search = '';

    _pagedItems
      ..clear()
      ..addAll(_normalCache);

    _page = _normalCachePage;
    _hasMore = true;

    notifyListeners();
  }

  void restoreNormalFromCache() {
    if (_selectedGroup == 'All' &&
        _selectedCategory == 'All' &&
        _search.isEmpty) {
      _pagedItems = List.from(_normalCache);
      notifyListeners();
    }
  }

  // ===================== CATEGORY STREAM =====================
  Stream<List<String>> get categoryStream async* {
    final items = _allItems;
    final categories =
        items
            .map((e) => e.categoryName)
            .where((e) => e.isNotEmpty)
            .toSet()
            .toList()
          ..sort();
    yield ['All', ...categories];
  }

  // ===================== FILTER ACTIONS =====================

  Future<void> selectGroup(
    String value, {
    required int companyId,
    required int priceListId,
    required int ledgerId,
  }) async {
    if (_selectedGroup == value) return;

    _selectedGroup = value;

    _pagedItems.clear();
    _page = 0;
    _hasMore = true;

    notifyListeners();

    await loadNextPage(
      companyId: companyId,
      priceListId: priceListId,
      ledgerId: ledgerId,
    );
  }

  Future<void> selectCategory(
    String value, {
    required int companyId,
    required int priceListId,
    required int ledgerId,
  }) async {
    if (_selectedCategory == value) return;

    _selectedCategory = value;

    _pagedItems.clear();
    _page = 0;
    _hasMore = true;

    notifyListeners();

    await loadNextPage(
      companyId: companyId,
      priceListId: priceListId,
      ledgerId: ledgerId,
    );
  }

  void updateSearch(String value) {
    _search = value;
    resetPagination();
    notifyListeners();
  }

  void clearSearch({
    required int companyId,
    required int priceListId,
    required int ledgerId,
  }) {
    _search = "";
    resetPagination();

    loadNextPage(
      companyId: companyId,
      priceListId: priceListId,
      ledgerId: ledgerId,
    );

    notifyListeners();
  }

  // ===================== FILTERED ITEMS =====================
  Stream<List<Product>> get filteredItems async* {
    yield _applyFilters(_allItems);

    await for (final items in _itemsStream) {
      yield _applyFilters(items);
    }
  }

  List<Product> _applyFilters(List<Product> items) {
    var list = items;

    if (_selectedGroup != 'All') {
      list = list.where((e) => e.groupName == _selectedGroup).toList();
    }

    if (_selectedCategory != 'All') {
      list = list.where((e) => e.categoryName == _selectedCategory).toList();
    }

    if (_search.isNotEmpty) {
      final q = _search.toLowerCase();
      list = list.where((e) {
        return e.itemName.toLowerCase().contains(q) ||
            e.stockItemId.toString().contains(q) ||
            e.aliasName.toLowerCase().contains(q) ||
            e.partNumber.toLowerCase().contains(q);
      }).toList();
    }

    return list;
  }

  // // ===================== QTY =====================
  // double getQty(int itemId) => _itemQty[itemId] ?? 0;

  // ===================== RATE CONVERSION =====================
  double getConvertedRate({
    required Product item,
    required String selectedUnit,
    required double baseRate,
  }) {
    if (selectedUnit == item.unitName) return baseRate;

    final conversion =
        item.unitConversion /
        (item.unitDenominator == 0 ? 1 : item.unitDenominator);

    return baseRate * conversion;
  }

  // =========================================================
  // ======================== PAGINATION ======================
  // =========================================================

  /// Loads next page from backend.
  /// Prevents duplicate loading & merges unique items.

void resetPagination() {
  _pagedItems.clear();
  _page = 1;
  _hasMore = true;
  notifyListeners();
}

  Future<void> loadNextPage({
    required int companyId,
    required int priceListId,
    required int ledgerId,
  }) async {
    if (_isLoadingPage || !_hasMore) return;

    _isLoadingPage = true;
    notifyListeners();

final result = await sl<PartyMasterSync>().fetchProduct(
  companyId,
  priceListId,
  ledgerId,
  _selectedGroup,
  _selectedCategory,
  _search,
  limit: _limit,
  offset: (_page - 1) * _limit,
);
    Logger.logInfo("fetchProduct ${result.length}");

    final newItems = result
        .where((e) => !_pagedItems.any((p) => p.stockItemId == e.stockItemId))
        .toList();

    _pagedItems.addAll(newItems);

    if (_search.isEmpty) {
      _normalCache = List.from(_pagedItems);
      _normalCachePage = _page;
      _hasNormalCache = true;
    }

    if (result.length < _limit) {
      _hasMore = false;
    } else {
      _page++;
    }

    _isLoadingPage = false;
    notifyListeners();
  }

  Future<void> searchAndReload(
    String keyword, {
    required int companyId,
    required int priceListId,
    required int ledgerId,
  }) async {
    if (_search == keyword && _pagedItems.isNotEmpty) return;

    _search = keyword;

    _pagedItems.clear();
    _page = 0;
    _hasMore = true;

    notifyListeners();

    await loadNextPage(
      companyId: companyId,
      priceListId: priceListId,
      ledgerId: ledgerId,
    );
  }

  Future<void> clearSearchAndReload({
    required int companyId,
    required int priceListId,
    required int ledgerId,
  }) async {
    /// already normal mode → do nothing
    if (_search.isEmpty) return;

    _search = '';

    /// restore cache if exists
    if (_hasNormalCache) {
      _pagedItems
        ..clear()
        ..addAll(_normalCache);

      _page = _normalCachePage;
      _hasMore = true;

      notifyListeners();
      return;
    }

    /// fallback (first launch case)
    _pagedItems.clear();
    _page = 0;
    _hasMore = true;

    notifyListeners();

    await loadNextPage(
      companyId: companyId,
      priceListId: priceListId,
      ledgerId: ledgerId,
    );
  }

  void setQty(int itemId, double qty, double inclRate, {Product? item}) {
    updateQty(itemId, qty, inclRate, item: item);
  }

  // ===================== SCREEN RESET =====================
  void resetAddItemScreenState() {
    _search = '';
    _selectedGroup = 'All';
    _selectedCategory = 'All';

    _pagedItems.clear();
    _page = 0;
    _hasMore = true;
    _isLoadingPage = false;

    _normalCache.clear();
    _hasNormalCache = false;
    _normalCachePage = 0;

    notifyListeners();
  }

  void clearOrder() {
    _selectedItems.clear();
    notifyListeners();
  }

  Stream<bool> watchDiscountVisibility({
    required int userId,
    required int companyId,
  }) {
    final userStream = _db.userSettingsDao.watchEditDiscountEnabled(userId);

    final companyStream = _db.companySettingsDao.watchItemwiseDiscountEnabled(
      companyId,
    );

    return Rx.combineLatest2<bool, bool, bool>(
      userStream,
      companyStream,
      (userEnabled, companyEnabled) => userEnabled && companyEnabled,
    );
  }
}
