import 'package:mpos_beat/core/utils/imports.dart';

class ApplyCouponWidget extends StatefulWidget {
  const ApplyCouponWidget({super.key});

  @override
  State<ApplyCouponWidget> createState() => _ApplyCouponWidgetState();
}

class _ApplyCouponWidgetState extends State<ApplyCouponWidget> {
  String? selectedType;
  final TextEditingController discountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppAssets.coupon,
              height: context.getSize.height * 0.030,
              // colorFilter: ColorFilter.mode(
              //   ColorResources.indigoBlue,
              //   BlendMode.srcIn,
              // ),
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
                decoration: InputDecoration(
                  // hintText: "20475.00",
                  // hintStyle: context.textStyle.s10.w500.indigoBlue.roboto,
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
                    Navigator.pop(context);
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
    );
  }
}
