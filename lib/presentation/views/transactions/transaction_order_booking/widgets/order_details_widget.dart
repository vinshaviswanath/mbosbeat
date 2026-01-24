import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/presentation/logic/customer_transaction_provider.dart';

class OrderDetailsWidget extends StatelessWidget {
  final int companyId;
  final int itemId;
  final int priceListId;
  final double inclRate;
  final VoidCallback? onDelete;

  const OrderDetailsWidget({
    super.key,
    required this.companyId,
    required this.itemId,
    required this.priceListId,
    required this.inclRate,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    Logger.logInfo("Company Id ::: $companyId");

    final appLocalization = context.l10n;
    final provider = context.watch<CustomerTransactionProvider>();
    final qty = provider.getQty(itemId);
    final appDb = sl<AppDb>();

    return StreamBuilder<ItemPriceDetailsTable?>(
      stream: appDb.priceListDetailsDao.watchItemPriceByQty(
        itemId: itemId,
        priceListId: priceListId,
        quantity: qty.toDouble(),
      ),
      builder: (context, snapshot) {
        final slab = snapshot.data;

        final double rate = slab?.rate ?? 0;
        final double discount = slab?.discount ?? 0;
        // final double freeQty = slab?.freeQty ?? 0;
        final double total = qty * inclRate;

        return Container(
          decoration: const BoxDecoration(color: ColorResources.lightGray),
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// ------------------ QTY / RATE / DISCOUNT ------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// ORDER QTY
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appLocalization.order_detail_widget_order_qty,
                        style: context.textStyle.s10.w400.indigoBlue.roboto
                            .copyWith(decoration: TextDecoration.underline),
                      ),
                      h4,
                      Row(
                        children: [
                          Container(
                            width: context.getSize.width * 0.13,
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorResources.mistGray,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                qty.toString(),
                                style:
                                    context.textStyle.s10.w500.dustyBlue.roboto,
                              ),
                            ),
                          ),
                          w6,
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () => provider.decrementQty(itemId),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorResources.bluishGray,
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  child: const Icon(
                                    Icons.remove,
                                    color: ColorResources.white,
                                    size: 14,
                                  ),
                                ),
                              ),
                              h4,
                              GestureDetector(
                                onTap: () => provider.incrementQty(itemId),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorResources.bluishGray,
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: ColorResources.white,
                                    size: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  /// RATE
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appLocalization.rate,
                        style: context.textStyle.s10.w400.indigoBlue.roboto
                            .copyWith(decoration: TextDecoration.underline),
                      ),
                      h4,
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorResources.mistGray),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          rate.toStringAsFixed(2),
                          style: context.textStyle.s10.w500.dustyBlue.roboto,
                        ),
                      ),
                    ],
                  ),

                  /// DISCOUNT
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appLocalization.discount,
                        style: context.textStyle.s10.w400.indigoBlue.roboto
                            .copyWith(decoration: TextDecoration.underline),
                      ),
                      h4,
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorResources.mistGray),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          discount > 0 ? "$discount%" : "0%",
                          style: context.textStyle.s10.w500.dustyBlue.roboto,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              h12,

              /// ------------------ FREE QTY / TOTAL / DELETE ------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// FREE QTY
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appLocalization.free_qty,
                        style: context.textStyle.s10.w400.indigoBlue.roboto
                            .copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  context.textStyle.indigoBlue.color,
                            ),
                      ),
                      h4,
                      Row(
                        children: [
                          // Container(
                          //   width: context.getSize.width * 0.13,
                          //   // width: 60,
                          //   padding: const EdgeInsets.symmetric(vertical: 6),
                          //   decoration: BoxDecoration(
                          //     border: Border.all(color: ColorResources.mistGray),
                          //     borderRadius: BorderRadius.circular(20),
                          //   ),
                          //   child: Center(
                          //     child: Text(
                          //       "5",
                          //       style: context.textStyle.s10.w500.dustyBlue.roboto,
                          //     ),
                          //   ),
                          // ),
                          Container(
                            width: context.getSize.width * 0.13,
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorResources.mistGray,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: TextField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                style:
                                    context.textStyle.s10.w500.dustyBlue.roboto,
                                // maxLength: 2,
                                decoration: const InputDecoration(
                                  isCollapsed: true,
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 4,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),

                          w6,
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorResources.mistGray,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  appLocalization.order_detail_widget_nos,
                                  style: context
                                      .textStyle
                                      .s10
                                      .w300
                                      .dustyBlue
                                      .roboto,
                                ),
                                w4,
                                Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: ColorResources.dustyBlue,
                                  size: context.getSize.height * 0.016,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  /// TOTAL
                  Row(
                    children: [
                      Text(
                        appLocalization.order_detail_widget_total,
                        style: context.textStyle.s10.w400.indigoBlue.roboto,
                      ),
                      w8,
                      Text(
                        total.toStringAsFixed(2),
                        style: context.textStyle.s14.bold.dustyBlue.roboto,
                      ),
                    ],
                  ),

                  /// DELETE
                  IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: ColorResources.crimsonRed,
                    ),
                    onPressed: () {
                      provider.resetQty(itemId);
                      onDelete?.call();
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
