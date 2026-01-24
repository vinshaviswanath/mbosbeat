import 'package:intl/intl.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';
import 'package:mpos_beat/presentation/logic/user_provider.dart';
import 'package:mpos_beat/presentation/views/home_screen/transactions_container.dart';
import 'package:mpos_beat/presentation/views/transactions/sales_return/sales_return.dart';
import 'package:mpos_beat/presentation/views/transactions/transaction_order_booking/widgets/end_to_end_text_widget.dart';


class TransactionOrderBookingRouteArgs {
  final PartyMasterData party;
  final TransactionArgs data;

  TransactionOrderBookingRouteArgs({
    required this.party,
    required this.data,
  });
}

class TransactionOrderBookingScreen extends StatefulWidget {
  final TransactionOrderBookingRouteArgs data;

  const TransactionOrderBookingScreen({super.key,  required this.data});

  @override
  State<TransactionOrderBookingScreen> createState() =>
      _TransactionOrderBookingScreenState();
}

class _TransactionOrderBookingScreenState
    extends State<TransactionOrderBookingScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserProvider>().attachDb(context.read<AppDb>());
  }

  @override
  void didUpdateWidget(covariant TransactionOrderBookingScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.data.party.ledgerId != widget.data.party.ledgerId) {
      context.read<UserProvider>().clearSelectedPriceLevel();
    }
  }

  @override
  Widget build(BuildContext context) {
    // final List<String> priceOptions = ["Select Price"];
    // String selectedValue = priceOptions[0];

    final party = widget.data.party;
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
          appLocalizations.transaction_order_booking_screen_order_booking,
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
          w10,
          SvgPicture.asset(
            AppAssets.qr,
            height: context.getSize.height * 0.022,
            colorFilter: const ColorFilter.mode(
              ColorResources.indigoBlue,
              BlendMode.srcIn,
            ),
          ),

          w10,
        ],
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
                        "${party.ledgerName}",
                        style: context.textStyle.s12.w500.indigoBlue.roboto,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.pushNamed(
                            AppRouterConst.orderBookingAddItemScreen,
                            extra: TransactionOrderBookingRouteArgs(data: widget.data.data,party: widget.data.party)
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
                    text1: party.countryId == 1
                        ? "GST No. ${party.taxNumber}"
                        : "VAT No. ${party.taxNumber}",
                    text2: DateFormat('dd-MM-yyyy').format(DateTime.now()),
                  ),
                  h4,
                  EndToEndTextWidget(
                    text1: appLocalizations.order_booking_voucher_no,
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
                            style: context.textStyle.s09.w400.dustyBlue.roboto,
                          ),
                          w8,
                          Consumer<UserProvider>(
                            builder: (context, userProvider, _) {
                              return StreamBuilder<List<PriceLevelsTableData>>(
                                stream: userProvider.priceLevelsStream(
                                  partyPriceListId: widget.data.party.priceList,
                                ),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    );
                                  }

                                  final priceLevels = snapshot.data!;

                                  /// ✅ Selected value must EXIST in the list
                                  final selectedValue =
                                      priceLevels.any(
                                        (e) =>
                                            e.id ==
                                            userProvider.selectedPriceLevelId,
                                      )
                                      ? priceLevels.firstWhere(
                                          (e) =>
                                              e.id ==
                                              userProvider.selectedPriceLevelId,
                                        )
                                      : null;

                                  return Container(
                                    height: context.getSize.height * 0.022,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: ColorResources.lightGray,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<PriceLevelsTableData?>(
                                        value: selectedValue,
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
                                          size: context.getSize.height * 0.016,
                                          color: ColorResources.indigoBlue,
                                        ),
                                        items: priceLevels.map((e) {
                                          return DropdownMenuItem<
                                            PriceLevelsTableData
                                          >(
                                            value: e,
                                            child: Text(
                                              e.priceLevel ?? '',
                                              style: const TextStyle(
                                                fontSize: 10,
                                              ),
                                            ),
                                          );
                                        }).toList(),

                                        /// 🔒 Disable dropdown if only one price level
                                        onChanged: priceLevels.length == 1
                                            ? null
                                            : (value) {
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
                              );
                            },
                          ),
                        ],
                      ),
                      Text(
                        "${party.closingBalance}",
                        style: context.textStyle.s12.bold.indigoBlue.roboto,
                      ),
                    ],
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
                        flex: 2,
                        child: Text(
                          appLocalizations.product_name,
                          style: context.textStyle.s10.w500.dustyBlue.roboto,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          appLocalizations.order_booking_quantity,
                          style: context.textStyle.s10.w500.dustyBlue.roboto,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          appLocalizations.rate,
                          style: context.textStyle.s10.w500.dustyBlue.roboto,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          appLocalizations.discount,
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
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Divider(
                    thickness: 1,
                    color: ColorResources.bluishGray.withValues(alpha: 0.2),
                  ),
                  h16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        appLocalizations.order_booking_sub_total,
                        style: context.textStyle.s12.w500.indigoBlue.roboto,
                      ),
                      w60,
                      Text(
                        "0.00",
                        style: context.textStyle.s12.w500.indigoBlue.roboto,
                      ),
                    ],
                  ),
                  h12,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,

                    children: [
                      Text(
                        appLocalizations.cgst,
                        style: context.textStyle.s10.w400.dustyBlue.roboto,
                      ),
                      w60,
                      Text(
                        "0.00",
                        style: context.textStyle.s10.w400.dustyBlue.roboto,
                      ),
                      h8,
                    ],
                  ),
                  h8,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,

                    children: [
                      Text(
                        appLocalizations.sgst,
                        style: context.textStyle.s10.w400.dustyBlue.roboto,
                      ),
                      w60,
                      Text(
                        "0.00",
                        style: context.textStyle.s10.w400.dustyBlue.roboto,
                      ),
                    ],
                  ),

                  h8,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,

                    children: [
                      Text(
                        appLocalizations.cess,
                        style: context.textStyle.s10.w400.dustyBlue.roboto,
                      ),
                      w60,
                      Text(
                        "0.00",
                        style: context.textStyle.s10.w400.dustyBlue.roboto,
                      ),
                    ],
                  ),
                  h8,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,

                    children: [
                      Text(
                        appLocalizations.grand_total,
                        style: context.textStyle.s12.w500.indigoBlue.roboto,
                      ),
                      w60,
                      Text(
                        "0.00",
                        style: context.textStyle.s12.w500.indigoBlue.roboto,
                      ),
                    ],
                  ),
                  h21,
                  Text(
                    appLocalizations.remarks,
                    style: context.textStyle.s10.w400.dustyBlue.roboto,
                  ),
                  h13,
                  const CustomTextField(
                    hint: "",
                    borderRadius: 16,
                    borderColor: ColorResources.ashGray,
                  ),
                  h12,
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          buttonText: appLocalizations.save,
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
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ],
                  ),
                  h16,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
