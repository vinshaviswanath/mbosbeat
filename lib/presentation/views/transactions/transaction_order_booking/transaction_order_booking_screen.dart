import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';

class TransactionOrderBookingScreen extends StatefulWidget {
  const TransactionOrderBookingScreen({super.key});

  @override
  State<TransactionOrderBookingScreen> createState() =>
      _TransactionOrderBookingScreenState();
}

class _TransactionOrderBookingScreenState
    extends State<TransactionOrderBookingScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> data = [
      {
        "product": "ASD 16 Rice 10Kg",
        "qty": "5.0 Qls",
        "rate": "3900.00 Qls",
        "amount": "27300.00",
        "damaged": "2.0 Qls",
        "free": "1.0 Qls",
        "saleable": "5.0 Qls",
      },
      {
        "product": "ASD 16 Rice 10Kg",
        "qty": "5.0 Qls",
        "rate": "3900.00 Qls",
        "amount": "5300.00",
        "damaged": "2.0 Qls",
        "free": "1.0 Qls",
        "saleable": "5.0 Qls",
      },
      {
        "product": "ASD 16 Rice 10Kg",
        "qty": "5.0 Qls",
        "rate": "3900.00 Qls",
        "amount": "10300.00",
        "damaged": "2.0 Qls",
        "free": "1.0 Qls",
        "saleable": "5.0 Qls",
      },
      {
        "product": "ASD 16 Rice 10Kg",
        "qty": "5.0 Qls",
        "rate": "3900.00 Qls",
        "amount": "6700.00",
        "damaged": "2.0 Qls",
        "free": "1.0 Qls",
        "saleable": "5.0 Qls",
      },
    ];
    final List<String> priceOptions = ["Select Price"];
    String selectedValue = priceOptions[0];
    final appLocalizations = context.l10n;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.cloudGray,
        surfaceTintColor: ColorResources.cloudGray,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: ColorResources.indigoBlue,
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
            height: 22,
            colorFilter: const ColorFilter.mode(
              ColorResources.indigoBlue,
              BlendMode.srcIn,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.qr_code,
              size: 22,
              color: ColorResources.indigoBlue,
            ),
          ),
        ],
        // toolbarHeight: 65,
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
                      Text(
                        "Alackal Stores, Kuruppamthara",
                        style: context.textStyle.s12.w500.indigoBlue.roboto,
                      ),
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
                            "+ Add Item",
                            style: context.textStyle.s10.white.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  h4,
                  const EndToEndTextWidget(
                    text1: "GST No. JDGSJ2468246572",
                    text2: "29-07-2024",
                  ),
                  h4,
                  const EndToEndTextWidget(
                    text1: "Voucher No.",
                    text2: "Balance",
                  ),
                  h4,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Price List",
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            height: 22,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: ColorResources.lightGray,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: selectedValue,
                                icon: const Padding(
                                  padding: EdgeInsets.only(left: 80),
                                  child: Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 16,
                                    color: ColorResources.indigoBlue,
                                  ),
                                ),
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.black54,
                                ),
                                items: priceOptions
                                    .map(
                                      (e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(
                                          e,
                                          style: const TextStyle(fontSize: 10),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (val) {
                                  setState(() {
                                    selectedValue = val!;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "56,874.00 Cr",
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
                          "Product Name",
                          style: context.textStyle.s10.w500.dustyBlue.roboto,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Quantity",
                          style: context.textStyle.s10.w500.dustyBlue.roboto,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Rate",
                          style: context.textStyle.s10.w500.dustyBlue.roboto,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Discount",
                          style: context.textStyle.s10.w500.dustyBlue.roboto,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Amount",
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
                        "Sub Total",
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
                        "CGST",
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
                        "SGST",
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
                        "CESS",
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
                        "Grand Total",
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
                    "Remarks:",
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

class EndToEndTextWidget extends StatelessWidget {
  const EndToEndTextWidget({
    super.key,
    required this.text1,
    required this.text2,
  });
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text1, style: context.textStyle.s09.w400.dustyBlue.roboto),
        Text(text2, style: context.textStyle.s09.w400.dustyBlue.roboto),
      ],
    );
  }
}
