import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';
import 'package:mpos_beat/presentation/views/transactions/transaction_order_booking/widgets/end_to_end_text_widget.dart';

class SalesReturnScreen extends StatefulWidget {
  const SalesReturnScreen({super.key});

  @override
  State<SalesReturnScreen> createState() => _SalesReturnScreenState();
}

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

bool _showData = false;

class _SalesReturnScreenState extends State<SalesReturnScreen> {
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
          appLocalizations.sales_return_screen_sales_return,
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
            icon:  Icon(
              Icons.qr_code,
              size: context.getSize.height * 0.022,
            ),
          ),
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
                        "Alackal Stores, Kuruppamthara",
                        style: context.textStyle.s12.w500.indigoBlue.roboto,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _showData = !_showData;
                          });
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
                  const EndToEndTextWidget(
                    text1: "T23-24/D-AM120",
                    text2: "29-07-2024",
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
                      // Expanded(
                      //   flex: 1,
                      //   child: Text(
                      //     "Discount",
                      //     style: context.textStyle.s09.w500.dustyBlue.roboto,
                      //   ),
                      // ),
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
          if (_showData)
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final item = data[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          left: 8,
                          top: 6,
                          bottom: 6,
                          right: 8,
                        ),
                        decoration: BoxDecoration(
                          color: ColorResources.lightGray,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item["product"],
                                    style: context
                                        .textStyle
                                        .s09
                                        .w500
                                        .dustyBlue
                                        .roboto,
                                  ),
                                  Text(
                                    "Damaged Qty: ${item["damaged"]}",
                                    style: context
                                        .textStyle
                                        .s09
                                        .w400
                                        .rosePink
                                        .roboto,
                                  ),
                                  Text(
                                    "Free Qty: ${item["free"]}",
                                    style: context
                                        .textStyle
                                        .s09
                                        .w400
                                        .dustyBlue
                                        .roboto,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Center(
                                child: Text(
                                  item["qty"],
                                  style: context
                                      .textStyle
                                      .s09
                                      .w400
                                      .rosePink
                                      .roboto,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    item["rate"],
                                    style: context
                                        .textStyle
                                        .s09
                                        .w400
                                        .dustyBlue
                                        .roboto,
                                  ),
                                  Text(
                                    "Saleable Qty: ${item["saleable"]}",
                                    style: context
                                        .textStyle
                                        .s09
                                        .w400
                                        .dustyBlue
                                        .roboto,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                item["amount"],
                                style:
                                    context.textStyle.s09.w400.dustyBlue.roboto,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: ColorResources.bluishGray.withValues(alpha: 0.2),
                      ),
                    ],
                  ),
                );
              }, childCount: data.length),
            ),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  // Divider(
                  //   thickness: 1,
                  //   color: ColorResources.bluishGray.withValues(alpha: 0.2),
                  // ),
                  // h16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      w2,
                      SizedBox(
                        width: context.getSize.width / 3.4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Text(
                              appLocalizations.cgst,
                              style:
                                  context.textStyle.s10.w400.dustyBlue.roboto,
                            ),
                            // w60,
                            Text(
                              "682.50",
                              style:
                                  context.textStyle.s10.w400.dustyBlue.roboto,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  h8,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      w2,
                      SizedBox(
                        width: context.getSize.width / 3.4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Text(
                              appLocalizations.sgst,
                              style:
                                  context.textStyle.s10.w400.dustyBlue.roboto,
                            ),
                            // w60,
                            Text(
                              "682.50",
                              style:
                                  context.textStyle.s10.w400.dustyBlue.roboto,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  h8,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      w2,
                      SizedBox(
                        width: context.getSize.width / 3.4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Text(
                              appLocalizations.cess,
                              style:
                                  context.textStyle.s10.w400.dustyBlue.roboto,
                            ),
                            // w60,
                            Text(
                              "0.00",
                              style:
                                  context.textStyle.s10.w400.dustyBlue.roboto,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  h8,
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
                              appLocalizations.grand_total,
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
                  h12,
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
