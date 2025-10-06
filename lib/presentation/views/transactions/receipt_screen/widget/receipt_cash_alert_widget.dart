import 'package:mpos_beat/core/utils/imports.dart';

class ReceiptCashAlertWidget extends StatefulWidget {
  const ReceiptCashAlertWidget({super.key});

  @override
  State<ReceiptCashAlertWidget> createState() => _ReceiptCashAlertWidgetState();
}

class _ReceiptCashAlertWidgetState extends State<ReceiptCashAlertWidget> {
  String? _mode;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                appLocalizations.cash_alert_mode_of_receipt,
                style: context.textStyle.s09.w400.dustyBlue.roboto,
              ),
              GestureDetector(
                onTap: () {
                  setState(() => _mode = "Cash");
                },
                child: Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: _mode == "Cash" ? Colors.indigo : Colors.grey,
                          width: 1.8,
                        ),
                      ),
                      child: _mode == "Cash"
                          ? Center(
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.orange,
                                ),
                              ),
                            )
                          : Center(
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorResources.dustyBlue,
                                ),
                              ),
                            ),
                    ),
                    w6,
                    Text(
                      appLocalizations.cash,
                      style: TextStyle(
                        fontSize: 14,
                        color: _mode == "Cash" ? Colors.indigo : Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() => _mode = "Bank");
                },
                child: Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: _mode == "Bank"
                              ? ColorResources.indigoBlue
                              : ColorResources.dustyBlue,
                          width: 1.8,
                        ),
                      ),
                      child: _mode == "Bank"
                          ? Center(
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorResources.amber,
                                ),
                              ),
                            )
                          : Center(
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorResources.dustyBlue,
                                ),
                              ),
                            ),
                    ),
                    w6,
                    Text(
                      appLocalizations.bank,
                      style: TextStyle(
                        fontSize: 12,
                        color: _mode == "Bank"
                            ? ColorResources.indigoBlue
                            : ColorResources.dustyBlue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          h20,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                appLocalizations.amount,
                style: context.textStyle.s10.w400.indigoBlue.roboto,
              ),
              SizedBox(
                width: context.getSize.width / 2.5,
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: context.textStyle.s10.w500.indigoBlue.roboto,
                  decoration: InputDecoration(
                    // hintText: "20475.00",
                    // hintStyle: context.textStyle.s10.w500.indigoBlue.roboto,
                    isCollapsed: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 7,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
          h30,
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  buttonText: appLocalizations.update,
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
        ],
      ),
    );
  }
}
