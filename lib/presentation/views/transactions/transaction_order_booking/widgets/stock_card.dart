import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/product.dart';
import 'package:mpos_beat/presentation/logic/customer_transaction_provider.dart';
import 'package:mpos_beat/presentation/views/transactions/transaction_order_booking/transaction_order_booking_screen.dart';
import 'package:mpos_beat/presentation/views/transactions/transaction_order_booking/widgets/order_details_widget.dart';

class StockCard extends StatefulWidget {
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
  State<StockCard> createState() => _StockCardState();
}

class _StockCardState extends State<StockCard>
    with AutomaticKeepAliveClientMixin {
  bool _expanded = false;

  @override
  bool get wantKeepAlive => _expanded;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    /// 🔥 Rebuild ONLY when selection state changes
    final isSelected = context.select<CustomerTransactionProvider, bool>(
      (p) => p.isSelected(widget.itemId),
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
                        widget.name,
                        style: context.textStyle.dustyBlue.s12.w500.roboto,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      h4,
                      Row(
                        mainAxisAlignment: .start,
                        children: [
                          Text(
                            "Group :",
                            style: context.textStyle.dustyBlue.s09.w400.roboto,
                          ),
                          w4,
                          Text(
                            widget.item.groupName ?? "",
                            style: context.textStyle.dustyBlue.s09.w400.roboto,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: .start,
                        children: [
                          Text(
                            "Category :",
                            style: context.textStyle.dustyBlue.s09.w400.roboto,
                          ),
                          w4,
                          Text(
                            widget.item.categoryName ?? "",
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
                      "Stock ${widget.stock}",
                      style: context.textStyle.indigoBlue.s12.bold.roboto,
                    ),
                    h4,
                    Row(
                      children: [
                        _info("Tax", "${widget.tax.toStringAsFixed(0)}%"),
                        w12,
                        _info(
                          "Inc Rate",
                          widget.inclRate.toStringAsFixed(
                            widget.data.party.companyId == 1 ? 2 : 3,
                          ),
                        ),
                        w12,
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: _toggleExpand,
                          child: CircleAvatar(
                            radius: 12,
                            backgroundColor: ColorResources.indigoBlue,
                            child: Icon(
                              _expanded
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

            /// ================= DETAILS (LAZY) =================
            AnimatedSize(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOutCubic,
              alignment: Alignment.topCenter,
              child: _expanded
                  ? Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: OrderDetailsWidget(
                        item: widget.item,
                        data: widget.data,
                        companyId: widget.companyId,
                        itemId: widget.itemId,
                        priceListId: widget.priceListId,
                        onDelete: () {
                          context.read<CustomerTransactionProvider>().resetQty(
                            widget.itemId,
                          );
                          setState(() => _expanded = false);
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

  void _toggleExpand() {
    setState(() => _expanded = !_expanded);
  }

  Widget _info(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.textStyle.rosePink.s09.w400.roboto),
        Text(value, style: context.textStyle.rosePink.s09.w400.roboto),
      ],
    );
  }
}
