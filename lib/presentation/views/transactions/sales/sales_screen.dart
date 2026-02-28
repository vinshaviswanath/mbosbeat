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

    if (!mounted) return; // ⭐ IMPORTANT

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

  Future<void> openDiscountDialog() async {
    final result = await showDialog<DiscountData>(
      context: context,
      builder: (_) => const DiscountAlertWidget(),
    );

    if (result != null) {
      setState(() {
        selectedDiscount = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;
    final provider = context.read<CustomerTransactionProvider>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            provider.clearSelectedItems();
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
        physics: const NeverScrollableScrollPhysics(),
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
                      Text(
                        widget.data.party.ledgerName ?? "",
                        style: context.textStyle.s12.w500.indigoBlue.roboto,
                      ),
                      GestureDetector(
                        onTap: () {
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
                          child: Center(
                            child: Text(
                              appLocalizations.add_item,
                              style: context.textStyle.s10.white.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  h4,
                  EndToEndTextWidget(
                    text1: widget.data.party.taxNumber ?? "",
                    text2: widget.data.party.lastSyncOn?.toString() ?? "",
                  ),
                  h4,
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
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
                                style:
                                    context.textStyle.s10.w500.dustyBlue.roboto,
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

                                style:
                                    context.textStyle.s10.w500.dustyBlue.roboto,
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
                          txn.cgst.toStringAsFixed(2),
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
                          txn.sgst.toStringAsFixed(2),
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
                          txn.cess.toStringAsFixed(2),
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
                          value: false,
                          onChanged: (value) async {
                            if (value == true) {
                              await openDiscountDialog();
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
                            buttonText: appLocalizations.save,
                            onTap: () async {
                              final txn = context
                                  .read<CustomerTransactionProvider>();
                              final db = context.read<AppDb>();
                              print(
                                "Selected Payment Before Save: $selectedPayment",
                              );
                              print(
                                "Payment Mode: ${selectedPayment?.paymentMode}",
                              );
                              print("Amount: ${selectedPayment?.amount}");

                              await saveSale(
                                db: db,
                                txn: txn,
                                companyId: widget.data.data.company.id!,
                                ledgerName: widget.data.party.ledgerName ?? "",
                                ledgerId: widget.data.party.ledgerId,
                                billingMode: _selectedMode,
                                gstNumber: widget.data.party.taxNumber,
                                remark: remarkController.text,
                                paymentData: selectedPayment,
                                couponAmount: couponAmount,
                                discountData: selectedDiscount,
                                rate: txn.subTotal,
                                voucherNo: voucherNo ?? "",
                                mobileNumber: widget.data.party.mobile ?? '',
                                address2: widget.data.party.address2 ?? '',
                                address: widget.data.party.address1 ?? '',
                                pinCode: widget.data.party.pinCode ?? '',
                                email: widget.data.party.email ?? '',
                                lattitude: widget.data.party.latitude ?? 0.0,
                                longitude: widget.data.party.longitude ?? 0.0,
                                mailingName:
                                    widget.data.party.mailingName ?? '',
                              );

                              txn.clearSelectedItems();
                              remarkController.clear();
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
    ///
    final masterId = await db
        .into(db.saleMasterTable)
        .insert(
          SaleMasterTableCompanion.insert(
            partyId: Value(ledgerId),
            party: Value(ledgerName),
            voucherAmount: txn.grandTotal,
            companyId: Value(companyId),
            itemCount: Value(txn.selectedItemCount),
            gstin: Value(gstNumber),
            billingMode: Value(billingMode),
            sync: const Value(0),
            voucherDate: Value(DateFormat('yyyy-MM-dd').format(DateTime.now())),
            narration: Value(remark.isEmpty ? null : remark),
            coupontdiscountamount: Value(couponAmount),
            voucherNo: Value(voucherNo),
            discountType: discountData != null
                ? Value(discountData.type)
                : const Value.absent(),

            discountAmount: discountData != null
                ? Value(discountData.amount)
                : const Value.absent(),
            address2: Value(address2),
            address: Value(address),
            pinCode: Value(pinCode),
            lattitude: Value(lattitude),
            longitude: Value(longitude),
            mailingName: Value(mailingName),
            mob: Value(mobileNumber),
          ),
        );

    print("Inserted Master ID: $masterId");

    /// 2️⃣ INSERT DETAILS

    for (final item in txn.selectedOrderItems) {
      await db
          .into(db.saleDetailsTable)
          .insert(
            SaleDetailsTableCompanion.insert(
              mid: Value(masterId),
              itemId: Value(item.item.id),
              qty: Value(item.qty),
              total: Value(txn.subTotal),
              companyId: Value(companyId),
              sync: const Value(0),
              cgst: Value(txn.cgst),
              sgst: Value(txn.sgst),
              cess: Value(txn.cess),
              disc: Value(item.discount),
              //  fQty: Value(item.freeQty),
              fUnit: Value(item.item.unitName),
              itemName: Value(item.item.itemName),
              rate: Value(item.rate),
            ),
          );
    }

    /// 3️⃣ INSERT LEDGER
    await db
        .into(db.saleLedgerDetailsTable)
        .insert(
          SaleLedgerDetailsTableCompanion.insert(
            mid: Value(masterId),
            ledger: Value(ledgerName),
            amount: Value(txn.grandTotal),
            companyId: Value(companyId),
            sync: const Value(0),
            rate: Value(rate),
          ),
        );
    //insert autorecipt
    if (paymentData != null) {
      await db
          .into(db.saleAutoReceiptTable)
          .insert(
            SaleAutoReceiptTableCompanion.insert(
              mid: Value(masterId),
              companyId: Value(companyId),

              paymentMode: Value(paymentData.paymentMode),
              amount: Value(paymentData.amount),
              upiReference: Value(paymentData.upiReference),
              chequeNumber: Value(paymentData.chequeNumber),
              chequeDate: paymentData.chequeDate != null
                  ? Value(
                      DateFormat('yyyy-MM-dd').format(paymentData.chequeDate!),
                    )
                  : const Value.absent(),
              sync: const Value(0),
            ),
          );
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
