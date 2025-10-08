import 'package:flutter/material.dart';
import 'package:mpos_beat/core/utils/imports.dart';

class Tab2Outstanding extends StatefulWidget {
  const Tab2Outstanding({super.key});

  @override
  State<Tab2Outstanding> createState() => _Tab2OutstandingState();
}

class _Tab2OutstandingState extends State<Tab2Outstanding> {
  @override
  Widget build(BuildContext context) {
    final applocalization = context.l10n;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: height * 0.02),
          Row(
            children: [
              Text(
                applocalization
                    .customer_transaction_detail_outstanding_tab_sl_no,
                style: context.textStyle.s10.roboto.dustyBlue,
              ),
              SizedBox(width: width * 0.0200),
              Text(
                applocalization
                    .customer_transaction_detail_outstanding_tab_bill_no,
                style: context.textStyle.s10.roboto.dustyBlue,
              ),
              SizedBox(width: width * 0.165),
              Text(
                applocalization
                    .customer_transaction_detail_outstanding_tab_date,
                style: context.textStyle.s10.roboto.dustyBlue,
              ),
              SizedBox(width: width * 0.138),
              Text(
                applocalization
                    .customer_transaction_detail_outstanding_tab_due_date,
                style: context.textStyle.s10.roboto.dustyBlue,
              ),
              Spacer(),
              Text(
                applocalization
                    .customer_transaction_detail_outstanding_tab_amount,
                style: context.textStyle.s10.roboto.dustyBlue,
              ),
            ],
          ),
          Divider(
            color: ColorResources.palegrayblue,
            height: 3,
            thickness: 1.4,
          ),
          Container(
            height: height * 0.590,
            width: width * 0.920,
            child: ListView.builder(
              itemCount: 10 + 1,
              itemBuilder: (context, index) {
                if (index < 10) {
                  return GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              //sl no......
                              Text(
                                "${index + 1}",
                                style: context.textStyle.s10.roboto.dustyBlue,
                              ),
                              SizedBox(width: width * 0.0820),

                              //bill no......
                              Text(
                                "HJIL2468725924",

                                style: context.textStyle.s10.roboto.dustyBlue,
                              ),
                              SizedBox(width: width * 0.0280),

                              //date......
                              Text(
                                "22-Mar-2024",
                                style: context.textStyle.s10.roboto.dustyBlue,
                              ),
                              SizedBox(width: width * 0.0250),

                              //due date.....
                              Text(
                                "31-Mar-2024",
                                style: context.textStyle.s10.roboto.dustyBlue,
                              ),
                              Spacer(),

                              //amount......
                              Text(
                                "7852.00",
                                style: context.textStyle.s10.roboto.dustyBlue,
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
                  //total......
                  return Column(
                    children: [
                      SizedBox(height: height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            applocalization
                                .customer_transaction_detail_outstanding_total,
                            style: context.textStyle.s12.indigoBlue.bold,
                          ),
                          SizedBox(width: width * 0.0750),
                          Text(
                            "24,378.00",
                            style: context.textStyle.s12.indigoBlue.bold,
                          ),
                        ],
                      ),

                      //on account
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            applocalization
                                .customer_transaction_detail_outstanding_on_account,
                            style: context.textStyle.s12.indigoBlue.bold,
                          ),
                          SizedBox(width: width * 0.0750),
                          Text(
                            "14,378.00",
                            style: context.textStyle.s12.indigoBlue.bold,
                          ),
                        ],
                      ),

                      //grand total
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            applocalization
                                .customer_transaction_detail_outstanding_grand_total,
                            style: context.textStyle.s12.indigoBlue.bold,
                          ),
                          SizedBox(width: width * 0.0750),
                          Text(
                            "56,378.00",
                            style: context.textStyle.s12.indigoBlue.bold,
                          ),
                        ],
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
