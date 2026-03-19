import 'package:drift/drift.dart' show Value;

import 'package:intl/intl.dart';
import 'package:mpos_beat/core/utils/custom_dialogs.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_dropdown.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';
import 'package:mpos_beat/presentation/views/transactions/receipt_screen/widget/receipt_cash_alert_widget.dart';
import 'package:mpos_beat/presentation/views/transactions/receipt_screen/widget/receipt_cheque_alert_widget.dart';
import 'package:mpos_beat/presentation/views/transactions/transaction_order_booking/transaction_order_booking_screen.dart';
import 'package:mpos_beat/presentation/views/transactions/transaction_order_booking/widgets/end_to_end_text_widget.dart';

class ReceiptScreen extends StatefulWidget {
  final TransactionOrderBookingRouteArgs data;
  const ReceiptScreen({super.key, required this.data});

  @override
  State<ReceiptScreen> createState() => _ReceiptScreenState();
}

class _ReceiptScreenState extends State<ReceiptScreen> {
  String? selected;
  final options = ["Cash", "Cheque", "UPI"];

  final TextEditingController receiptnoController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController narrationController = TextEditingController();
  final TextEditingController chequeNoController = TextEditingController();
  final TextEditingController chequeDateController = TextEditingController();
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController referenceController = TextEditingController();
  final TextEditingController branchNameController = TextEditingController();
  final TextEditingController advanceController = TextEditingController();
  double advanceAmount = 0.0;
  @override
  void initState() {
    super.initState();

    amountController.addListener(() {
      final value = double.tryParse(amountController.text) ?? 0.0;

      setState(() {
        advanceAmount = value;
      });
    });
  }

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
          appLocalizations.receipt_screen_receipt,
          style: context.textStyle.s20.indigoBlue.bold.roboto,
        ),
        centerTitle: true,
        // actions: [
        //   SvgPicture.asset(
        //     AppAssets.refresh,
        //     height: context.getSize.height * 0.022,
        //     colorFilter: const ColorFilter.mode(
        //       ColorResources.indigoBlue,
        //       BlendMode.srcIn,
        //     ),
        //   ),
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(Icons.qr_code, size: context.getSize.height * 0.022),
        //   ),
        // ],
        // toolbarHeight: 65,
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
                        widget.data.party.ledgerName ?? "",
                        style: context.textStyle.s12.w500.indigoBlue.roboto,
                      ),
                      Text(
                        DateTime.now().toString().split(" ").first,
                        style: context.textStyle.s09.w400.dustyBlue.roboto,
                      ),
                    ],
                  ),
                  EndToEndTextWidget(
                    text1: widget.data.party.taxNumber ?? "",
                    text2:
                        appLocalizations.transaction_payment_screen_outstanding,
                    textStyle2: context.textStyle.s10.dustyBlue.w500.roboto,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget.data.party.closingBalance.toString(),
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
                        appLocalizations.receipt_screen_receipt_entry,
                        style: context.textStyle.s12.w500.indigoBlue.roboto,
                      ),
                    ],
                  ),
                  h6,
                  Text(
                    appLocalizations.receipt_screen_receipt_no,
                    style: context.textStyle.s12.bluishGray.w400.roboto,
                  ),
                  h4,
                  CustomTextField(
                    hint: "",
                    controller: receiptnoController,
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
                                // CustomDialog.showBottomCustomDialog(
                                //   child: selected == 'Cash'
                                //       ? const ReceiptCashAlertWidget()
                                //       : selected == 'Cheque'
                                //       ? const ReceiptChequeAlertWidget()
                                //       : const SizedBox.shrink(),
                                // );
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
                  //h16,
                  if (selected == 'Cash' ||
                      selected == 'Cheque' ||
                      selected == 'UPI') ...[
                    Text(
                      appLocalizations.transaction_payment_screen_amount,
                      style: context.textStyle.s12.bluishGray.w400.roboto,
                    ),
                    h4,
                    CustomTextField(
                      hint: "",
                      controller: amountController,
                      backgroundColor: ColorResources.lightGray,
                      inputType: TextInputType.emailAddress,
                      borderRadius: 12,
                      hintColor: ColorResources.silverGray,
                      borderColor: ColorResources.transparent,
                    ),
                  ],
                  if (selected == 'Cheque') ...[
                    CustomDropdown(
                      label:
                          appLocalizations.transaction_payment_screen_account,
                      items: const [],
                      hintText: "",
                      onChanged: (value) {},
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
                                style: context
                                    .textStyle
                                    .s12
                                    .bluishGray
                                    .w400
                                    .roboto,
                              ),
                              h4,
                              CustomTextField(
                                hint: "",
                                controller: chequeNoController,
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
                                style: context
                                    .textStyle
                                    .s12
                                    .bluishGray
                                    .w400
                                    .roboto,
                              ),
                              h10,
                              CustomTextField(
                                hint: "",
                                controller: chequeDateController,
                                backgroundColor: ColorResources.lightGray,
                                inputType: TextInputType.none,
                                borderRadius: 12,
                                hintColor: ColorResources.silverGray,
                                borderColor: ColorResources.transparent,
                                readOnly: true,
                                onTap: () async {
                                  final pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2100),
                                  );

                                  if (pickedDate != null) {
                                    chequeDateController.text = DateFormat(
                                      'dd-MM-yyyy',
                                    ).format(pickedDate);
                                  }
                                },
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
                    CustomTextField(
                      hint: "",
                      controller: bankNameController,
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
                    CustomTextField(
                      hint: "",
                      controller: branchNameController,
                      backgroundColor: ColorResources.lightGray,
                      inputType: TextInputType.emailAddress,
                      borderRadius: 12,
                      hintColor: ColorResources.silverGray,
                      borderColor: ColorResources.transparent,
                    ),
                  ],
                  if (selected == 'UPI') ...[
                    h16,
                    Text(
                      "Refernce",
                      style: context.textStyle.s12.bluishGray.w400.roboto,
                    ),
                    h4,
                    CustomTextField(
                      hint: "",
                      controller: referenceController,
                      backgroundColor: ColorResources.lightGray,
                      inputType: TextInputType.emailAddress,
                      borderRadius: 12,
                      hintColor: ColorResources.silverGray,
                      borderColor: ColorResources.transparent,
                    ),
                  ],
                  h16,
                  Text(
                    appLocalizations.transaction_payment_screen_narration,
                    style: context.textStyle.s12.bluishGray.w400.roboto,
                  ),
                  h10,
                  CustomTextField(
                    hint: "",
                    controller: narrationController,
                    backgroundColor: ColorResources.white,
                    inputType: TextInputType.emailAddress,
                    borderRadius: 12,
                    hintColor: ColorResources.silverGray,
                    borderColor: ColorResources.ashGray,
                    maxLines: 4,
                    minLines: 3,
                  ),
                  //  h16,
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Container(
                  //       padding: const EdgeInsets.symmetric(
                  //         horizontal: 15,
                  //         vertical: 4,
                  //       ),
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(12),
                  //         color: ColorResources.rosePink,
                  //       ),
                  //       child: Center(
                  //         child: Text(
                  //           appLocalizations
                  //               .transaction_payment_screen_add_bills,
                  //           style: context.textStyle.s10.white.w400,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       flex: 3,
                  //       child: Text(
                  //         appLocalizations.name,
                  //         style: context.textStyle.s10.w500.dustyBlue.roboto,
                  //       ),
                  //     ),
                  //     Expanded(
                  //       flex: 2,
                  //       child: Text(
                  //         appLocalizations.date,
                  //         textAlign: TextAlign.center,
                  //         style: context.textStyle.s10.w500.dustyBlue.roboto,
                  //       ),
                  //     ),
                  //     Expanded(
                  //       flex: 2,
                  //       child: Text(
                  //         appLocalizations.bill_type,
                  //         textAlign: TextAlign.center,
                  //         style: context.textStyle.s10.w500.dustyBlue.roboto,
                  //       ),
                  //     ),
                  //     Expanded(
                  //       flex: 2,
                  //       child: Text(
                  //         appLocalizations.amount,
                  //         textAlign: TextAlign.end,
                  //         style: context.textStyle.s10.w500.dustyBlue.roboto,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // h4,
                  // Divider(
                  //   thickness: 1,
                  //   color: ColorResources.bluishGray.withValues(alpha: 0.2),
                  // ),
                  // h4,
                  // ...receipts.map((receipt) {
                  //   return Padding(
                  //     padding: const EdgeInsets.symmetric(vertical: 4),
                  //     child: Column(
                  //       children: [
                  //         Row(
                  //           children: [
                  //             Expanded(
                  //               flex: 3,
                  //               child: Text(
                  //                 receipt["name"]!,
                  //                 style: context
                  //                     .textStyle
                  //                     .s09
                  //                     .w500
                  //                     .dustyBlue
                  //                     .roboto,
                  //               ),
                  //             ),
                  //             Expanded(
                  //               flex: 2,
                  //               child: Text(
                  //                 receipt["date"]!,
                  //                 textAlign: TextAlign.center,
                  //                 style: context
                  //                     .textStyle
                  //                     .s09
                  //                     .w400
                  //                     .dustyBlue
                  //                     .roboto,
                  //               ),
                  //             ),
                  //             Expanded(
                  //               flex: 2,
                  //               child: Text(
                  //                 receipt["billType"]!,
                  //                 textAlign: TextAlign.center,
                  //                 style: context
                  //                     .textStyle
                  //                     .s09
                  //                     .w400
                  //                     .dustyBlue
                  //                     .roboto,
                  //               ),
                  //             ),
                  //             Expanded(
                  //               flex: 2,
                  //               child: Text(
                  //                 receipt["amount"]!,
                  //                 textAlign: TextAlign.end,
                  //                 style: context
                  //                     .textStyle
                  //                     .s09
                  //                     .w400
                  //                     .dustyBlue
                  //                     .roboto,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //         Divider(
                  //           thickness: 1,
                  //           color: ColorResources.bluishGray.withValues(
                  //             alpha: 0.2,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   );
                  // }),
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
                              appLocalizations
                                  .transaction_payment_screen_advance,
                              style:
                                  context.textStyle.s12.w500.indigoBlue.roboto,
                            ),
                            // w60,
                            Text(
                              advanceAmount.toStringAsFixed(2),
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
                          onTap: () async {
                            final db = context.read<AppDb>();

                            await saveReceipt(
                              db: db,
                              companyId: widget.data.data.company.id!,
                              ledgerName: widget.data.party.ledgerName ?? "",
                              ledgerId: widget.data.party.ledgerId,
                              receiptNo: int.tryParse(receiptnoController.text),
                              amount:
                                  double.tryParse(amountController.text) ?? 0.0,
                              paymentMode: selected,
                              chequeNo: chequeNoController.text,
                              chequeDate: chequeDateController.text,
                              bankName: bankNameController.text,
                              branchName: branchNameController.text,
                              narration: narrationController.text,
                              advance: advanceAmount.toInt(),
                              lattitude: widget.data.party.latitude ?? 0.0,
                              longitude: widget.data.party.longitude ?? 0.0,
                            );
                            setState(() {
                              selected = null;
                            });
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

Future<void> saveReceipt({
  required AppDb db,
  required int companyId,
  required String ledgerName,
  required int ledgerId,
  int? receiptNo,
  required double amount,
  String? paymentMode,
  String? chequeNo,
  String? chequeDate,
  String? bankName,
  String? branchName,
  String? narration,
  int? advance,
  required double lattitude,
  required double longitude,
}) async {
  if (amount <= 0) {
    print("Invalid receipt amount");
    return;
  }
  final now = DateTime.now();
  final formattedDate = DateFormat('yyyy-MM-dd').format(now);
  await db.transaction(() async {
    /// 1️⃣ INSERT RECEIPT MASTER
    final receiptId = await db
        .into(db.receiptMasterTable)
        .insert(
          ReceiptMasterTableCompanion.insert(
            companyId: Value(companyId),

            vchNo: Value(receiptNo?.toString()),
            vchNumber: Value(receiptNo?.toString()),

            vchdate: Value(formattedDate),

            partyId: Value(ledgerId),
            partyName: Value(ledgerName),

            amount: Value(amount),
            discount: Value(0.0),
            receivedAmt: Value(amount),

            advance: Value((advance ?? 0).toDouble()),

            recMode: Value(paymentMode),

            chequeNo: chequeNo != null && chequeNo.isNotEmpty
                ? Value(chequeNo)
                : const Value.absent(),
            chequeDate: Value(formattedDate),

            bankName: Value(bankName),
            branchName: Value(branchName),

            narration: narration != null && narration.isNotEmpty
                ? Value(narration)
                : const Value.absent(),

            latitude: Value(lattitude),
            longitude: Value(longitude),
            accuracy: const Value(0),

            createdOn: Value(formattedDate),
            updatedOn: Value(formattedDate),

            status: const Value(0),
          ),
        );

    print("Inserted Receipt ID: $receiptId");

    /// 2️⃣ INSERT LEDGER ENTRY
    /// 
    await db
    
        .into(db.receiptDetailsTable)
        .insert(
          ReceiptDetailsTableCompanion.insert(
            vchId: receiptId,
            billName: Value(""),
            billDate: Value(now),
            billAmount: Value(amount),
            balanceAmt: Value(0),
            paidAmount: Value(0),
          ),
        );
  });

  await printSavedReceiptData(db);
}

Future<void> printSavedReceiptData(AppDb db) async {
  final master = await db.select(db.receiptMasterTable).get();
  final details = await db.select(db.receiptDetailsTable).get();

  print("==== RECEIPT MASTER ====");
  for (var r in master) {
    print(r.toJson());
  }

  print("==== RECEIPT LEDGER ====");
  for (var l in details) {
    print(l.toJson());
  }
}
