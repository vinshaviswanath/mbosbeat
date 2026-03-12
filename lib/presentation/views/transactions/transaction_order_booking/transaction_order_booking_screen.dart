import 'package:drift/drift.dart' show Value;
import 'package:intl/intl.dart';
import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/data_sources/user/party_MasterSync/party_MasterSync.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/models/party_details.dart';
import 'package:mpos_beat/data/models/product.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';
import 'package:mpos_beat/presentation/logic/customer_transaction_provider.dart';
import 'package:mpos_beat/presentation/logic/user_provider.dart';
import 'package:mpos_beat/presentation/views/home_screen/transactions_container.dart';
import 'package:mpos_beat/presentation/views/transactions/transaction_order_booking/widgets/clear_items_warning_dialog.dart';
import 'package:mpos_beat/presentation/views/transactions/transaction_order_booking/widgets/confirm_bill_dialog.dart';
import 'package:mpos_beat/presentation/views/transactions/transaction_order_booking/widgets/end_to_end_text_widget.dart';

class TransactionOrderBookingRouteArgs {
  final PartyMasterData party;
  final TransactionArgs data;
  final VoucherType vchTyp;

  TransactionOrderBookingRouteArgs({
    required this.party,
    required this.data,
    required this.vchTyp,
  });
}

class TransactionOrderBookingScreen extends StatefulWidget {
  final TransactionOrderBookingRouteArgs data;

  const TransactionOrderBookingScreen({super.key, required this.data});

  @override
  State<TransactionOrderBookingScreen> createState() =>
      _TransactionOrderBookingScreenState();
}

class _TransactionOrderBookingScreenState
    extends State<TransactionOrderBookingScreen> {
  String? voucherNo;
  @override
  void initState() {
    super.initState();
    context.read<UserProvider>().attachDb(context.read<AppDb>());
    load();
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

    if (party != null) {
      context.read<UserProvider>().setParty(party);
    }
  }

  @override
  void didUpdateWidget(covariant TransactionOrderBookingScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.data.party.ledgerId != widget.data.party.ledgerId) {
      context.read<UserProvider>().clearSelectedPriceLevel();
    }
  }

  final TextEditingController remarkController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final companyId = widget.data.data.company.id!;
    final ledgerId = widget.data.party.ledgerId;
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
            appLocalizations.transaction_order_booking_screen_order_booking,
            style: context.textStyle.s20.indigoBlue.bold.roboto,
          ),
          centerTitle: true,
        ),
        body: StreamBuilder<PartyMasterDetails?>(
          stream: context.read<UserProvider>().partyDetailsStream(
            companyId,
            ledgerId,
          ),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            final party = snapshot.data!;

            return Stack(
              children: [
                CustomScrollView(
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
                                  party.ledgerName,
                                  style: context
                                      .textStyle
                                      .s12
                                      .w500
                                      .indigoBlue
                                      .roboto,
                                ),
                              ],
                            ),
                            h4,
                            EndToEndTextWidget(
                              text1: party.countryId == 1
                                  ? "GST No. ${party.taxNumber}"
                                  : "VAT No. ${party.taxNumber}",
                              text2: DateFormat(
                                'dd-MM-yyyy',
                              ).format(DateTime.now()),
                            ),
                            h4,
                            EndToEndTextWidget(
                              text1:
                                  "${appLocalizations.order_booking_voucher_no} ${voucherNo ?? "..."}",
                              text2: appLocalizations.order_booking_balance,
                            ),
                            h4,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      appLocalizations.order_booking_price_list,
                                      style: context
                                          .textStyle
                                          .s09
                                          .w400
                                          .dustyBlue
                                          .roboto,
                                    ),
                                    w8,
                                    Consumer<UserProvider>(
                                      builder: (context, userProvider, _) {
                                        final party =
                                            userProvider.selectedParty;

                                        if (party == null) {
                                          return const SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                            ),
                                          );
                                        }

                                        // Parse price levels from JSON if needed
                                        final priceLevels = party.priceLevels;

                                        // Auto-select price level if price_list has a value
                                        if (party.priceList > 0) {
                                          // Auto-select the price level based on price_list
                                          PriceLevelDetails? autoSelected;
                                          if (priceLevels.isNotEmpty) {
                                            autoSelected = priceLevels.firstWhere(
                                              (e) => e.id == party.priceList,
                                              orElse: () => priceLevels
                                                  .first, // always returns a valid PriceLevelDetails
                                            );
                                          }

                                          // Update provider with auto-selected price level
                                          if (autoSelected != null &&
                                              userProvider
                                                      .selectedPriceLevel
                                                      ?.id !=
                                                  autoSelected.id) {
                                            WidgetsBinding.instance
                                                .addPostFrameCallback((_) {
                                                  userProvider
                                                      .setSelectedPriceLevel(
                                                        autoSelected!,
                                                      );
                                                });
                                          }
                                          // Show label instead of dropdown
                                          final selectedPriceLevel =
                                              userProvider.selectedPriceLevel;
                                          return Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: ColorResources.lightGray,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Text(
                                              selectedPriceLevel?.priceLevel ??
                                                  '-',
                                              style: context
                                                  .textStyle
                                                  .s09
                                                  .w300
                                                  .dustyBlue
                                                  .roboto,
                                            ),
                                          );
                                        }

                                        // If price_list == 0, show dropdown to select
                                        return Container(
                                          height:
                                              context.getSize.height * 0.022,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                          ),
                                          decoration: BoxDecoration(
                                            color: ColorResources.lightGray,
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child:
                                                DropdownButton<
                                                  PriceLevelDetails
                                                >(
                                                  value: userProvider
                                                      .selectedPriceLevel,
                                                  hint: Text(
                                                    "Select Price",
                                                    style: context
                                                        .textStyle
                                                        .s09
                                                        .w300
                                                        .dustyBlue
                                                        .roboto,
                                                  ),
                                                  icon: Icon(
                                                    Icons.keyboard_arrow_down,
                                                    size:
                                                        context.getSize.height *
                                                        0.016,
                                                    color: ColorResources
                                                        .indigoBlue,
                                                  ),
                                                  items: priceLevels.map((e) {
                                                    return DropdownMenuItem<
                                                      PriceLevelDetails
                                                    >(
                                                      value: e,
                                                      child: Text(
                                                        e.priceLevel,
                                                        style: const TextStyle(
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                    );
                                                  }).toList(),
                                                  onChanged: (value) {
                                                    Logger.logSuccess(
                                                      "${party.priceList}",
                                                    );
                                                    if (value != null) {
                                                      userProvider
                                                          .setSelectedPriceLevel(
                                                            value,
                                                          );
                                                    }
                                                  },
                                                ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                Text(
                                  "${party.closingBalance}",
                                  style: context
                                      .textStyle
                                      .s12
                                      .bold
                                      .indigoBlue
                                      .roboto,
                                ),
                              ],
                            ),
                            h4,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
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
                            Divider(
                              thickness: 1,
                              color: ColorResources.bluishGray.withValues(
                                alpha: 0.2,
                              ),
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
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    appLocalizations.product_name,
                                    style: context
                                        .textStyle
                                        .s10
                                        .w500
                                        .dustyBlue
                                        .roboto,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    appLocalizations.order_booking_quantity,
                                    style: context
                                        .textStyle
                                        .s10
                                        .w500
                                        .dustyBlue
                                        .roboto,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    appLocalizations.rate,
                                    style: context
                                        .textStyle
                                        .s10
                                        .w500
                                        .dustyBlue
                                        .roboto,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    appLocalizations.discount,
                                    style: context
                                        .textStyle
                                        .s10
                                        .w500
                                        .dustyBlue
                                        .roboto,
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: Text(
                                    appLocalizations.amount,
                                    style: context
                                        .textStyle
                                        .s10
                                        .w500
                                        .dustyBlue
                                        .roboto,
                                  ),
                                ),
                              ],
                            ),
                            h2,
                            Divider(
                              thickness: 1,
                              color: ColorResources.bluishGray.withValues(
                                alpha: 0.2,
                              ),
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
                          delegate: SliverChildBuilderDelegate((
                            context,
                            index,
                          ) {
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
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: ColoredBox(
                    color: ColorResources.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      child: Consumer<CustomerTransactionProvider>(
                        builder: (context, txn, _) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(
                                thickness: 1,
                                color: ColorResources.bluishGray.withValues(
                                  alpha: 0.2,
                                ),
                              ),
                              h16,

                              /// ⭝ SUBTOTAL (exclusive)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    appLocalizations.order_booking_sub_total,
                                    style: context
                                        .textStyle
                                        .s12
                                        .w500
                                        .indigoBlue
                                        .roboto,
                                  ),
                                  w60,
                                  Text(
                                    txn.billSubTotal.toStringAsFixed(2),
                                    style: context
                                        .textStyle
                                        .s12
                                        .w500
                                        .indigoBlue
                                        .roboto,
                                  ),
                                ],
                              ),

                              h12,

                              /// ⭝ CGST (multi slab)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    appLocalizations.cgst,
                                    style: context
                                        .textStyle
                                        .s10
                                        .w400
                                        .dustyBlue
                                        .roboto,
                                  ),
                                  w60,
                                  Text(
                                    txn.totalCgst.toStringAsFixed(2),
                                    style: context
                                        .textStyle
                                        .s10
                                        .w400
                                        .dustyBlue
                                        .roboto,
                                  ),
                                ],
                              ),

                              h8,

                              /// ⭝ SGST (multi slab)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    appLocalizations.sgst,
                                    style: context
                                        .textStyle
                                        .s10
                                        .w400
                                        .dustyBlue
                                        .roboto,
                                  ),
                                  w60,
                                  Text(
                                    txn.totalSgst.toStringAsFixed(2),
                                    style: context
                                        .textStyle
                                        .s10
                                        .w400
                                        .dustyBlue
                                        .roboto,
                                  ),
                                ],
                              ),

                              h8,

                              /// ⭝ CESS (optional future use)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    appLocalizations.cess,
                                    style: context
                                        .textStyle
                                        .s10
                                        .w400
                                        .dustyBlue
                                        .roboto,
                                  ),
                                  w60,
                                  Text(
                                    txn.totalCess.toStringAsFixed(2),
                                    style: context
                                        .textStyle
                                        .s10
                                        .w400
                                        .dustyBlue
                                        .roboto,
                                  ),
                                ],
                              ),

                              h8,

                              /// ⭝ GRAND TOTAL
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    appLocalizations.grand_total,
                                    style: context
                                        .textStyle
                                        .s12
                                        .w500
                                        .indigoBlue
                                        .roboto,
                                  ),
                                  w60,
                                  Text(
                                    txn.grandTotal.toStringAsFixed(2),
                                    style: context
                                        .textStyle
                                        .s12
                                        .w500
                                        .indigoBlue
                                        .roboto,
                                  ),
                                ],
                              ),

                              h21,

                              /// ⭝ REMARK
                              Text(
                                appLocalizations.remarks,
                                style:
                                    context.textStyle.s10.w400.dustyBlue.roboto,
                              ),

                              h13,

                              CustomTextField(
                                controller: remarkController,
                                hint: "",
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
                                        if (provider
                                            .selectedItemIds
                                            .isNotEmpty) {
                                          confirmBillDialog(
                                            context,
                                            onSave: () async {
                                              final txn = context
                                                  .read<
                                                    CustomerTransactionProvider
                                                  >();
                                              final db = context.read<AppDb>();

                                              await saveOrder(
                                                db: db,
                                                txn: txn,
                                                companyId: widget
                                                    .data
                                                    .data
                                                    .company
                                                    .id!,
                                                ledgerName:
                                                    widget
                                                        .data
                                                        .party
                                                        .ledgerName ??
                                                    "",
                                                ledgerId:
                                                    widget.data.party.ledgerId,
                                                priceLevelId:
                                                    context
                                                        .read<UserProvider>()
                                                        .selectedPriceLevel
                                                        ?.id ??
                                                    0,
                                                voucherNo: voucherNo ?? "",
                                                remark: remarkController.text,
                                                mobileNumber: widget
                                                    .data
                                                    .party
                                                    .mobile!
                                                    .trim(),
                                                address2:
                                                    widget
                                                        .data
                                                        .party
                                                        .address2 ??
                                                    '',
                                                address:
                                                    widget
                                                        .data
                                                        .party
                                                        .address1 ??
                                                    '',
                                                pinCode:
                                                    widget.data.party.pinCode ??
                                                    '',
                                                email:
                                                    widget.data.party.email ??
                                                    '',
                                                lattitude:
                                                    widget
                                                        .data
                                                        .party
                                                        .latitude ??
                                                    0.0,
                                                longitude:
                                                    widget
                                                        .data
                                                        .party
                                                        .longitude ??
                                                    0.0,
                                                mailingName:
                                                    widget
                                                        .data
                                                        .party
                                                        .mailingName ??
                                                    '',
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
              ],
            );
          },
        ),
      ),
    );
  }
}

class OrderItemTile extends StatelessWidget {
  final SelectedOrderItem data;

  const OrderItemTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final item = data.item;

    final qty = data.qty;
    final rate = data.rate;
    final discount = data.discount;
    final taxPercent = item.taxPercent;

    final amount = data.amount;
    final provider = context.watch<CustomerTransactionProvider>();
    final freeQty = provider.getFreeQty(data.item.itemId);
    final freeUnit = provider.getSelectedFreeUnit(data.item.itemId, data.item);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Item Name
          SizedBox(
            width: context.getSize.width,
            child: Text(
              item.itemName,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.blueGrey,
              ),
            ),
          ),
          h4,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// TAX %
              Expanded(
                flex: 2,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Tax : ',
                        style: context.textStyle.s08.w400.dustyBlue,
                      ),
                      TextSpan(
                        text: '${taxPercent.toStringAsFixed(0)}%',
                        style: context.textStyle.s09.w700.dustyBlue,
                      ),
                    ],
                  ),
                ),
              ),

              /// QTY
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${qty.toStringAsFixed(2)} Qls',
                      style: context.textStyle.s11.w400.leafGreen,
                    ),
                    if (freeQty > 0)
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Free ',
                              style: context.textStyle.s08.w400.rosePink,
                            ),
                            TextSpan(
                              text: '${freeQty.toStringAsFixed(2)} $freeUnit',
                              style: context.textStyle.s11.w400.leafGreen,
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),

              /// RATE (exclusive)
              Expanded(
                flex: 2,
                child: Text(
                  rate.toStringAsFixed(2),
                  textAlign: TextAlign.center,
                  style: context.textStyle.s11.w400.dustyBlue,
                ),
              ),

              /// DISCOUNT
              Expanded(
                flex: 1,
                child: Text(
                  discount > 0 ? discount.toStringAsFixed(2) : '-',
                  textAlign: TextAlign.end,
                  style: context.textStyle.s11.w400.dustyBlue,
                ),
              ),

              /// AMOUNT (qty * inclRate - discount)
              Expanded(
                flex: 2,
                child: Text(
                  amount.toStringAsFixed(2),
                  textAlign: TextAlign.end,
                  style: context.textStyle.s11.w400.dustyBlue,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Divider(
            thickness: 1,
            color: ColorResources.bluishGray.withValues(alpha: 0.2),
          ),
        ],
      ),
    );
  }
}

class SelectedOrderItem {
  final Product item;
  final double qty;
  final double rate;
  final double discount;
  final double amount;
  final double inclRate;

  SelectedOrderItem({
    required this.item,
    required this.qty,
    required this.rate,
    required this.discount,
    required this.amount,
    required this.inclRate,
  });
}

Future<void> saveOrder({
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
    print("No items selected");
    return;
  }

  // final vchNo = int.parse(voucherNo);
  await db.transaction(() async {
    //  INSERT MASTER
    final nextVchId = await db.saleOrderMasterDao.getNextVchId(companyId);
    final masterId = await db
        .into(db.saleOrderMasterTable)
        .insert(
          SaleOrderMasterTableCompanion.insert(
            address2: Value(address2),
            address: Value(address),
            createdTime: Value(DateTime.now()),

            pinCode: Value(pinCode),
            itemCount: Value(txn.selectedItemCount),

            lattitude: Value(lattitude),
            longitude: Value(longitude),
            mailingName: Value(mailingName),

            partyId: Value(ledgerId),
            party: Value(ledgerName),
            voucherAmount: txn.grandTotal,
            vchId: Value(nextVchId),
            voucherNo: Value(voucherNo),
            companyId: Value(companyId),
            sync: const Value(0),
            priceList: Value(priceLevelId.toString()),
            voucherDate: Value(DateFormat('yyyy-MM-dd').format(DateTime.now())),
            narration: Value(remark.isEmpty ? null : remark),

            mob: Value(mobileNumber),
          ),
        );

    print("Inserted Master ID: $masterId");

    //  INSERT DETAILS
    for (final item in txn.selectedOrderItems) {
      final gross = item.rate * item.qty;
      final discountValue = gross * (item.discount / 100);

      await db
          .into(db.saleOrderDetailsTable)
          .insert(
            SaleOrderDetailsTableCompanion.insert(
              mid: Value(masterId),
              itemId: Value(item.item.id),
              qty: Value(item.qty),
              total: Value(item.inclRate),
              companyId: Value(companyId),
              sync: const Value(0),

              //  disc: Value(item.discount),
              // fQty: Value(item.freeQty),
              fUnit: Value(item.item.unitName),
              itemName: Value(item.item.itemName),
              rate: Value(item.amount),
              //  discVal: Value(discountValue),
            ),
          );
    }

    // ================= INSERT LEDGER =================

    // Tax ledgers
    final Map<String, double> taxLedgers = {
      "CGST": txn.totalCgst,
      "SGST": txn.totalSgst,
      "CESS": txn.totalCess,
    };

    for (final entry in taxLedgers.entries) {
      if (entry.value > 0) {
        await db
            .into(db.saleOrderLedgerDetailsTable)
            .insert(
              SaleOrderLedgerDetailsTableCompanion.insert(
                mid: Value(masterId),
                voucherName: Value(entry.key),
                amount: Value(entry.value),
                companyId: Value(companyId),
              ),
            );
      }
    }
  });
  await printSavedData(db);
}

Future<void> printSavedData(AppDb db) async {
  final masters = await db.select(db.saleOrderMasterTable).get();
  final details = await db.select(db.saleOrderDetailsTable).get();
  final ledger = await db.select(db.saleOrderLedgerDetailsTable).get();

  print("==== MASTER TABLE ====");
  for (var m in masters) {
    print(m.toJson());
  }

  print("==== DETAILS TABLE ====");
  for (var d in details) {
    print(d.toJson());
  }

  print("==== LEDGER TABLE ====");
  for (var l in ledger) {
    print(l.toJson());
  }
}

class VoucherGenerator {
  static Future<String> generate({
    required AppDb db,
    required VoucherType voucher,
    required int companyId,
  }) async {
    final lastVoucher = await db.saleOrderMasterDao.getLastVoucherNo(companyId);

    /// Determine mode
    final isB2C = voucher.hasB2B == 1;

    final prefix = isB2C ? voucher.b2CPrefix : voucher.b2BPrefix;
    final suffix = isB2C ? voucher.b2CSuffix : voucher.b2BSuffix;
    final width = isB2C ? voucher.b2CWidth : voucher.b2BWidth;

    int nextNumber = 1;

    /// Extract last numeric part
    if (lastVoucher != null && lastVoucher.isNotEmpty) {
      final parts = lastVoucher.split('/');

      if (parts.length >= 2) {
        final numberPart = parts[1];

        final parsed = int.tryParse(numberPart);
        if (parsed != null) {
          nextNumber = parsed + 1;
        }
      }
    }

    final padded = nextNumber.toString().padLeft(width, '0');

    return "$prefix$padded$suffix";
  }
}
