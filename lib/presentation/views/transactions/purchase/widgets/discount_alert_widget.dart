import 'package:mpos_beat/core/utils/imports.dart';

class DiscountAlertWidget extends StatefulWidget {
  const DiscountAlertWidget({super.key});

  @override
  State<DiscountAlertWidget> createState() => _DiscountAlertWidgetState();
}

class _DiscountAlertWidgetState extends State<DiscountAlertWidget> {
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
            Icon(
              Icons.confirmation_num_outlined,
              color: ColorResources.indigoBlue,
              size: context.getSize.height * 0.030,
            ),
            w6,
            Text(
              appLocalizations.discount_alert_discount_type,
              style: context.textStyle.s12.w500.indigoBlue.roboto,
            ),
          ],
        ),
        h16,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedType = "Amount";
                });
              },
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: selectedType == "Amount"
                            ? ColorResources.oceanBlue
                            : ColorResources.bluishGray,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selectedType == "Amount"
                              ? ColorResources.amber
                              : ColorResources.bluishGray,
                        ),
                      ),
                    ),
                  ),
                  w6,
                  Text(
                    appLocalizations.amount,
                    style: context.textStyle.s12.w300.bluishGray.roboto,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedType = "Percentage";
                });
              },
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: selectedType == "Percentage"
                            ? ColorResources.oceanBlue
                            : ColorResources.bluishGray,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selectedType == "Percentage"
                              ? ColorResources.amber
                              : ColorResources.bluishGray,
                        ),
                      ),
                    ),
                  ),
                  w6,
                  Text(
                    appLocalizations.percentage,
                    style: context.textStyle.s12.w300.bluishGray.roboto,
                  ),
                ],
              ),
            ),
            w24,
          ],
        ),
        h20,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              appLocalizations.discount,
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
                  buttonText: appLocalizations.discount_alert_apply_discount,
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
