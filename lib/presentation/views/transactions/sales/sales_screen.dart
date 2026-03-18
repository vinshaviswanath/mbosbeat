import 'package:drift/drift.dart' show Value;
import 'package:intl/intl.dart';
import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/data_sources/user/party_MasterSync/party_MasterSync.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_switch.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';
import 'package:mpos_beat/presentation/logic/customer_transaction_provider.dart';
import 'package:mpos_beat/presentation/logic/user_provider.dart';
import 'package:mpos_beat/presentation/views/transactions/purchase/widgets/discount_alert_widget.dart';
import 'package:mpos_beat/presentation/views/transactions/sales/widgets/apply_coupon_widget.dart';
import 'package:mpos_beat/presentation/views/transactions/sales/widgets/payment_mode_alert_widget.dart';
import 'package:mpos_beat/presentation/views/transactions/transaction_order_booking/transaction_order_booking_screen.dart';
import 'package:mpos_beat/presentation/views/transactions/transaction_order_booking/widgets/clear_items_warning_dialog.dart';
import 'package:mpos_beat/presentation/views/transactions/transaction_order_booking/widgets/confirm_bill_dialog.dart';
import 'package:mpos_beat/presentation/views/transactions/transaction_order_booking/widgets/end_to_end_text_widget.dart';

class SalesScreen extends StatefulWidget {
  final TransactionOrderBookingRouteArgs data;
  const SalesScreen({super.key, required this.data});

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  String _selectedMode = "B2C";
  bool get hasTaxNumber {
    final tax = widget.data.party.taxNumber;
    return tax != null && tax.trim().isNotEmpty;
  }

  String? voucherNo;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).clearSnackBars();
    });
    load();
    _selectedMode = hasTaxNumber ? "B2B" : "B2C";
    generateVoucher();
  }

  Future<void> generateVoucher() async {
    final db = context.read<AppDb>();

    final vNo = await VoucherGenerator.generate(
      db: db,
      voucher: widget.data.vchTyp,
      companyId: widget.data.data.company.id!,
    );

    if (mounted) {
      setState(() {
        voucherNo = vNo;
      });
    }
  }

  Future<void> load() async {
    final party = await sl<PartyMasterSync>().fetchParty(
      widget.data.data.company.id!,
      widget.data.party.ledgerId,
    );

    if (!mounted) return;

    if (party != null) {
      context.read<UserProvider>().setParty(party);
    }
  }

  final TextEditingController remarkController = TextEditingController();
  double couponAmount = 0.0;
  double discountAmount = 0.0;
  AutoReceiptData? selectedPayment;
  DiscountData? selectedDiscount;
  Future<void> openAutoReceiptDialog() async {
    final result = await showDialog<AutoReceiptData>(
      context: context,
      builder: (_) => AutoReceiptModeAlertWidget(),
    );

    if (result != null) {
      setState(() {
        selectedPayment = result;
      });
    }
  }

  Future<void> openCouponDiscountDialog() async {
    final result = await showDialog<CoupondiscountData>(
      context: context,
      builder: (_) => const CouponDiscountWidget(),
    );

    if (result != null) {
      setState(() {
        couponAmount = double.tryParse(result.discountAmount ?? "0") ?? 0.0;
      });
    }
  }

  Future<DiscountData?> openDiscountDialog() async {
    final result = await showDialog<DiscountData>(
      context: context,
      builder: (_) => const DiscountAlertWidget(),
    );

    if (result != null) {
      final txn = context.read<CustomerTransactionProvider>();

      setState(() {
        selectedDiscount = result;
      });

      txn.applyDiscountToAllItems(result);
    }

    return result;
  }

  bool isDiscountEnabled = false;
  DiscountData? appliedDiscount;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;
    final provider = context.read<CustomerTransactionProvider>();
    return PopScope(
      canPop: provider.selectedItemIds.isNotEmpty ? false : true,
      onPopInvokedWithResult: (_, __) {
        provider.selectedItemIds.isNotEmpty
            ? clearItemsWarningDialog(context)
            : null;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              provider.selectedItemIds.isNotEmpty
                  ? clearItemsWarningDialog(context)
                  : Navigator.pop(context);
            },
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: ColorResources.indigoBlue,
              size: context.getSize.height * 0.024,
            ),
          ),
          title: Text(
            appLocalizations.sales_screen_sales,
            style: context.textStyle.s20.indigoBlue.bold.roboto,
          ),
          centerTitle: true,
        ),
        body: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: h16),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.data.party.ledgerName ?? "",
                              style:
                                  context.textStyle.s12.w500.indigoBlue.roboto,
                            ),
                            Text(
                              "${appLocalizations.order_booking_voucher_no} ${voucherNo ?? "..."}",
                              style:
                                  context.textStyle.s09.w400.dustyBlue.roboto,
                            ),
                          ],
                        ),
                      ],
                    ),
                    h4,
                    EndToEndTextWidget(
                      text1: widget.data.party.taxNumber ?? "",
                      text2: DateFormat('dd-MM-yyyy').format(
                        DateTime.parse(widget.data.party.lastSyncOn.toString()),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            //  ScaffoldMessenger.of(context).clearSnackBars();
                            context.pushNamed(
                              AppRouterConst.orderBookingAddItemScreen,
                              extra: TransactionOrderBookingRouteArgs(
                                data: widget.data.data,
                                party: widget.data.party,
                                vchTyp: widget.data.vchTyp,
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: ColorResources.rosePink,
                            ),
                            child: Text(
                              appLocalizations.add_item,
                              style: context.textStyle.s10.white.w400,
                            ),
                          ),
                        ),
                      ],
                    ),

                    h4,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          appLocalizations.billing_mode,
                          style: context.textStyle.s10.w500.dustyBlue.roboto,
                        ),
                        w10,
                        GestureDetector(
                          onTap: hasTaxNumber
                              ? () {
                                  setState(() {
                                    _selectedMode = "B2B";
                                  });
                                }
                              : null,
                          child: Opacity(
                            opacity: hasTaxNumber ? 1 : 0.4,
                            child: Row(
                              children: [
                                Container(
                                  width: context.getSize.width * 0.045,
                                  height: context.getSize.height * 0.022,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: _selectedMode == "B2B"
                                          ? Colors.blue
                                          : Colors.grey,
                                      width: 2,
                                    ),
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: context.getSize.width * 0.0225,
                                      height: context.getSize.height * 0.01,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: _selectedMode == "B2B"
                                            ? Colors.orange
                                            : Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                                w6,
                                Text(
                                  appLocalizations.b2b,
                                  style: context
                                      .textStyle
                                      .s10
                                      .w500
                                      .dustyBlue
                                      .roboto,
                                ),
                              ],
                            ),
                          ),
                        ),
                        w20,
                        GestureDetector(
                          onTap: !hasTaxNumber
                              ? () {
                                  setState(() {
                                    _selectedMode = "B2C";
                                  });
                                }
                              : null,
                          child: Opacity(
                            opacity: !hasTaxNumber ? 1 : 0.4,
                            child: Row(
                              children: [
                                Container(
                                  width: context.getSize.width * 0.045,
                                  height: context.getSize.height * 0.022,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: _selectedMode == "B2C"
                                          ? Colors.blue
                                          : Colors.grey,
                                      width: 2,
                                    ),
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: context.getSize.width * 0.0225,
                                      height: context.getSize.height * 0.01,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: _selectedMode == "B2C"
                                            ? Colors.orange
                                            : Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                                w6,
                                Text(
                                  appLocalizations.b2c,

                                  style: context
                                      .textStyle
                                      .s10
                                      .w500
                                      .dustyBlue
                                      .roboto,
                                ),
                              ],
                            ),
                          ),
                        ),
                        w20,
                        w20,
                      ],
                    ),
                    h4,
                    Divider(
                      thickness: 1,
                      color: ColorResources.bluishGray.withValues(alpha: 0.2),
                    ),
                    h12,
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(
                            appLocalizations.product_name,
                            style: context.textStyle.s10.w500.dustyBlue.roboto,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            appLocalizations.qty,
                            style: context.textStyle.s10.w500.dustyBlue.roboto,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            appLocalizations.rate,
                            style: context.textStyle.s10.w500.dustyBlue.roboto,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            appLocalizations.amount,
                            style: context.textStyle.s10.w500.dustyBlue.roboto,
                          ),
                        ),
                      ],
                    ),
                    h2,
                    Divider(
                      thickness: 1,
                      color: ColorResources.bluishGray.withValues(alpha: 0.2),
                    ),
                    h4,
                  ],
                ),
              ),
            ),
            Consumer<CustomerTransactionProvider>(
              builder: (context, provider, _) {
                final items = provider.selectedOrderItems;

                if (items.isEmpty) {
                  return const SliverToBoxAdapter(child: SizedBox());
                }

                return SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return OrderItemTile(data: items[index]);
                  }, childCount: items.length),
                );
              },
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: context.getSize.height * 0.4),
            ),
          ],
        ),

        bottomNavigationBar: SafeArea(
          child: ColoredBox(
            color: ColorResources.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Consumer<CustomerTransactionProvider>(
                builder: (context, txn, _) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(
                        thickness: 1,
                        color: ColorResources.bluishGray.withValues(alpha: 0.2),
                      ),
                      h16,

                      /// Sub Total
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            appLocalizations.order_booking_sub_total,
                            style: context.textStyle.s12.w500.indigoBlue.roboto,
                          ),
                          w60,
                          Text(
                            txn.billSubTotal.toStringAsFixed(2),
                            style: context.textStyle.s12.w500.indigoBlue.roboto,
                          ),
                        ],
                      ),

                      h12,

                      /// CGST
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            appLocalizations.cgst,
                            style: context.textStyle.s10.w400.dustyBlue.roboto,
                          ),
                          w60,
                          Text(
                            txn.totalCgst.toStringAsFixed(2),
                            style: context.textStyle.s10.w400.dustyBlue.roboto,
                          ),
                        ],
                      ),

                      h8,

                      /// SGST
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            appLocalizations.sgst,
                            style: context.textStyle.s10.w400.dustyBlue.roboto,
                          ),
                          w60,
                          Text(
                            txn.totalSgst.toStringAsFixed(2),
                            style: context.textStyle.s10.w400.dustyBlue.roboto,
                          ),
                        ],
                      ),

                      h8,

                      /// CESS
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            appLocalizations.cess,
                            style: context.textStyle.s10.w400.dustyBlue.roboto,
                          ),
                          w60,
                          Text(
                            txn.totalCess.toStringAsFixed(2),
                            style: context.textStyle.s10.w400.dustyBlue.roboto,
                          ),
                        ],
                      ),

                      h8,

                      /// Grand Total
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            appLocalizations.grand_total,
                            style: context.textStyle.s12.w500.indigoBlue.roboto,
                          ),
                          w60,
                          Text(
                            txn.grandTotal.toStringAsFixed(2),
                            style: context.textStyle.s12.w500.indigoBlue.roboto,
                          ),
                        ],
                      ),
                      h16,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            appLocalizations.discount_add_minus,
                            style: context.textStyle.s12.w500.indigoBlue.roboto,
                          ),
                          CustomSwitch(
                            borderColor: ColorResources.bluishGray,
                            thumbColor: ColorResources.bluishGray,
                            value: isDiscountEnabled,
                            onChanged: (value) async {
                              if (value) {
                                final result = await openDiscountDialog();

                                if (result != null) {
                                  setState(() {
                                    appliedDiscount = result;
                                    isDiscountEnabled = true;
                                  });
                                } else {
                                  // if dialog cancelled → revert switch
                                  setState(() {
                                    isDiscountEnabled = false;
                                  });
                                }
                              } else {
                                setState(() {
                                  appliedDiscount = null;
                                  isDiscountEnabled = false;
                                });

                                // optional: clear discount in provider
                                context
                                    .read<CustomerTransactionProvider>()
                                    .clearDiscount();
                              }
                            },
                          ),
                        ],
                      ),
                      h16,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            appLocalizations.sales_screen_coupon_discount,
                            style: context.textStyle.s12.w500.indigoBlue.roboto,
                          ),
                          CustomSwitch(
                            borderColor: ColorResources.bluishGray,
                            thumbColor: ColorResources.bluishGray,
                            value: false,
                            onChanged: (value) async {
                              if (value == true) {
                                await openCouponDiscountDialog();
                              }
                            },
                          ),
                        ],
                      ),
                      h16,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            appLocalizations.sales_screen_auto_receipt_req,
                            style: context.textStyle.s12.w500.indigoBlue.roboto,
                          ),
                          CustomSwitch(
                            borderColor: ColorResources.bluishGray,
                            thumbColor: ColorResources.bluishGray,
                            value: false,
                            onChanged: (value) async {
                              if (value == true) {
                                await openAutoReceiptDialog();
                              }
                            },
                          ),
                        ],
                      ),
                      h12,
                      Text(
                        appLocalizations.remarks,
                        style: context.textStyle.s10.w400.dustyBlue.roboto,
                      ),
                      h13,
                      CustomTextField(
                        hint: "",
                        controller: remarkController,

                        borderRadius: 16,
                        borderColor: ColorResources.ashGray,
                      ),
                      h12,
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              color: provider.selectedItemIds.isEmpty
                                  ? ColorResources.ashGray
                                  : null,
                              buttonText: appLocalizations.save,
                              onTap: () async {
                                if (provider.selectedItemIds.isNotEmpty) {
                                  confirmBillDialog(
                                    context,
                                    onSave: () async {
                                      final txn = context
                                          .read<CustomerTransactionProvider>();
                                      final db = context.read<AppDb>();

                                      await saveSale(
                                        db: db,
                                        txn: txn,
                                        companyId: widget.data.data.company.id!,
                                        ledgerName:
                                            widget.data.party.ledgerName ?? "",
                                        ledgerId: widget.data.party.ledgerId,
                                        billingMode: _selectedMode,
                                        gstNumber: widget.data.party.taxNumber,
                                        remark: remarkController.text,
                                        paymentData: selectedPayment,
                                        couponAmount: couponAmount,
                                        discountData: selectedDiscount,
                                        rate: txn.subTotal,
                                        voucherNo: voucherNo ?? "",
                                        mobileNumber:
                                            widget.data.party.mobile ?? '',
                                        address2:
                                            widget.data.party.address2 ?? '',
                                        address:
                                            widget.data.party.address1 ?? '',
                                        pinCode:
                                            widget.data.party.pinCode ?? '',
                                        email: widget.data.party.email ?? '',
                                        lattitude:
                                            widget.data.party.latitude ?? 0.0,
                                        longitude:
                                            widget.data.party.longitude ?? 0.0,
                                        mailingName:
                                            widget.data.party.mailingName ?? '',
                                      );

                                      txn.clearSelectedItems();
                                      remarkController.clear();
                                    },
                                  );
                                } else {}
                              },

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
                              isborderEnable: false,
                              color: ColorResources.bluishGray,
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ],
                      ),
                      h16,
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> saveSale({
  required AppDb db,
  required CustomerTransactionProvider txn,
  required int companyId,
  required String ledgerName,
  required int ledgerId,
  required String billingMode,
  required String? gstNumber,
  required String remark,
  AutoReceiptData? paymentData,
  double couponAmount = 0.0,
  DiscountData? discountData,
  final double rate = 0.0,
  required String voucherNo,
  required String? mobileNumber,
  required String address2,
  required String address,
  required String pinCode,
  required String email,
  required double lattitude,
  required double longitude,
  required String mailingName,
}) async {
  if (txn.selectedItemCount == 0) {
    print("No items selected");
    return;
  }
  double finalAmount = txn.grandTotal;

  // Apply main discount
  if (discountData != null) {
    if (discountData.type == "Amount") {
      finalAmount -= discountData.amount ?? 0;
    } else if (discountData.type == "Percentage") {
      finalAmount -= finalAmount * ((discountData.amount ?? 0) / 100);
    }
  }

  // Apply coupon
  finalAmount -= couponAmount;

  // Prevent negative amount
  if (finalAmount < 0) {
    finalAmount = 0;
  }
  await db.transaction(() async {
    /// 1️⃣ INSERT MASTER
    final now = DateTime.now();
    final formattedDate = DateFormat('yyyy-MM-dd').format(now);
    final masterId = await db
        .into(db.saleMasterTable)
        .insert(
          SaleMasterTableCompanion.insert(
            partyId: Value(ledgerId),
            partyname: Value(ledgerName),

            companyId: Value(companyId),

            netAmount: finalAmount,
            grossAmount: txn.subTotal,
            discountAmount: discountData?.amount ?? 0,
            taxableAmount: 0,
            vataAmount: 0,
            distance: 0,
            cgst: txn.totalCgst,
            sgst: txn.totalSgst,
            igst: txn.totalIgst,
            cessAmount: txn.totalCess,
            additionalcessAmount: 0,

            roundoff: 0,

            itemcount: Value(txn.selectedItemCount),

            gstno: Value(gstNumber),
            statecode: const Value(null),

            vchdate: Value(formattedDate),

            vchtype: Value(billingMode),

            narration: Value(remark.isEmpty ? null : remark),

            latitude: lattitude,
            longitude: longitude,
            accuracy: 0,

            mobilecreatedon: Value(formattedDate),
            createdon: Value(formattedDate),

            sync: const Value(0),
          ),
        );
    print("Inserted Master ID: $masterId");

    /// 2️⃣ INSERT DETAILS

    for (final item in txn.selectedOrderItems) {
      final qty = item.qty;
      final rate = item.rate;

      final base = qty * rate;

      // Discount
      final discount = item.discount;
      final discounted = base - discount;

      // Tax %
      final taxPercent = item.item.taxPercent;

      // Tax split
      final cgst = discounted * (taxPercent / 2) / 100;
      final sgst = discounted * (taxPercent / 2) / 100;
      final igst = discounted * taxPercent / 100;
      await db
          .into(db.saleDetailsTable)
          .insert(
            SaleDetailsTableCompanion.insert(
              vchId: masterId,
              itemId: Value(item.item.id),
              itemName: Value(item.item.itemName),

              enteredQtyFirst: Value(qty),
              rate: Value(rate),
              amount: Value(discounted),
              taxableAmount: Value(discounted),
              cgstVal: Value(cgst),
              sgstVal: Value(sgst),
              igstVal: Value(igst),
              discountAmt: Value(item.discount),
            ),
          );
    }

    ///   /// 3️⃣ INSERT LEDGER
    final Map<String, double> taxLedgers = {
      "CGST": txn.totalCgst,
      "SGST": txn.totalSgst,
      "CESS": txn.totalCess,
    };

    for (final entry in taxLedgers.entries) {
      if (entry.value > 0) {
        await db
            .into(db.saleLedgerDetailsTable)
            .insert(
              SaleLedgerDetailsTableCompanion.insert(
                vchId: Value(masterId),
                ledgerId: Value(ledgerId),
                ledgerName: Value(entry.key),

                amount: Value(entry.value),
                rate: const Value(0),
              ),
            );
        //insert autorecipt
        if (paymentData != null) {
          await db
              .into(db.saleAutoReceiptTable)
              .insert(
                SaleAutoReceiptTableCompanion.insert(
                  vchid: Value(masterId),
                  transactiontype: Value(paymentData.paymentMode),
                  recamount: Value(paymentData.amount),
                  recnumber: Value(paymentData.upiReference),
                  chequeDate: Value(paymentData.chequeDate?.toString()),
                ),
              );
        }
      }
    }
  });

  await printSavedSaleData(db);
}

Future<void> printSavedSaleData(AppDb db) async {
  final masters = await db.select(db.saleMasterTable).get();
  final details = await db.select(db.saleDetailsTable).get();
  final ledger = await db.select(db.saleLedgerDetailsTable).get();
  final autorecipt = await db.select(db.saleAutoReceiptTable).get();

  print("==== SALE MASTER ====");
  for (var m in masters) {
    print(m.toJson());
  }

  print("==== SALE DETAILS ====");
  for (var d in details) {
    print(d.toJson());
  }

  print("==== SALE LEDGER ====");
  for (var l in ledger) {
    print(l.toJson());
  }

  print("==== SALE AUTO RECEIPT ====");
  for (var r in autorecipt) {
    print(r.toJson());
  }
}
