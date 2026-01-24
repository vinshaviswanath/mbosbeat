import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_dropdown.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';
import 'package:mpos_beat/presentation/logic/item_filter_provider.dart';
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

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    final itemFilterProvider = context.watch<ItemFilterProvider>();

    final selectedPriceListId = userProvider.selectedPriceLevelId;
    final rateInclusive = userProvider.rateInclusive;

    final appDb = sl<AppDb>();
    final appLocalizations = context.l10n;

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.keyboard_arrow_left),
              onPressed: () => Navigator.pop(context),
            ),
            title: Column(
              children: [
                Text(
                  "${widget.data.party.ledgerName}",
                  style: context.textStyle.s20.indigoBlue.bold.roboto,
                ),
                Text(
                  "Order Value : 0.00",
                  style: context.textStyle.s12.dustyBlue.w500.roboto,
                ),
              ],
            ),
            centerTitle: true,
            toolbarHeight: 65,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    /// 🔍 Search
                    CustomTextField(
                      onChange: (value) {
                        _debounce?.cancel();
                        _debounce = Timer(
                          const Duration(milliseconds: 300),
                          () => itemFilterProvider.updateSearch(value),
                        );
                      },
                      hint: appLocalizations.manage_user_screen_search_user,
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
                    h10,

                    /// 🔹 Filters
                    Row(
                      children: [
                        Expanded(
                          child: StreamBuilder<List<String>>(
                            stream: itemFilterProvider.groupStream,
                            builder: (_, snapshot) {
                              return CustomDropdown(
                                items: snapshot.data ?? ['All'],
                                hintText: appLocalizations
                                    .order_booking_add_item_select_group,
                                onChanged: (v) =>
                                    itemFilterProvider.selectGroup(v ?? 'All'),
                              );
                            },
                          ),
                        ),
                        w8,
                        Expanded(
                          child: StreamBuilder<List<String>>(
                            stream: itemFilterProvider.categoryStream,
                            builder: (_, snapshot) {
                              return CustomDropdown(
                                items: snapshot.data ?? ['All'],
                                hintText: appLocalizations
                                    .order_booking_add_item_select_category,
                                onChanged: (v) => itemFilterProvider
                                    .selectCategory(v ?? 'All'),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// 🔹 ITEM LIST
              Expanded(
                child: selectedPriceListId == null
                    ? const Center(child: Text("Please select a Price Level"))
                    : StreamBuilder<List<ItemPriceDetailsTable>>(
                        stream: appDb.priceListDetailsDao.watchAll(),
                        builder: (context, priceSnap) {
                          final priceDetails = priceSnap.data ?? [];

                          return StreamBuilder<List<ItemMasterData>>(
                            stream: itemFilterProvider.filteredItems,
                            builder: (context, itemSnap) {
                              if (!itemSnap.hasData) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }

                              final items = itemSnap.data!;
                              if (items.isEmpty) {
                                return const Center(
                                  child: Text("No items found"),
                                );
                              }

                              return ListView.separated(
                                itemCount: items.length,
                                separatorBuilder: (_, __) => Divider(
                                  thickness: 1,
                                  color: ColorResources.bluishGray.withValues(
                                    alpha: 0.2,
                                  ),
                                ),
                                itemBuilder: (context, index) {
                                  final item = items[index];

                                  /// 🔹 Match price by itemId + priceList
                                  ItemPriceDetailsTable? price;

                                  for (final p in priceDetails) {
                                    if (p.itemId == item.stockItemId &&
                                        p.priceList == selectedPriceListId) {
                                      price = p;
                                      break;
                                    }
                                  }

                                  double inclRate = 0;

                                  if (price != null && price.rate != null) {
                                    final double rate = price.rate!;
                                    final double tax = item.taxPercent ?? 0;

                                    inclRate = rateInclusive
                                        ? rate
                                        : rate + (rate * tax / 100);
                                  }

                                  return StockCard(
                                    name: item.itemName,
                                    stock: 0,
                                    mrp: price?.rate ?? 0.00,
                                    tax: item.taxPercent ?? 0,
                                    inclRate: inclRate,
                                    companyId: widget.data.data.company.id ?? 0,
                                    itemId: item.stockItemId,
                                    priceListId: selectedPriceListId,
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            color: ColorResources.white,
            padding: .all(16),
            width: context.getSize.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          appLocalizations.grand_total,
                          style: context.textStyle.indigoBlue.s12.w500.roboto,
                        ),
                        Text(
                          "72000.00",
                          style: context.textStyle.indigoBlue.s20.bold.roboto,
                        ),
                      ],
                    ),
                    CustomButton(
                      buttonText: "",
                      isborderEnable: false,
                      width: context.getSize.width / 2.5,
                      borderRadius: BorderRadius.circular(16),
                      icon: Icons.shopping_cart,
                      iconSize: 30,
                      iconColor: ColorResources.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// class SliverListExample extends StatelessWidget {
//   const SliverListExample({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final items = [
//       {
//         "name": "Black & Broken Rice",
//         "category": "Category Name",
//         "stock": 0,
//         "mrp": 2000.0,
//         "tax": 18.0,
//         "inclRate": 1800.0,
//       },
//       {
//         "name": "Premium Rice",
//         "category": "Category A",
//         "stock": 12,
//         "mrp": 2500.0,
//         "tax": 12.0,
//         "inclRate": 2300.0,
//       },
//     ];

//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           const SliverAppBar(
//             floating: true,
//             pinned: true,
//             title: Text("Stocks"),
//           ),
//           SliverList(
//             delegate: SliverChildBuilderDelegate((context, index) {
//               final item = items[index];
//               return StockCard(
//                 name: item["name"] as String,
//                 category: item["category"] as String,
//                 stock: item["stock"] as int,
//                 mrp: item["mrp"] as double,
//                 tax: item["tax"] as double,
//                 inclRate: item["inclRate"] as double,
//               );
//             }, childCount: items.length),
//           ),
//         ],
//       ),
//     );
//   }
// }
