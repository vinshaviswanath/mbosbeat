import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/product.dart';
import 'package:mpos_beat/presentation/logic/customer_transaction_provider.dart';
import 'package:mpos_beat/presentation/views/transactions/transaction_order_booking/transaction_order_booking_screen.dart';
import 'package:mpos_beat/presentation/views/transactions/transaction_order_booking/widgets/order_details_widget.dart';

class StockCard extends StatelessWidget {
  final int itemId;
  final int priceListId;
  final String name;
  final int stock;
  final double mrp;
  final double tax;
  final double inclRate;
  final int companyId;
  final TransactionOrderBookingRouteArgs data;
  final Product item;

  const StockCard({
    super.key,
    required this.itemId,
    required this.priceListId,
    required this.name,
    required this.stock,
    required this.mrp,
    required this.tax,
    required this.inclRate,
    required this.companyId,
    required this.data,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    /// 🔥 Selection listener (rebuild only when needed)
    final isSelected = context.select<CustomerTransactionProvider, bool>(
      (p) => p.isSelected(itemId),
    );

    /// 🔥 Expansion listener (ID based — stable)
    final isExpanded = context.select<CustomerTransactionProvider, bool>(
      (p) => p.expandedItemId == itemId,
    );

    return RepaintBoundary(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        decoration: BoxDecoration(
          color: ColorResources.lightGray,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? ColorResources.indigoBlue
                : ColorResources.transparent,
            width: 1.5,
          ),
        ),
        child: Column(
          children: [
            /// ================= HEADER =================
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// LEFT
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: context.textStyle.dustyBlue.s12.w500.roboto,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      h4,
                      Row(
                        children: [
                          Text(
                            "Group :",
                            style: context.textStyle.dustyBlue.s09.w400.roboto,
                          ),
                          w4,
                          Text(
                            item.groupName ?? "",
                            style: context.textStyle.dustyBlue.s09.w400.roboto,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Category :",
                            style: context.textStyle.dustyBlue.s09.w400.roboto,
                          ),
                          w4,
                          Text(
                            item.categoryName ?? "",
                            style: context.textStyle.dustyBlue.s09.w400.roboto,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                /// RIGHT
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Stock $stock",
                      style: context.textStyle.indigoBlue.s12.bold.roboto,
                    ),
                    h4,
                    Row(
                      children: [
                        _info(context, "Tax", "${tax.toStringAsFixed(0)}%"),
                        w12,
                        _info(
                          context,
                          "Inc Rate",
                          inclRate.toStringAsFixed(
                            data.party.companyId == 1 ? 2 : 3,
                          ),
                        ),
                        w12,
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            context
                                .read<CustomerTransactionProvider>()
                                .toggleExpanded(itemId);
                          },
                          child: CircleAvatar(
                            radius: 12,
                            backgroundColor: ColorResources.indigoBlue,
                            child: Icon(
                              isExpanded
                                  ? Icons.keyboard_arrow_up_rounded
                                  : Icons.keyboard_arrow_down_rounded,
                              color: ColorResources.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            /// ================= DETAILS =================
            AnimatedSize(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOutCubic,
              alignment: Alignment.topCenter,
              child: isExpanded
                  ? Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: OrderDetailsWidget(
                        item: item,
                        data: data,
                        companyId: companyId,
                        itemId: itemId,
                        priceListId: priceListId,
                        onDelete: () {
                          context.read<CustomerTransactionProvider>().resetQty(
                            itemId,
                          );

                          context
                              .read<CustomerTransactionProvider>()
                              .collapseExpanded();
                        },
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _info(BuildContext context, String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.textStyle.rosePink.s09.w400.roboto),
        Text(value, style: context.textStyle.rosePink.s09.w400.roboto),
      ],
    );
  }
}
