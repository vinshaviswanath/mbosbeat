import 'package:mpos_beat/core/utils/imports.dart';

class AutoReceiptModeAlertWidget extends StatefulWidget {
  const AutoReceiptModeAlertWidget({super.key});

  @override
  State<AutoReceiptModeAlertWidget> createState() =>
      _AutoReceiptModeAlertWidgetState();
}

class _AutoReceiptModeAlertWidgetState
    extends State<AutoReceiptModeAlertWidget> {
  String? selectedType;
  final amountController = TextEditingController();
  final referenceController = TextEditingController();
  final chequeNoController = TextEditingController();
  final chequeDateController = TextEditingController();

  DateTime? selectedChequeDate;
  Future<void> _pickChequeDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        selectedChequeDate = picked;
        chequeDateController.text =
            "${picked.day}/${picked.month}/${picked.year}";
      });
    }
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
              Text(
                appLocalizations.payment_mode_alert_select_payment_mode,
                style: context.textStyle.s12.w500.indigoBlue.roboto,
              ),
              h20,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedType = "Cash";
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
                              color: selectedType == "Cash"
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
                                color: selectedType == "Cash"
                                    ? ColorResources.amber
                                    : ColorResources.bluishGray,
                              ),
                            ),
                          ),
                        ),
                        w6,
                        Text(
                          appLocalizations.cash,
                          style: context.textStyle.s12.w300.bluishGray.roboto,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedType = "UPI";
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
                              color: selectedType == "UPI"
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
                                color: selectedType == "UPI"
                                    ? ColorResources.amber
                                    : ColorResources.bluishGray,
                              ),
                            ),
                          ),
                        ),
                        w6,
                        Text(
                          appLocalizations.upi,
                          style: context.textStyle.s12.w300.bluishGray.roboto,
                        ),
                      ],
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedType = "Cheque";
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
                              color: selectedType == "Cheque"
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
                                color: selectedType == "Cheque"
                                    ? ColorResources.amber
                                    : ColorResources.bluishGray,
                              ),
                            ),
                          ),
                        ),
                        w6,
                        Text(
                          appLocalizations.cheque,
                          style: context.textStyle.s12.w300.bluishGray.roboto,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              h14,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    appLocalizations.amount,
                    style: context.textStyle.s10.w400.indigoBlue.roboto,
                  ),
                  w60,

                  Expanded(
                    child: TextField(
                      controller: amountController,
                      style: context.textStyle.s09.w400.dustyBlue.roboto,
                      decoration: InputDecoration(
                        hintText: "",
                        hintStyle: context.textStyle.s09.w400.dustyBlue.roboto,
                        isCollapsed: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: ColorResources.mistGray,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: ColorResources.mistGray,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: ColorResources.mistGray,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              if (selectedType == "UPI") ...[
                h14,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Reference",
                      style: context.textStyle.s10.w400.indigoBlue.roboto,
                    ),
                    w48,

                    Expanded(
                      child: TextField(
                        controller: referenceController,
                        style: context.textStyle.s09.w400.dustyBlue.roboto,
                        decoration: InputDecoration(
                          hintText: "",

                          hintStyle:
                              context.textStyle.s09.w400.dustyBlue.roboto,
                          isCollapsed: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: ColorResources.mistGray,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: ColorResources.mistGray,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: ColorResources.mistGray,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
              if (selectedType == "Cheque") ...[
                h14,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Cheque No",
                      style: context.textStyle.s10.w400.indigoBlue.roboto,
                    ),
                    w40,

                    Expanded(
                      child: TextField(
                        controller: chequeNoController,
                        style: context.textStyle.s09.w400.dustyBlue.roboto,
                        decoration: InputDecoration(
                          hintText: "",

                          hintStyle:
                              context.textStyle.s09.w400.dustyBlue.roboto,
                          isCollapsed: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: ColorResources.mistGray,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: ColorResources.mistGray,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: ColorResources.mistGray,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                h14,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Cheque date",
                      style: context.textStyle.s10.w400.indigoBlue.roboto,
                    ),
                    w32,

                    Expanded(
                      child: TextField(
                        onTap: _pickChequeDate,
                        controller: chequeDateController,
                        readOnly: true,
                        style: context.textStyle.s09.w400.dustyBlue.roboto,
                        decoration: InputDecoration(
                          hintText: "",
                          suffixIcon: const Icon(
                            Icons.calendar_today,
                            size: 16,
                          ),
                          hintStyle:
                              context.textStyle.s09.w400.dustyBlue.roboto,
                          isCollapsed: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: ColorResources.mistGray,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: ColorResources.mistGray,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: ColorResources.mistGray,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
              h30,
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      onTap: () {
                        final paymentData = AutoReceiptData(
                          paymentMode: selectedType,
                          amount: double.tryParse(amountController.text),
                          upiReference: referenceController.text,
                          chequeNumber: chequeNoController.text,
                          chequeDate: selectedChequeDate,
                        );

                        Navigator.pop(context, paymentData);
                      },
                      buttonText: appLocalizations.save,
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
        ),
      ),
    );
  }
}

class AutoReceiptData {
  final String? paymentMode;
  final double? amount;
  final String? upiReference;
  final String? chequeNumber;
  final DateTime? chequeDate;

  AutoReceiptData({
    this.paymentMode,
    this.amount,
    this.upiReference,
    this.chequeNumber,
    this.chequeDate,
  });
}
