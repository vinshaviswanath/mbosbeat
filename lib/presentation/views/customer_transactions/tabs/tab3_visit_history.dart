import 'dart:math' as math;
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/views/customer_transactions/transaction_detail_page/filter_dialog.dart';

class Tab3VisitHistory extends StatefulWidget {
  const Tab3VisitHistory({super.key});

  @override
  State<Tab3VisitHistory> createState() => _Tab3VisitHistoryState();
}

class _Tab3VisitHistoryState extends State<Tab3VisitHistory> {
  // final GlobalKey _filterKey = GlobalKey(); // key for IconButton

  @override
  Widget build(BuildContext context) {
    final applocalization = context.l10n;
    // final color = Theme.of(context).colorScheme;
    // final texttheme = Theme.of(context).textTheme;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                applocalization
                    .customer_transaction_detail_visit_history_heading,
                style: context.textStyle.s12.indigoBlue.bold,
              ),
              Spacer(),
              Transform.rotate(
                angle: math.pi / 2,
                child: Builder(
                  builder: (innerContext) {
                    return IconButton(
                      onPressed: () {
                        showFilterPopover(innerContext);
                      },
                      icon: Icon(
                        size: 20,
                        Icons.tune_outlined,
                        color: ColorResources.indigoBlue,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Divider(
            color: ColorResources.palegrayblue,
            height: 3,
            thickness: 1.4,
          ),
          SizedBox(height: height * 0.01),
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
                    .customer_transaction_detail_visit_history_transaction_no,
                style: context.textStyle.s10.roboto.dustyBlue,
              ),
              SizedBox(width: width * 0.04),
              Text(
                applocalization
                    .customer_transaction_detail_outstanding_tab_date,
                style: context.textStyle.s10.roboto.dustyBlue,
              ),
              SizedBox(width: width * 0.170),
              Text(
                applocalization.customer_transaction_detail_visit_history_type,
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
            height: height * 0.540,
            width: width * 0.920,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //sl no.....
                            Text(
                              "${index + 1}",
                              style: context.textStyle.s10.roboto.dustyBlue,
                            ),
                            SizedBox(width: width * 0.0820),

                            // transaction no.......
                            Text(
                              "HJIL2468725924",
                              style: context.textStyle.s10.roboto.dustyBlue,
                            ),
                            SizedBox(width: width * 0.0280),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //date.......
                                Text(
                                  "22-Mar-2024",
                                  style: context.textStyle.s10.roboto.dustyBlue,
                                ),

                                //time.....
                                Text(
                                  "09:30 AM 03:30PM",
                                  style: context.textStyle.s07.roboto.dustyBlue,
                                ),
                              ],
                            ),
                            SizedBox(width: width * 0.0250),

                            //type......
                            Flexible(
                              flex: 1,
                              child: Text(
                                "Salesorder",
                                style: context.textStyle.s10.roboto.dustyBlue,
                              ),
                            ),
                            Spacer(),

                            //amount.....
                            Text(
                              "17852.00",
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
              },
            ),
          ),
        ],
      ),
    );
  }
}
