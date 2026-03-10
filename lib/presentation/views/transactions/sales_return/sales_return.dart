import 'package:drift/drift.dart' show Value;
import 'package:intl/intl.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';
import 'package:mpos_beat/presentation/logic/customer_transaction_provider.dart';
import 'package:mpos_beat/presentation/logic/user_provider.dart';
import 'package:mpos_beat/presentation/views/transactions/transaction_order_booking/transaction_order_booking_screen.dart';
import 'package:mpos_beat/presentation/views/transactions/transaction_order_booking/widgets/end_to_end_text_widget.dart';

class SalesReturnScreen extends StatefulWidget {
  final TransactionOrderBookingRouteArgs data;
  const SalesReturnScreen({super.key, required this.data});

  @override
  State<SalesReturnScreen> createState() => _SalesReturnScreenState();
}

class _SalesReturnScreenState extends State<SalesReturnScreen> {
  final TextEditingController remarkController = TextEditingController();

  String? voucherNo;
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    generateVoucher();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;
    final provider = context.read<CustomerTransactionProvider>();
    return Scaffold(
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
          appLocalizations.sales_return_screen_sales_return,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.data.party.ledgerName ?? "",
                            style: context.textStyle.s12.w500.indigoBlue.roboto,
                          ),
                          Text(
                            "${appLocalizations.order_booking_voucher_no} ${voucherNo ?? "..."}",
                            style: context.textStyle.s09.w400.dustyBlue.roboto,
                          ),
                        ],
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
                    text2: DateFormat('dd-MM-yyyy').format(
                      DateTime.parse(widget.data.party.lastSyncOn.toString()),
                    ),
                  ),
                  h4,
                  Divider(
                    thickness: 1,
                    color: ColorResources.bluishGray.withValues(alpha: 0.2),
                  ),
                  h16,
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
                        flex: 3,
                        child: Text(
                          appLocalizations.product_name,
                          style: context.textStyle.s09.w500.dustyBlue.roboto,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          appLocalizations.qty,
                          style: context.textStyle.s09.w500.dustyBlue.roboto,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          appLocalizations.rate,
                          style: context.textStyle.s09.w500.dustyBlue.roboto,
                        ),
                      ),

                      Expanded(
                        flex: 1,
                        child: Text(
                          appLocalizations.amount,
                          style: context.textStyle.s09.w500.dustyBlue.roboto,
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

                              await saveSaleReturn(
                                db: db,
                                txn: txn,
                                companyId: widget.data.data.company.id!,
                                ledgerName: widget.data.party.ledgerName ?? "",
                                ledgerId: widget.data.party.ledgerId,
                                priceLevelId:
                                    context
                                        .read<UserProvider>()
                                        .selectedPriceLevel
                                        ?.id ??
                                    0,
                                voucherNo: voucherNo ?? "",
                                remark: remarkController.text,
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

Future<void> saveSaleReturn({
  required AppDb db,
  required CustomerTransactionProvider txn,
  required int companyId,
  required String ledgerName,
  required int ledgerId,
  required int priceLevelId,
  required String remark,
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
    print("No items selected for return");
    return;
  }

  await db.transaction(() async {
    /// 1️⃣ INSERT MASTER
    final masterId = await db
        .into(db.saleReturnMasterTable)
        .insert(
          SaleReturnMasterTableCompanion.insert(
            partyId: Value(ledgerId),
            party: Value(ledgerName),
            voucherAmount: txn.grandTotal,
            companyId: Value(companyId),
            priceList: Value(priceLevelId.toString()),
            voucherDate: Value(DateFormat('yyyy-MM-dd').format(DateTime.now())),
            narration: Value(remark.isEmpty ? null : remark),
            itemCount: Value(txn.selectedItemCount),
            sync: const Value(0),
            voucherNo: Value(voucherNo),
            address2: Value(address2),
            address: Value(address),
            createdTime: Value(DateTime.now()),

            pinCode: Value(pinCode),

            lattitude: Value(lattitude),
            longitude: Value(longitude),
            mailingName: Value(mailingName),
          ),
        );

    print("Inserted Sale Return Master ID: $masterId");

    /// 2️⃣ INSERT DETAILS
    for (final itemId in txn.selectedItemIds) {
      final qty = txn.getQty(itemId);
      final discount = txn.getDiscount(itemId);

      final total = txn.subTotal;

      await db
          .into(db.saleReturnDetailsTable)
          .insert(
            SaleReturnDetailsTableCompanion.insert(
              mid: Value(masterId),
              itemId: Value(itemId),
              qty: Value(qty),
              total: Value(total),
              disc: Value(discount),
              ledger: Value(ledgerName),
              companyId: Value(companyId),
              sync: const Value(0),

              fQty: Value(qty),
            ),
          );
    }

    /// 3️⃣ INSERT LEDGER
    final Map<String, double> taxLedgers = {
      "CGST": txn.totalCgst,
      "SGST": txn.totalSgst,
      "CESS": txn.totalCess,
    };

    for (final entry in taxLedgers.entries) {
      if (entry.value > 0) {
        await db
            .into(db.saleReturnLedgerDetailsTable)
            .insert(
              SaleReturnLedgerDetailsTableCompanion.insert(
                mid: Value(masterId),
                ledger: Value(ledgerName),
                amount: Value(txn.grandTotal),
                companyId: Value(companyId),

                voucherName: Value(entry.key),
              ),
            );
      }
    }
  });

  await printSaleReturnSavedData(db);
}

Future<void> printSaleReturnSavedData(AppDb db) async {
  final masters = await db.select(db.saleReturnMasterTable).get();
  final details = await db.select(db.saleReturnDetailsTable).get();
  final ledger = await db.select(db.saleReturnLedgerDetailsTable).get();

  print("==== SALE RETURN MASTER ====");
  for (var m in masters) {
    print(m.toJson());
  }

  print("==== SALE RETURN DETAILS ====");
  for (var d in details) {
    print(d.toJson());
  }

  print("==== SALE RETURN LEDGER ====");
  for (var l in ledger) {
    print(l.toJson());
  }
}
