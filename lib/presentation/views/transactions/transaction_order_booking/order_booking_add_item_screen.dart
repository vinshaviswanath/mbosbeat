import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/data_sources/user/item_master_sync/item_master_sync.dart';
import 'package:mpos_beat/data/models/category_model.dart';
import 'package:mpos_beat/data/models/group_model.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_dropdown.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';
import 'package:mpos_beat/presentation/logic/customer_transaction_provider.dart';
import 'package:mpos_beat/presentation/logic/user_provider.dart';
import 'package:mpos_beat/presentation/views/transactions/transaction_order_booking/transaction_order_booking_screen.dart';
import 'package:mpos_beat/presentation/views/transactions/transaction_order_booking/widgets/stock_card.dart';

class OrderBookingAddItemScreen extends StatefulWidget {
  final TransactionOrderBookingRouteArgs data;

  const OrderBookingAddItemScreen({super.key, required this.data});

  @override
  State<OrderBookingAddItemScreen> createState() =>
      _OrderBookingAddItemScreenState();
}

class _OrderBookingAddItemScreenState extends State<OrderBookingAddItemScreen> {
  Timer? _debounce;
  late TextEditingController _searchController;
  late ScrollController _scrollController;

@override
void initState() {
  super.initState();

  _searchController = TextEditingController();
  _scrollController = ScrollController();

  _searchController.addListener(_handleSearchClear);

  _scrollController.addListener(_onScroll);

  WidgetsBinding.instance.addPostFrameCallback((_) {
    final provider = context.read<CustomerTransactionProvider>();

    provider.loadNextPage(
      companyId: widget.data.data.company.id!,
      priceListId: widget.data.party.priceList ?? 0,
      ledgerId: widget.data.party.ledgerId,
    );
  });
}

void _onScroll() {
  if (!_scrollController.hasClients) return;

  final provider = context.read<CustomerTransactionProvider>();

  final maxScroll = _scrollController.position.maxScrollExtent;
  final currentScroll = _scrollController.position.pixels.clamp(
    0,
    maxScroll,
  );

  /// 🔥 Load next page when 200px before bottom
  if (currentScroll >= (maxScroll - 200)) {
    provider.loadNextPage(
      companyId: widget.data.data.company.id!,
      priceListId: widget.data.party.priceList ?? 0,
      ledgerId: widget.data.party.ledgerId,
    );
  }
}

  void _handleSearchClear() {
    final provider = context.read<CustomerTransactionProvider>();

    /// when user clears search
    if (_searchController.text.isEmpty && provider.searchValue.isNotEmpty) {
      provider.clearSearchAndReload(
        companyId: widget.data.data.company.id!,
        priceListId: widget.data.party.priceList ?? 0,
        ledgerId: widget.data.party.ledgerId,
      );
    }
  }

@override
void dispose() {
  _searchController.removeListener(_handleSearchClear);
  _scrollController.removeListener(_onScroll);
  _searchController.dispose();
  _scrollController.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    final transactionProvider = context.watch<CustomerTransactionProvider>();

    final userProvider = context.watch<UserProvider>();

    final selectedPriceListId = userProvider.selectedPriceLevelId;
    final rateInclusive = userProvider.rateInclusive;

    final appLocalization = context.l10n;

    // void performSearch(String value) {
    //   final transactionProvider = context.read<CustomerTransactionProvider>();

    //   transactionProvider.updateSearch(value.trim());
    //   transactionProvider.resetPagination();

    //   transactionProvider.loadNextPage(
    //     companyId: widget.data.data.company.id!,
    //     priceListId: widget.data.party.priceList ?? 0,
    //     ledgerId: widget.data.party.ledgerId,
    //   );
    // }

    return Consumer<CustomerTransactionProvider>(
      builder: (context, value, child) => PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) return;
          Navigator.pop(context);
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.keyboard_arrow_left),
              onPressed: () => Navigator.pop(context),
            ),
            title: Column(
              children: [
                Text(
                  widget.data.party.ledgerName ?? "",
                  style: context.textStyle.s18.bold.indigoBlue.roboto,
                ),
                Text(
                  "Order Value : ${transactionProvider.grandTotal.toStringAsFixed(2)}",
                  style: context.textStyle.s12.dustyBlue.w500.roboto,
                ),
              ],
            ),
            centerTitle: true,
            toolbarHeight: 65,
          ),
          body: Stack(
            children: [
              selectedPriceListId == null
                  ? const Center(child: Text("Please select a Price Level"))
                  : Column(
                      children: [
                        /// ===================== SEARCH FIELD (OUTSIDE ) =====================
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: CustomTextField(
                            textInputAction: TextInputAction.search,
                            controller: _searchController,

                            onFieldSubmitted: (value) {
                              final keyword = value.trim();

                              if (keyword.isEmpty) {
                                transactionProvider.clearSearchAndReload(
                                  companyId: widget.data.data.company.id!,
                                  ledgerId: widget.data.party.ledgerId,
                                  priceListId: widget.data.party.priceList ?? 0,
                                );
                              } else {
                                transactionProvider.searchAndReload(
                                  keyword,
                                  companyId: widget.data.data.company.id!,
                                  ledgerId: widget.data.party.ledgerId,
                                  priceListId: widget.data.party.priceList ?? 0,
                                );
                              }
                            },
                            hint:
                                appLocalization.manage_user_screen_search_user,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Icon(
                                Icons.search,
                                color: ColorResources.bluishGray,
                                size: context.getSize.height * 0.024,
                              ),
                            ),
                            backgroundColor: ColorResources.lightGray,
                            borderRadius: 12,
                            hintColor: ColorResources.silverGray,
                            borderColor: ColorResources.transparent,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Row(
                            children: [
                              /// GROUP
                              Expanded(
                                child: StreamBuilder<List<GroupModel>>(
                                  stream: sl<ItemMasterSync>().groupNameList(
                                    widget.data.data.company.id ?? 0,
                                  ),
                                  builder: (_, snapshot) {
                                    final dbGroups =
                                        snapshot.data
                                            ?.map((e) => e.groupName)
                                            .toList() ??
                                        [];
                                    final groups = ['All', ...dbGroups];
                                    return CustomDropdown<String>(
                                      value: value.selectedGroup,
                                      items: groups,
                                      hintText: appLocalization
                                          .order_booking_add_item_select_group,
                                      onChanged: (v) async {
                                        await transactionProvider.selectGroup(
                                          v ?? 'All',
                                          companyId:
                                              widget.data.data.company.id!,
                                          priceListId:
                                              widget.data.party.priceList ?? 0,
                                          ledgerId: widget.data.party.ledgerId,
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),

                              w8,

                              /// CATEGORY
                              Expanded(
                                child: StreamBuilder<List<CategoryModel>>(
                                  stream: sl<ItemMasterSync>().categoryList(
                                    widget.data.data.company.id ?? 0,
                                  ),
                                  builder: (_, snapshot) {
                                    final dbcategories =
                                        snapshot.data
                                            ?.map((e) => e.catgoryName)
                                            .toList() ??
                                        [];
                                    final categories = ['All', ...dbcategories];
                                    return CustomDropdown<String>(
                                      value: value.selectedCategory,
                                      items: categories,
                                      hintText: appLocalization
                                          .order_booking_add_item_select_category,
                                      onChanged: (v) async {
                                        await transactionProvider
                                            .selectCategory(
                                              v ?? 'All',
                                              companyId:
                                                  widget.data.data.company.id!,
                                              priceListId:
                                                  widget.data.party.priceList ??
                                                  0,
                                              ledgerId:
                                                  widget.data.party.ledgerId,
                                            );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// ===================== PRODUCT LIST =====================
                        Expanded(
                          child: Consumer<CustomerTransactionProvider>(
                            builder: (_, provider, __) {

                              final list = provider.sortedPagedItems;

                              if (list.isEmpty && provider.isLoadingPage) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }

                              if (list.isEmpty) {
                                return const Center(
                                  child: Text("No items found"),
                                );
                              }

                              return CustomScrollView(
                                keyboardDismissBehavior:
                                    ScrollViewKeyboardDismissBehavior.onDrag,
                                controller: _scrollController,
                                slivers: [
                                  /// ================= ITEMS =================
                                  SliverList(
                                    delegate: SliverChildBuilderDelegate(
                                      (context, index) {
                                        final list = provider.sortedPagedItems;

                                        if (index == list.length) {
                                          return const Padding(
                                            padding: EdgeInsets.all(16),
                                            child: Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          );
                                        }

                                        final item = list[index];

                                        final selectedUnit = provider
                                            .getSelectedUnit(
                                              item.stockItemId,
                                              item,
                                            );

                                        final baseRate = item.rate;

                                        final rate =
                                            selectedUnit == item.unitName
                                            ? baseRate
                                            : baseRate *
                                                  ((item.unitConversion) /
                                                      (item.unitDenominator));

                                        final tax = item.taxPercent;

                                        final inclRate = rateInclusive
                                            ? rate
                                            : rate + (rate * tax / 100);

                                        return Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 8,
                                          ),
                                          child: StockCard(
                                            key: ValueKey(item.stockItemId),
                                            item: item,
                                            data: widget.data,
                                            name: item.itemName,
                                            stock: item.closingStock ?? 0,
                                            mrp: rate,
                                            tax: tax,
                                            inclRate: inclRate,
                                            companyId:
                                                widget.data.data.company.id ??
                                                0,
                                            itemId: item.stockItemId,
                                            priceListId: selectedPriceListId,
                                          ),
                                        );
                                      },
                                      childCount:
                                          provider.sortedPagedItems.length +
                                          (provider.hasMore ? 1 : 0),
                                    ),
                                  ),

                                  const SliverToBoxAdapter(
                                    child: SizedBox(height: 120),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),

              /// ===================== BOTTOM SUMMARY =====================
              Positioned(
                bottom: 0,
                child: Container(
                  width: context.getSize.width,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: ColorResources.white,
                    boxShadow: [
                      BoxShadow(
                        color: ColorResources.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, -4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            appLocalization.grand_total,
                            style: context.textStyle.indigoBlue.s12.w500.roboto,
                          ),
                          Text(
                            transactionProvider.grandTotal.toStringAsFixed(2),
                            style: context.textStyle.indigoBlue.s20.bold.roboto,
                          ),
                        ],
                      ),
                      CustomButton(
                        color: transactionProvider.selectedItemIds.isEmpty
                            ? ColorResources.ashGray
                            : null,
                        buttonText: transactionProvider.selectedItemCount
                            .toString(),
                        isborderEnable: false,
                        onTap: () {
                          if (transactionProvider.selectedItemIds.isNotEmpty) {
                            Navigator.of(context).pop();
                          } else {}
                        },
                        width: context.getSize.width / 2.5,
                        borderRadius: BorderRadius.circular(16),
                        icon: Icons.shopping_cart,
                        iconSize: 30,
                        iconColor: ColorResources.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
