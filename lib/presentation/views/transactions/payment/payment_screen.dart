import 'package:mpos_beat/core/utils/custom_dialogs.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_dropdown.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';
import 'package:mpos_beat/presentation/views/transactions/receipt_screen/widget/receipt_cash_alert_widget.dart';
import 'package:mpos_beat/presentation/views/transactions/receipt_screen/widget/receipt_cheque_alert_widget.dart';
import 'package:mpos_beat/presentation/views/transactions/transaction_order_booking/widgets/end_to_end_text_widget.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

final List<Map<String, String>> receipts = [
  {
    "name": "M1B2B-0011/22-23",
    "date": "10.00 Qls",
    "billType": "1800.00/Qls",
    "amount": "18000.00",
  },
  {
    "name": "M1B2B-0012/22-23",
    "date": "10.00 Qls",
    "billType": "1800.00/Qls",
    "amount": "18000.00",
  },
  {
    "name": "M1B2B-0016/22-23",
    "date": "10.00 Qls",
    "billType": "1800.00/Qls",
    "amount": "18000.00",
  },
  {
    "name": "M1B2B-0018/22-23",
    "date": "10.00 Qls",
    "billType": "1800.00/Qls",
    "amount": "18000.00",
  },
];

String? selected;

class _PaymentScreenState extends State<PaymentScreen> {
  final options = ["Cash", "Cheque", "UPI"];
  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: ColorResources.indigoBlue,
            size: context.getSize.height * 0.024,
          ),
        ),
        title: Text(
          appLocalizations.transaction_payment_screen_payment,
          style: context.textStyle.s20.indigoBlue.bold.roboto,
        ),
        centerTitle: true,
        actions: [
          SvgPicture.asset(
            AppAssets.refresh,
            height: context.getSize.height * 0.022,
            colorFilter: const ColorFilter.mode(
              ColorResources.indigoBlue,
              BlendMode.srcIn,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.qr_code, size: context.getSize.height * 0.022),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: h16),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Alackal Stores, Kuruppamthara",
                        style: context.textStyle.s12.w500.indigoBlue.roboto,
                      ),
                      Text(
                        "29-07-2024",
                        style: context.textStyle.s09.w400.dustyBlue.roboto,
                      ),
                    ],
                  ),
                  EndToEndTextWidget(
                    text1: "T23-24/D-AM120",
                    text2:
                        appLocalizations.transaction_payment_screen_outstanding,

                    textStyle2: context.textStyle.s10.dustyBlue.w500.roboto,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "-8689.00",
                        style: context.textStyle.s12.bold.indigoBlue.roboto,
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: ColorResources.bluishGray.withValues(alpha: 0.2),
                  ),
                  h12,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        appLocalizations
                            .transaction_payment_screen_payment_entry,
                        style: context.textStyle.s12.w500.indigoBlue.roboto,
                      ),
                    ],
                  ),
                  h6,
                  Text(
                    appLocalizations.transaction_payment_screen_payment_no,
                    style: context.textStyle.s12.bluishGray.w400.roboto,
                  ),
                  h4,
                  const CustomTextField(
                    hint: "",
                    // controller: compnyController,
                    backgroundColor: ColorResources.lightGray,
                    // autovalidateMode: provider.registerAutovalidateMode,
                    // failure: provider.companyName.getFailure,
                    // inputFormatters: [noEmojiFormatter],
                    // onChange: provider.updateCompanyName,
                    inputType: TextInputType.emailAddress,
                    borderRadius: 12,
                    hintColor: ColorResources.silverGray,
                    borderColor: ColorResources.transparent,
                  ),
                  h16,
                  Text(
                    appLocalizations.transaction_payment_screen_amount,
                    style: context.textStyle.s12.bluishGray.w400.roboto,
                  ),
                  h4,
                  const CustomTextField(
                    hint: "",
                    backgroundColor: ColorResources.lightGray,
                    inputType: TextInputType.emailAddress,
                    borderRadius: 12,
                    hintColor: ColorResources.silverGray,
                    borderColor: ColorResources.transparent,
                  ),
                  h16,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      h6,
                      Text(
                        appLocalizations.transaction_payment_screen_r_mode,
                        style: context.textStyle.s12.bluishGray.w400.roboto,
                      ),
                      h6,
                      Row(
                        children: [
                          ...options.map((option) {
                            final isSelected = selected == option;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selected = option;
                                });
                                CustomDialog.showBottomCustomDialog(
                                  chid: selected == 'Cash'
                                      ? const ReceiptCashAlertWidget()
                                      : selected == 'Cheque'
                                      ? const ReceiptChequeAlertWidget()
                                      : const SizedBox.shrink(),
                                );
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: context.getSize.width * 0.045,
                                    height: context.getSize.height * 0.022,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: isSelected
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
                                          color: isSelected
                                              ? ColorResources.amber
                                              : ColorResources.bluishGray,
                                        ),
                                      ),
                                    ),
                                  ),
                                  w6,
                                  Text(
                                    option,
                                    style: context
                                        .textStyle
                                        .s12
                                        .w400
                                        .bluishGray
                                        .roboto,
                                  ),
                                  w40,
                                ],
                              ),
                            );
                          }),
                        ],
                      ),
                      h10,
                    ],
                  ),
                  CustomDropdown(
                    label: appLocalizations.transaction_payment_screen_account,
                    items: const [],
                    hintText: "",
                    // value: selectedReportingTo,
                    // autovalidateMode: provider.userCreateAutovalidateMode,
                    // failure: provider.reportingTo.getFailure,
                    onChanged: (value) {
                      // setState(() => selectedReportingTo = value);
                      // provider.updateReportingTo(value ?? '');
                    },
                  ),
                  h16,
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              appLocalizations
                                  .transaction_payment_screen_cheque_no,
                              style:
                                  context.textStyle.s12.bluishGray.w400.roboto,
                            ),
                            h4,
                            const CustomTextField(
                              hint: "",
                              backgroundColor: ColorResources.lightGray,
                              inputType: TextInputType.emailAddress,
                              borderRadius: 12,
                              hintColor: ColorResources.silverGray,
                              borderColor: ColorResources.transparent,
                            ),
                          ],
                        ),
                      ),
                      w4,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              appLocalizations
                                  .transaction_payment_screen_cheque_date,
                              style:
                                  context.textStyle.s12.bluishGray.w400.roboto,
                            ),
                            h10,
                            const CustomTextField(
                              hint: "",
                              backgroundColor: ColorResources.lightGray,
                              inputType: TextInputType.emailAddress,
                              borderRadius: 12,
                              hintColor: ColorResources.silverGray,
                              borderColor: ColorResources.transparent,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  h16,
                  Text(
                    appLocalizations.transaction_payment_screen_bank_name,
                    style: context.textStyle.s12.bluishGray.w400.roboto,
                  ),
                  h4,
                  const CustomTextField(
                    hint: "",
                    backgroundColor: ColorResources.lightGray,
                    inputType: TextInputType.emailAddress,
                    borderRadius: 12,
                    hintColor: ColorResources.silverGray,
                    borderColor: ColorResources.transparent,
                  ),
                  h16,
                  Text(
                    appLocalizations.transaction_payment_screen_branch_name,
                    style: context.textStyle.s12.bluishGray.w400.roboto,
                  ),
                  h4,
                  const CustomTextField(
                    hint: "",
                    backgroundColor: ColorResources.lightGray,
                    inputType: TextInputType.emailAddress,
                    borderRadius: 12,
                    hintColor: ColorResources.silverGray,
                    borderColor: ColorResources.transparent,
                  ),
                  h16,
                  Text(
                    appLocalizations.transaction_payment_screen_narration,
                    style: context.textStyle.s12.bluishGray.w400.roboto,
                  ),
                  h4,
                  const CustomTextField(
                    hint: "",

                    backgroundColor: ColorResources.white,
                    inputType: TextInputType.emailAddress,
                    borderRadius: 12,
                    hintColor: ColorResources.silverGray,
                    borderColor: ColorResources.ashGray,
                    maxLines: 4,
                    minLines: 3,
                  ),
                  h16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: ColorResources.rosePink,
                        ),
                        child: Center(
                          child: Text(
                            appLocalizations
                                .transaction_payment_screen_add_bills,
                            style: context.textStyle.s10.white.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          appLocalizations.name,
                          style: context.textStyle.s10.w500.dustyBlue.roboto,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          appLocalizations.date,
                          textAlign: TextAlign.center,
                          style: context.textStyle.s10.w500.dustyBlue.roboto,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          appLocalizations.bill_type,
                          textAlign: TextAlign.center,
                          style: context.textStyle.s10.w500.dustyBlue.roboto,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          appLocalizations.amount,
                          textAlign: TextAlign.end,
                          style: context.textStyle.s10.w500.dustyBlue.roboto,
                        ),
                      ),
                    ],
                  ),
                  h4,
                  Divider(
                    thickness: 1,
                    color: ColorResources.bluishGray.withValues(alpha: 0.2),
                  ),
                  h4,
                  ...receipts.map((receipt) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  receipt["name"]!,
                                  style: context
                                      .textStyle
                                      .s09
                                      .w500
                                      .dustyBlue
                                      .roboto,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  receipt["date"]!,
                                  textAlign: TextAlign.center,
                                  style: context
                                      .textStyle
                                      .s09
                                      .w500
                                      .dustyBlue
                                      .roboto,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  receipt["billType"]!,
                                  textAlign: TextAlign.center,
                                  style: context
                                      .textStyle
                                      .s09
                                      .w500
                                      .dustyBlue
                                      .roboto,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  receipt["amount"]!,
                                  textAlign: TextAlign.end,
                                  style: context
                                      .textStyle
                                      .s09
                                      .w500
                                      .dustyBlue
                                      .roboto,
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 1,
                            color: ColorResources.bluishGray.withValues(
                              alpha: 0.2,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      w2,
                      SizedBox(
                        width: context.getSize.width / 2.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Text(
                              "Advance :",
                              style:
                                  context.textStyle.s12.w500.indigoBlue.roboto,
                            ),
                            // w60,
                            Text(
                              "0.00",
                              style:
                                  context.textStyle.s12.w500.indigoBlue.roboto,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  h26,
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          buttonText: appLocalizations.submit,
                          textStyle: context.textStyle.s12.w500.white.roboto,
                          onTap: () {
                            Navigator.pop(context);
                          },
                          isborderEnable: false,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      w10,
                      Expanded(
                        child: CustomButton(
                          buttonText: appLocalizations.cancel,
                          isborderEnable: false,
                          color: ColorResources.bluishGray,
                          textStyle: context.textStyle.s12.w500.white.roboto,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
