import 'package:mpos_beat/core/utils/imports.dart';

class CouponDiscountWidget extends StatefulWidget {
  const CouponDiscountWidget({super.key});

  @override
  State<CouponDiscountWidget> createState() => _CouponDiscountWidgetState();
}

class _CouponDiscountWidgetState extends State<CouponDiscountWidget> {
  String? selectedType;
  final TextEditingController couponDiscountController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppAssets.coupon,
                    height: context.getSize.height * 0.030,
                  ),
                  w6,
                  Text(
                    "Apply Coupon Discount",
                    style: context.textStyle.s12.w500.indigoBlue.roboto,
                  ),
                ],
              ),
              h16,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Coupon Discount",
                    style: context.textStyle.s10.w400.indigoBlue.roboto,
                  ),
                  SizedBox(
                    width: context.getSize.width / 3,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: context.textStyle.s10.w500.indigoBlue.roboto,
                      controller: couponDiscountController,
                      decoration: InputDecoration(
                        isCollapsed: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: ColorResources.mistGray,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: ColorResources.mistGray,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              h24,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        onTap: () {
                          final discountdata = CoupondiscountData(
                            discountAmount: couponDiscountController.text,
                          );
                          Navigator.pop(context, discountdata);
                          print(
                            "coupen discount data ${discountdata.discountAmount}",
                          );
                        },
                        buttonText: "Save",
                        textStyle: context.textStyle.s12.w500.white.roboto,
                        isborderEnable: false,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    w10,
                    Expanded(
                      child: CustomButton(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        buttonText: appLocalizations.cancel,
                        textStyle: context.textStyle.s12.w500.white.roboto,
                        isborderEnable: false,
                        color: ColorResources.bluishGray,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ],
                ),
              ),
              h10,
            ],
          ),
        ),
      ),
    );
  }
}

class CoupondiscountData {
  final String? discountAmount;

  CoupondiscountData({this.discountAmount});
}
