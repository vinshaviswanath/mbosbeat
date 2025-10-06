import 'package:mpos_beat/core/utils/imports.dart';

class OrderDetailsWidget extends StatelessWidget {
  const OrderDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalization = context.l10n;
    return Container(
      decoration: const BoxDecoration(color: ColorResources.lightGray),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appLocalization.order_detail_widget_order_qty,
                    style: context.textStyle.s10.w400.indigoBlue.roboto
                        .copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: context.textStyle.indigoBlue.color,
                        ),
                  ),
                 h4,
                  Row(
                    children: [
                      Container(
                        width: 60,
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorResources.mistGray),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "5",
                            style: context.textStyle.s10.w500.dustyBlue.roboto,
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
                          border: Border.all(color: ColorResources.mistGray),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Text(
                              appLocalization.order_detail_widget_nos,
                              style:
                                  context.textStyle.s10.w300.dustyBlue.roboto,
                            ),
                            w4,
                            const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: ColorResources.dustyBlue,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                      w6,
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: ColorResources.bluishGray,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.remove,
                                color: ColorResources.white,
                                size: 14,
                              ),
                            ),
                          ),
                          h4,
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: ColorResources.bluishGray,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: const Center(
                              child: Icon(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appLocalization.rate,
                    style: context.textStyle.s10.w400.indigoBlue.roboto
                        .copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: context.textStyle.indigoBlue.color,
                        ),
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
                      "5000",
                      style: context.textStyle.s10.w500.dustyBlue.roboto,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appLocalization.discount,
                    style: context.textStyle.s10.w400.indigoBlue.roboto
                        .copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: context.textStyle.indigoBlue.color,
                        ),
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
                      "5%",
                      style: context.textStyle.s10.w500.dustyBlue.roboto,
                    ),
                  ),
                ],
              ),
            ],
          ),
          h12,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appLocalization.free_qty,
                    style: context.textStyle.s10.w400.indigoBlue.roboto
                        .copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: context.textStyle.indigoBlue.color,
                        ),
                  ),
                  h4,
                  Row(
                    children: [
                      Container(
                        width: 60,
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorResources.mistGray),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "5",
                            style: context.textStyle.s10.w500.dustyBlue.roboto,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorResources.mistGray),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Text(
                              appLocalization.order_detail_widget_nos,
                              style:
                                  context.textStyle.s10.w300.dustyBlue.roboto,
                            ),
                            w4,
                            const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: ColorResources.dustyBlue,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              /// Total
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    appLocalization.order_detail_widget_total,
                    style: context.textStyle.s10.w400.indigoBlue.roboto,
                  ),
                  Text(
                    "9000.00",
                    style: context.textStyle.s14.bold.dustyBlue.roboto,
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: ColorResources.crimsonRed,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}