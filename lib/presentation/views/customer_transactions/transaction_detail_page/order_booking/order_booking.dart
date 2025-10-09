  import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mpos_beat/core/theme/colors.dart';
import 'package:mpos_beat/core/theme/text_styles.dart';
import 'package:mpos_beat/core/utils/extentions.dart';
import 'package:mpos_beat/route/app_router_const.dart';

class OrderBooking extends StatefulWidget {
  const OrderBooking({super.key});

  @override
  State<OrderBooking> createState() => _OrderBookingState();
}

class _OrderBookingState extends State<OrderBooking> {
  @override
  Widget build(BuildContext context) {
    final local = context.l10n;
    final color = Theme.of(context).colorScheme;
    final texttheme = Theme.of(context).textTheme;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back_ios_rounded, size: 15),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.sync)),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add_shopping_cart_outlined),
          ),
        ],

        title: Text(local.transaction_detail_order_booking_title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height * 0.02),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                  Text(
                    "Alackal Stores, Kuruppamthara",
                    style: context.textStyle.s14.indigoBlue.w600.roboto,
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(AppRouterConst.orderbookingitems);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorResources.rosePink,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 25,
                      width: width * 0.220,
                      child: Center(
                        child: Text(
                          local.other_transactions_stockTransfer_additem,
                          style: context.textStyle.s11.white.roboto,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.01),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 20),
              child: Row(
                children: [
                  //Gst no......
                  Text(
                    local.customer_transaction_detail_GSTno,
                    style: context.textStyle.s09.dustyBlue.roboto,
                  ),
                  Spacer(),

                  //date....
                  Text(
                    "29-07-2024",
                    style: context.textStyle.s09.dustyBlue.roboto,
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.002),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 20),
              child: Row(
                children: [
                  //voucher no....
                  Text(
                    local.other_transactions_stockReceive_vocherNo,
                    style: context.textStyle.s09.dustyBlue.roboto,
                  ),
                  Spacer(),
                  Text(
                    local.customer_transaction_detail_Balance,
                    style: context.textStyle.s09.dustyBlue.roboto,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 20),
              child: Row(
                children: [
                  Text(
                    local.other_transactions_stockReceive_pricelist_text,
                    style: context.textStyle.s09.dustyBlue.roboto,
                  ),
                  SizedBox(width: width * 0.02),

                  //price list....
                  Container(
                    height: height * 0.0450,
                    width: width * 0.450,
                    child: DropdownButtonFormField(
                      //dropdown shape and color....
                      borderRadius: BorderRadius.circular(15),
                      dropdownColor: ColorResources.white,
                      items: [
                        DropdownMenuItem(
                          child: Text(
                            "Select Price",
                            style: context.textStyle.s09.dustyBlue.roboto,
                          ),
                        ),
                      ],
                      onChanged: (value) {},
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: ColorResources.indigoBlue,
                        size: 20,
                      ),
                      decoration: InputDecoration(
                        fillColor: ColorResources.lightGray,
                        filled: true,
                        contentPadding: EdgeInsets.only(bottom: 1, left: 8),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(17),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),

                  //balance.....
                  Text(
                    "56,874.00 Cr",
                    style: context.textStyle.s14.indigoBlue.roboto.bold,
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.01),
            Divider(
              color: ColorResources.palegrayblue,
              height: 3,
              thickness: 1.4,
              indent: 18,
              endIndent: 23,
            ),
            SizedBox(height: height * 0.02),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
              ), // match divider padding
              child: Row(
                children: [
                  Expanded(
                    flex: 4, // product name usually longer
                    child: Text(
                      local.other_transactions_stockTransfer_productname,
                      style: context.textStyle.s12.dustyBlue.roboto.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      local.other_transactions_stockTransfer_Quantity,
                      style: context.textStyle.s12.dustyBlue.roboto.w500,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      local.transaction_detail_order_booking_rate,
                      style: context.textStyle.s12.dustyBlue.roboto.w500,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      local.transaction_detail_order_booking_discount,
                      style: context.textStyle.s12.dustyBlue.roboto.w500,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      local.expense_amount,
                      style: context.textStyle.s12.dustyBlue.roboto.w500,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: ColorResources.palegrayblue,
              height: 3,
              thickness: 1.4,
              indent: 18,
              endIndent: 23,
            ),
            Container(
              height: height * 0.450,
              width: width * 0.920,
              child: ListView.builder(
                itemCount: 6 + 1,
                itemBuilder: (context, index) {
                  if (index < 6) {
                    return GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //product....
                                    Text(
                                      "Black & Broken Rice",
                                      style: context
                                          .textStyle
                                          .s11
                                          .dustyBlue
                                          .roboto
                                          .w500,
                                    ),

                                    //tax......
                                    Text(
                                      "Tax : 18%",
                                      style: context
                                          .textStyle
                                          .s09
                                          .dustyBlue
                                          .roboto
                                          .w500,
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "10.00 Qls",
                                      style: context
                                          .textStyle
                                          .s11
                                          .lightgreen
                                          .roboto
                                          .w500,
                                    ),

                                    //free quantity.....
                                    Row(
                                      children: [
                                        Text(
                                          "Free",
                                          style: context
                                              .textStyle
                                              .s09
                                              .rosePink
                                              .roboto
                                              .w500,
                                        ),
                                        Text(
                                          "10.00 Qls",
                                          style: context
                                              .textStyle
                                              .s11
                                              .lightgreen
                                              .roboto
                                              .w500,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(width: width * 0.03),

                                //rate.....
                                Flexible(
                                  flex: 2,
                                  child: Text(
                                    "1800.00/Qls",
                                    style: context
                                        .textStyle
                                        .s11
                                        .dustyBlue
                                        .roboto
                                        .w500,
                                  ),
                                ),
                                SizedBox(width: width * 0.08),

                                //discount.....
                                Text(
                                  "100%",
                                  style: context
                                      .textStyle
                                      .s11
                                      .dustyBlue
                                      .roboto
                                      .w500,
                                ),
                                Spacer(),

                                //amount...
                                Text(
                                  "35000.00",
                                  style: context
                                      .textStyle
                                      .s11
                                      .dustyBlue
                                      .roboto
                                      .w500,
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: ColorResources.palegrayblue,
                            height: 3,
                            thickness: 1.4,
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Column(
                      children: [
                        SizedBox(height: height * 0.05),

                        //sub total....
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              local.transaction_detail_order_booking_sub_total,
                              style:
                                  context.textStyle.s14.indigoBlue.roboto.bold,
                            ),
                            SizedBox(width: width * 0.09),
                            Text(
                              "72000.00",
                              style:
                                  context.textStyle.s14.indigoBlue.roboto.bold,
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.01),

                        //CGST.....
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "CGST",
                              style: context.textStyle.s11.dustyBlue.roboto,
                            ),
                            SizedBox(width: width * 0.192),
                            Text(
                              "0.00",
                              style: context.textStyle.s11.dustyBlue.roboto,
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.01),

                        //SGST........
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "SGST",
                              style: context.textStyle.s11.dustyBlue.roboto,
                            ),
                            SizedBox(width: width * 0.192),
                            Text(
                              "0.00",
                              style: context.textStyle.s11.dustyBlue.roboto,
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.01),

                        //CESS......
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "CESS",
                              style: context.textStyle.s11.dustyBlue.roboto,
                            ),
                            SizedBox(width: width * 0.192),
                            Text(
                              "0.00",
                              style: context.textStyle.s11.dustyBlue.roboto,
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.01),

                        //grand total.....
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              local
                                  .customer_transaction_detail_outstanding_grand_total,
                              style:
                                  context.textStyle.s14.indigoBlue.roboto.bold,
                            ),
                            SizedBox(width: width * 0.09),
                            Text(
                              "72000.00",
                              style:
                                  context.textStyle.s14.indigoBlue.roboto.bold,
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                },
              ),
            ),

            //remark....
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Text(
                  local.expense_remarks,
                  style: context.textStyle.s11.dustyBlue.roboto.w500,
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            Container(
              child: TextField(
                cursorHeight: 13,
                style: texttheme.labelSmall!.copyWith(
                  fontSize: 15,
                  color: ColorResources.white,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none, // Removes the underline
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
              decoration: BoxDecoration(
                border: Border.all(color: ColorResources.lightBorderGray),
                borderRadius: BorderRadius.circular(15),
              ),
              height: height * 0.060,
              width: width * 0.910,
            ),
            SizedBox(height: height * 0.02),

            //save and cancel.......
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    child: Center(
                      child: Text(
                        local.other_transactions_stockTransfer_saveButton,
                        style: context.textStyle.s14.white.roboto.bold,
                      ),
                    ),
                    height: height * 0.0620,
                    width: width * 0.420,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ColorResources.indigoBlue,
                    ),
                  ),
                ),
                SizedBox(width: width * 0.05),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    child: Center(
                      child: Text(
                        local.expense_cancelButton,
                        style: context.textStyle.s14.white.roboto.bold,
                      ),
                    ),
                    height: height * 0.0620,
                    width: width * 0.420,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ColorResources.bluishGray,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
