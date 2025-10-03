import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_settings/widgets/info_tool_tip.dart';
import 'package:mpos_beat/presentation/views/transactions/transaction_order_booking/transaction_order_booking_screen.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({super.key});

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  String _selectedMode = "B2C";

  final products = [
    {
      "name": "ASD 16 Rice 10Kg",
      "qty": "0.0 Qls",
      "rate": "3900.00 Qls",
      "amount": "0.00",
      "freeQty": "1.0 Qls",
    },
  ];
  @override
  Widget build(BuildContext context) {
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
          "Sales",
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
                    text1: "T23-24/D-AM120",
                    text2: "29-07-2024",
                  ),
                  h4,
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Billing Mode : ",
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 10),

                      /// B2B option
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedMode = "B2B";
                          });
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
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
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _selectedMode == "B2B"
                                        ? Colors
                                              .orange // selected
                                        : Colors
                                              .grey, // unselected inner circle
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Text(
                              "B2B",
                              style: TextStyle(color: Colors.blueGrey),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),

                      /// B2C option
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedMode = "B2C";
                          });
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
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
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _selectedMode == "B2C"
                                        ? Colors.orange
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Text(
                              "B2C",
                              style: TextStyle(color: Colors.blueGrey),
                            ),
                          ],
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
                          "Product Name",
                          style: context.textStyle.s10.w500.dustyBlue.roboto,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Qty",
                          style: context.textStyle.s10.w500.dustyBlue.roboto,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Rate",
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
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final product = products[index];

              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            product["name"]!,
                            style: context.textStyle.s09.w500.dustyBlue.roboto,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            product["qty"]!,
                            textAlign: TextAlign.center,
                            style: context.textStyle.s09.w400.dustyBlue.roboto,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            product["rate"]!,
                            textAlign: TextAlign.center,
                            style: context.textStyle.s09.w400.dustyBlue.roboto,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            product["amount"]!,
                            textAlign: TextAlign.end,
                            style: context.textStyle.s09.w400.dustyBlue.roboto,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        "Free Qty: ${product["freeQty"]!}",
                        style: context.textStyle.s09.w400.dustyBlue.roboto,
                      ),
                    ),
                  ],
                ),
              );
            }, childCount: products.length),
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
                  h32,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Discount (+/-)",
                        style: context.textStyle.s12.w500.indigoBlue.roboto,
                      ),
                      CustomSwitch(
                        borderColor: ColorResources.bluishGray,
                        thumbColor: ColorResources.bluishGray,
                        value: false,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                  h16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Coupon Discount (+/-)",
                        style: context.textStyle.s12.w500.indigoBlue.roboto,
                      ),
                      CustomSwitch(
                        borderColor: ColorResources.bluishGray,
                        thumbColor: ColorResources.bluishGray,
                        value: false,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                  h16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Auto Receipt Required",
                        style: context.textStyle.s12.w500.indigoBlue.roboto,
                      ),
                      CustomSwitch(
                        borderColor: ColorResources.bluishGray,
                        thumbColor: ColorResources.bluishGray,
                        value: false,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                  h12,
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
