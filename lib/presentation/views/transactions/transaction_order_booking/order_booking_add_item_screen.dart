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

  @override
  void initState() {
    super.initState();

    final transactionProvider = context.read<CustomerTransactionProvider>();

    _searchController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // transactionProvider.resetAddItemScreenState();
      //  transactionProvider.resetPagination();
      transactionProvider.loadNextPage(
        companyId: widget.data.data.company.id!,
        priceListId: widget.data.party.priceList ?? 0,
        ledgerId: widget.data.party.ledgerId,
      );
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final transactionProvider = context.watch<CustomerTransactionProvider>();


    final userProvider = context.watch<UserProvider>();

    final selectedPriceListId = userProvider.selectedPriceLevelId;
    final rateInclusive = userProvider.rateInclusive;

    final appLocalization = context.l10n;

    return PopScope(
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
                          controller: _searchController,
                          onChange: (value) {
                            _debounce?.cancel();
                            _debounce = Timer(
                              const Duration(milliseconds: 300),
                              () {
                                transactionProvider.updateSearch(value);

                                transactionProvider.resetPagination();

                                transactionProvider.loadNextPage(
                                  companyId: widget.data.data.company.id!,
                                  priceListId: widget.data.party.priceList ?? 0,
                                  ledgerId: widget.data.party.ledgerId,
                                );
                              },
                            );
                          },
                          hint: appLocalization.manage_user_screen_search_user,
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

                      /// ===================== PRODUCT LIST =====================
                      Expanded(
                        child: Consumer<CustomerTransactionProvider>(
                          builder: (_, provider, __) {
                            if (provider.pagedItems.isEmpty &&
                                provider.isLoadingPage) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            if (provider.pagedItems.isEmpty) {
                              return const Center(
                                child: Text("No items found"),
                              );
                            }

                            return NotificationListener<ScrollNotification>(
                              onNotification: (scrollInfo) {
                                if (!provider.isLoadingPage &&
                                    provider.hasMore &&
                                    scrollInfo.metrics.pixels ==
                                        scrollInfo.metrics.maxScrollExtent) {
                                  provider.loadNextPage(
                                    companyId: widget.data.data.company.id!,
                                    priceListId:
                                        widget.data.party.priceList ?? 0,
                                    ledgerId: widget.data.party.ledgerId,
                                  );
                                }
                                return false;
                              },
                              child: CustomScrollView(
                                keyboardDismissBehavior:
                                    ScrollViewKeyboardDismissBehavior.onDrag,
                                slivers: [
                                  /// ================= FILTERS =================
                                  SliverToBoxAdapter(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 8,
                                      ),
                                      child: Row(
                                        children: [
                                          /// GROUP
                                          Expanded(
                                            child: StreamBuilder<List<GroupModel>>(
                                              stream: sl<ItemMasterSync>()
                                                  .groupNameList(
                                                    widget
                                                            .data
                                                            .data
                                                            .company
                                                            .id ??
                                                        0,
                                                  ),
                                              builder: (_, snapshot) {
                                                final groups =
                                                    snapshot.data
                                                        ?.map(
                                                          (e) => e.groupName,
                                                        )
                                                        .toList() ??
                                                    ['All'];

                                                return CustomDropdown<String>(
                                                  items: groups,
                                                  hintText: appLocalization
                                                      .order_booking_add_item_select_group,
                                                  onChanged: (v) {
                                                    provider.selectGroup(
                                                      v ?? 'All',
                                                    );

                                                    provider.resetPagination();
                                                    provider.loadNextPage(
                                                      companyId: widget
                                                          .data
                                                          .data
                                                          .company
                                                          .id!,
                                                      priceListId:
                                                          widget
                                                              .data
                                                              .party
                                                              .priceList ??
                                                          0,
                                                      ledgerId: widget
                                                          .data
                                                          .party
                                                          .ledgerId,
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),

                                          w8,

                                          /// CATEGORY
                                          Expanded(
                                            child:
                                                StreamBuilder<
                                                  List<CategoryModel>
                                                >(
                                                  stream: sl<ItemMasterSync>()
                                                      .categoryList(
                                                        widget
                                                                .data
                                                                .data
                                                                .company
                                                                .id ??
                                                            0,
                                                      ),
                                                  builder: (_, snapshot) {
                                                    final categories =
                                                        snapshot.data
                                                            ?.map(
                                                              (e) =>
                                                                  e.catgoryName,
                                                            )
                                                            .toList() ??
                                                        ['All'];

                                                    return CustomDropdown<
                                                      String
                                                    >(
                                                      items: categories,
                                                      hintText: appLocalization
                                                          .order_booking_add_item_select_category,
                                                      onChanged: (v) {
                                                        provider.selectCategory(
                                                          v ?? 'All',
                                                        );

                                                        provider
                                                            .resetPagination();
                                                        provider.loadNextPage(
                                                          companyId: widget
                                                              .data
                                                              .data
                                                              .company
                                                              .id!,
                                                          priceListId:
                                                              widget
                                                                  .data
                                                                  .party
                                                                  .priceList ??
                                                              0,
                                                          ledgerId: widget
                                                              .data
                                                              .party
                                                              .ledgerId,
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  /// ================= ITEMS =================
                                  SliverList(
                                    delegate: SliverChildBuilderDelegate(
                                      (context, index) {
                                        if (index ==
                                            provider.pagedItems.length) {
                                          return const Padding(
                                            padding: EdgeInsets.all(16),
                                            child: Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          );
                                        }

                                        final item = provider.pagedItems[index];

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
                                            item: item,
                                            data: widget.data,
                                            name: item.itemName,
                                            stock: 0,
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
                                          provider.pagedItems.length +
                                          (provider.hasMore ? 1 : 0),
                                    ),
                                  ),

                                  const SliverToBoxAdapter(
                                    child: SizedBox(height: 120),
                                  ),
                                ],
                              ),
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
                      buttonText: transactionProvider.selectedItemCount
                          .toString(),
                      isborderEnable: false,
                      onTap: () => Navigator.of(context).pop(),
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
    );
  }
}
