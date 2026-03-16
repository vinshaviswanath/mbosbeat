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
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedType = "Percentage";
  }

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
                          width: context.getSize.width * 0.045,
                          height: context.getSize.height * 0.022,
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
                              width: context.getSize.width * 0.0225,
                              height: context.getSize.height * 0.01,
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
                          width: context.getSize.width * 0.045,
                          height: context.getSize.height * 0.022,
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
                              width: context.getSize.width * 0.0225,
                              height: context.getSize.height * 0.01,
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
                      controller: discountController,
                      style: context.textStyle.s10.w500.indigoBlue.roboto,
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
                          final discountData = DiscountData(
                            type: selectedType,
                            amount:
                                double.tryParse(discountController.text) ?? 0.0,
                          );
                          Navigator.pop(context, discountData);
                          print("discount data ${discountData.amount}");
                        },
                        buttonText:
                            appLocalizations.discount_alert_apply_discount,
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

class DiscountData {
  final String? type;
  final double? amount;

  DiscountData({required this.type, required this.amount});
}
