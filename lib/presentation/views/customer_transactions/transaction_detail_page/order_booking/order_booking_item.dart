import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mpos_beat/core/theme/text_styles.dart';
import 'package:mpos_beat/core/utils/extentions.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';

class OrderBookingItems extends StatefulWidget {
  const OrderBookingItems({super.key});

  @override
  State<OrderBookingItems> createState() => _OrderBookingItemsState();
}

class _OrderBookingItemsState extends State<OrderBookingItems> {
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

        title: Column(
          children: [
            Text("Alackal Stores"),
            Text(
              "Order Value : 18000.00",
              style: context.textStyle.s14.dustyBlue.roboto.w500,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: CustomTextField(
              suffixIcon: const Icon(
                Icons.search,
                color: ColorResources.palegrayblue,
              ),

              hint: local
                  .transaction_detail_order_booking_add_item_search_product,
              backgroundColor: ColorResources.lightGray,
              borderRadius: 12,
              borderColor: ColorResources.transparent,
            ),
          ),
          Divider(
            color: ColorResources.palegrayblue,
            height: 3,
            thickness: 1.4,
          ),
          SizedBox(height: height * 0.01),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 58),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  local
                      .transaction_detail_order_booking_add_item_select_by_group,
                  style: context.textStyle.roboto.dustyBlue.s12,
                ),
                Text(
                  local
                      .transaction_detail_order_booking_add_item_select_by_category,
                  style: context.textStyle.roboto.dustyBlue.s12,
                ),
              ],
            ),
          ),

          //select by group....
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: height * 0.06,
                width: width * 0.450,
                child: DropdownButtonFormField(
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: ColorResources.indigoBlue,
                  ),

                  //dropdown shape and color....
                  borderRadius: BorderRadius.circular(15),
                  dropdownColor: color.onPrimary,
                  items: [
                    DropdownMenuItem(
                      child: Text(
                        local
                            .transaction_detail_order_booking_add_item_select_group,
                        style: context.textStyle.roboto.bluishGray.s11,
                      ),
                    ),
                  ],
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    fillColor: ColorResources.lightGray,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                ),
              ),

              //select by category...
              Container(
                height: height * 0.06,
                width: width * 0.450,
                child: DropdownButtonFormField(
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: ColorResources.indigoBlue,
                  ),
                  //dropdown shape and color....
                  borderRadius: BorderRadius.circular(15),
                  dropdownColor: color.onPrimary,
                  items: [
                    DropdownMenuItem(
                      child: Text(
                        local
                            .transaction_detail_order_booking_add_item_select_by_category,
                        style: context.textStyle.roboto.bluishGray.s11,
                      ),
                    ),
                  ],
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    fillColor: ColorResources.lightGray,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.01),
          Divider(
            color: ColorResources.palegrayblue,
            height: 3,
            thickness: 1.4,
            indent: 18,
            endIndent: 23,
          ),
          SizedBox(height: height * 0.01),
          Expanded(
            child: Container(
              width: width * 0.920,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: [
                        Row(
                          children: [
                            //product....
                            Text(
                              "Black & Broken Rice",
                              style:
                                  context.textStyle.roboto.dustyBlue.s14.w600,
                            ),
                            SizedBox(width: width * 0.0750),
                            Spacer(),

                            //saleable stock.....
                            Text(
                              "${local.transaction_detail_order_booking_add_item_seleable_stock} 0 Qls",
                              style:
                                  context.textStyle.roboto.indigoBlue.s14.bold,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 13),
                          child: Row(
                            children: [
                              Text(
                                "${local.transaction_detail_order_booking_add_item_group}: Category name",
                                style:
                                    context.textStyle.roboto.dustyBlue.s10.w500,
                              ),
                              Spacer(),
                              Text(
                                "MRP",
                                style: context.textStyle.roboto.rosePink.s09,
                              ),
                              SizedBox(width: width * 0.04),
                              Text(
                                "tax%",
                                style: context.textStyle.roboto.rosePink.s09,
                              ),
                              SizedBox(width: width * 0.04),
                              Text(
                                "Incl.Rate",
                                style: context.textStyle.roboto.rosePink.s09,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Spacer(),

                            //Mrp.......
                            Text(
                              "2000",
                              style: context.textStyle.roboto.rosePink.s11,
                            ),
                            SizedBox(width: width * 0.04),

                            //Tax.......
                            Text(
                              "43%",
                              style: context.textStyle.roboto.rosePink.s11,
                            ),
                            SizedBox(width: width * 0.04),

                            //Incl.Rate.......
                            Text(
                              "1800.00",
                              style: context.textStyle.roboto.rosePink.s11,
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.0150),
                        Row(
                          children: [
                            Text(
                              local
                                  .transaction_detail_order_booking_add_order_qty,
                              style: texttheme.labelSmall!.copyWith(
                                decorationColor: color.primary,
                                decoration: TextDecoration.underline,
                                color: color.primary,
                              ),
                            ),
                            SizedBox(width: width * 0.300),
                            Text(
                              local.transaction_detail_order_booking_rate,
                              style: texttheme.labelSmall!.copyWith(
                                decorationColor: color.primary,
                                decoration: TextDecoration.underline,
                                color: color.primary,
                              ),
                            ),
                            SizedBox(width: width * 0.0850),
                            Text(
                              local.transaction_detail_order_booking_discount,
                              style: texttheme.labelSmall!.copyWith(
                                decorationColor: color.primary,
                                decoration: TextDecoration.underline,
                                color: color.primary,
                              ),
                            ),
                            Spacer(),

                            //delete....
                            GestureDetector(
                              onTap: () {},
                              child: Icon(Icons.delete, color: color.error),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            //order qty...
                            Container(
                              child: TextField(
                                cursorHeight: 11,
                                style: texttheme.labelSmall!.copyWith(
                                  fontSize: 15,
                                  color: color.onSecondary,
                                ),
                                decoration: InputDecoration(
                                  border:
                                      InputBorder.none, // Removes the underline
                                  contentPadding: EdgeInsets.all(10),
                                ),
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: color.onSecondary),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              height: height * 0.0400,
                              width: width * 0.150,
                            ),
                            SizedBox(width: width * 0.01),

                            //Nos.....
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: color.onSecondary),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              height: height * 0.0400,
                              width: width * 0.150,
                              child: DropdownButtonFormField(
                                //dropdown shape and color
                                borderRadius: BorderRadius.circular(15),
                                dropdownColor: color.onPrimary,
                                items: [
                                  DropdownMenuItem(
                                    child: Text(
                                      "Nos",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.labelMedium,
                                    ),
                                  ),
                                ],
                                onChanged: (value) {},
                                decoration: InputDecoration(
                                  border:
                                      InputBorder.none, // Removes the underline
                                  contentPadding: EdgeInsets.only(
                                    bottom: 16,
                                    left: 5,
                                  ),
                                ),
                              ),
                            ),

                            //add.....
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add_circle,
                                size: 30,
                                color: color.primary,
                              ),
                            ),

                            //rate.....
                            Container(
                              child: TextField(
                                cursorHeight: 11,
                                style: texttheme.labelSmall!.copyWith(
                                  fontSize: 15,
                                  color: color.onSecondary,
                                ),
                                decoration: InputDecoration(
                                  border:
                                      InputBorder.none, // Removes the underline
                                  contentPadding: EdgeInsets.all(10),
                                ),
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: color.onSecondary),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              height: height * 0.0400,
                              width: width * 0.150,
                            ),
                            SizedBox(width: width * 0.01),

                            //discount.....
                            Container(
                              child: TextField(
                                cursorHeight: 11,
                                style: texttheme.labelSmall!.copyWith(
                                  fontSize: 15,
                                  color: color.onSecondary,
                                ),
                                decoration: InputDecoration(
                                  border:
                                      InputBorder.none, // Removes the underline
                                  contentPadding: EdgeInsets.all(10),
                                ),
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: color.onSecondary),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              height: height * 0.0400,
                              width: width * 0.150,
                            ),
                            Spacer(),

                            //amount....
                            Text(
                              "9000.00",
                              style: texttheme.titleMedium!.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: ColorResources.palegrayblue,
                          height: 3,
                          thickness: 1.4,
                        ),
                        SizedBox(height: height * 0.0100),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
