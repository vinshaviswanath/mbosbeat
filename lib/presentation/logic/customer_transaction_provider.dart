import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/data_sources/user/party_MasterSync/party_MasterSync.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/local_db/daos/item_price_details_dao/item_price_details_dao.dart';
import 'package:mpos_beat/data/models/product.dart';
import 'package:mpos_beat/presentation/views/transactions/transaction_order_booking/transaction_order_booking_screen.dart';

class CustomerTransactionProvider extends ChangeNotifier {
  CustomerTransactionProvider();

  // ===================== ITEM SOURCE =====================
  late Stream<List<Product>> _itemsStream;
  List<Product> _allItems = [];

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
  final Map<int, double> _itemQty = {};
  final Map<int, double> _itemTotal = {};
  final Map<int, String> _selectedUnit = {};
  final Set<int> _selectedItems = {};

  Set<int> get selectedItemIds => _selectedItems;

  final Map<int, double> _itemDiscount = {};
  final Map<int, DiscountType> _discountType = {};

  int? expandedItemId;
  int? selectedPriceLevelId;

  // ===================== TAX =====================
  final double cgstRate = 9;
  final double sgstRate = 9;
  final double cessRate = 0;

  double get cgst => subTotal * cgstRate / 100;
  double get sgst => subTotal * sgstRate / 100;
  double get cess => subTotal * cessRate / 100;

  // ===================== INDEX SELECTION =====================
  int? _selectedIndex;
  int? get selectedIndex => _selectedIndex;

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

  // ===================== TOTALS =====================
  double get subTotal =>
      _itemTotal.values.fold(0.0, (sum, v) => sum + v);

  double get grandTotal => subTotal;

  int get selectedItemCount => _selectedItems.length;

  // ===================== ITEM ACTIONS =====================
  double getQty(int itemId) => _itemQty[itemId] ?? 0;

  void updateQty(int itemId, double qty, double inclRate) {
    if (qty <= 0) {
      resetQty(itemId);
      return;
    }

    _itemQty[itemId] = qty;
    _selectedItems.add(itemId);

    _recalculateItemTotal(itemId, inclRate);
    notifyListeners();
  }

  void incrementQty(int itemId, double inclRate) {
    updateQty(itemId, (_itemQty[itemId] ?? 0) + 1, inclRate);
  }

  void decrementQty(int itemId, double inclRate) {
    updateQty(itemId, (_itemQty[itemId] ?? 0) - 1, inclRate);
  }

  void resetQty(int itemId) {
    _itemQty.remove(itemId);
    _itemTotal.remove(itemId);
    _selectedUnit.remove(itemId);
    _itemDiscount.remove(itemId);
    _discountType.remove(itemId);
    _selectedItems.remove(itemId);
    notifyListeners();
  }

  void clearSelectedItems() {
    _itemQty.clear();
    _itemTotal.clear();
    _selectedUnit.clear();
    _itemDiscount.clear();
    _discountType.clear();
    _selectedItems.clear();
    expandedItemId = null;
    _selectedIndex = null;
    notifyListeners();
  }

  // ===================== UNIT =====================
  String getSelectedUnit(int itemId, [Product? item]) {
    if (item == null) return _selectedUnit[itemId] ?? '';
    return _selectedUnit[itemId] ?? item.unitName;
  }

  void setUnit(int itemId, String unit, double inclRate) {
    if (_selectedUnit[itemId] == unit) return;

    _selectedUnit[itemId] = unit;
    _recalculateItemTotal(itemId, inclRate);
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
    _recalculateItemTotal(itemId, inclRate);
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

    void _recalculateItemTotal(int itemId, double inclRate) {
    final qty = _itemQty[itemId];
    if (qty == null || qty <= 0) return;

    _itemTotal[itemId] = calculateNetTotal(
      itemId: itemId,
      qty: qty,
      inclRate: inclRate,
    );
  }

  // ===================== FILTER STATE =====================
  String _search = '';
  String _selectedGroup = 'All';
  String _selectedCategory = 'All';

  String get searchValue => _search;
  String get selectedGroup => _selectedGroup;
  String get selectedCategory => _selectedCategory;

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
  
  void selectGroup(String value) {
    if (_selectedGroup == value) return;
    _selectedGroup = value;
    resetPagination();
    notifyListeners();
  }

  void selectCategory(String value) {
    if (_selectedCategory == value) return;
    _selectedCategory = value;
    resetPagination();
    notifyListeners();
  }

  void updateSearch(String value) {
    _search = value;
    resetPagination();
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

  // ===================== ORDER ITEMS STREAM =====================
  Stream<List<SelectedOrderItem>> orderItemsStream({
    required int fallbackPriceLevelId,
    required AppDb appDb,
  }) {
    if (_itemQty.isEmpty) {
      return Stream.value([]);
    }

    final priceLevelId = selectedPriceLevelId ?? fallbackPriceLevelId;

    return appDb
        .watchSelectedOrderItems(
          priceLevelId: priceLevelId,
          itemIds: _selectedItems.toList(),
        )
        .map((items) {
          return items.map((item) {
            final itemId = item.item.stockItemId;
            final qty = _itemQty[itemId] ?? 0;

            ItemPriceDetailsTable? slab;
            if (item.prices.isNotEmpty) {
              slab = item.prices.firstWhere(
                (p) =>
                    qty >= (p.fromQty ?? 0) &&
                    (p.toQty == 0 || qty <= (p.toQty ?? 0)),
                orElse: () => item.prices.first,
              );
            }

            return SelectedOrderItem(
              item: item.item,
              price: slab,
              qty: qty,
            );
          }).toList();
        });
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

  //pagination
  final List<Product> _pagedItems = [];
  List<Product> get pagedItems => _pagedItems;

  int _page = 0;
  final int _limit = 100;

  bool _isLoadingPage = false;
  bool _hasMore = true;

  bool get isLoadingPage => _isLoadingPage;
  bool get hasMore => _hasMore;
  void resetPagination() {
    _pagedItems.clear();
    _page = 0;
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
      offset: _page * _limit,
    );

    if (result.length < _limit) {
      _hasMore = false;
    }

    _pagedItems.addAll(result);
    _page++;

    _isLoadingPage = false;
    notifyListeners();
  }

  void setQty(int itemId, double qty, double inclRate) {
    updateQty(itemId, qty, inclRate);
  }

  // ===================== SCREEN RESET =====================
  void resetAddItemScreenState() {
    // filters
    _search = '';
    _selectedGroup = 'All';
    _selectedCategory = 'All';

    // pagination
    _pagedItems.clear();
    _page = 0;
    _hasMore = true;
    _isLoadingPage = false;

    notifyListeners();
  }

  void clearOrder() {
    _selectedItems.clear();
    notifyListeners();
  }
}
