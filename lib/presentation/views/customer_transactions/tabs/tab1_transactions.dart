import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mpos_beat/core/theme/colors.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/core/utils/constants.dart';
import 'package:mpos_beat/route/app_router_const.dart';

class Tab1Transactions extends StatefulWidget {
  const Tab1Transactions({super.key});

  @override
  State<Tab1Transactions> createState() => _Tab1TransactionsState();
}

class _Tab1TransactionsState extends State<Tab1Transactions> {
  List<String> transactionOptions = [
    AppRouterConst.transactionOrderBooking,
    AppRouterConst.telephonicOrderScreen,
    AppRouterConst.salesScreen,
    AppRouterConst.salesReturnScreen,
    AppRouterConst.receiptScreen,
    AppRouterConst.replacementScreen,
    AppRouterConst.purchaseScreen,
    AppRouterConst.purchaseReturnSCreen,
    AppRouterConst.paymentScreen,
  ];
  List<String> images = [
    "assets/images/pngs/icon-1.png",
    "assets/images/pngs/icon-2.png",
    "assets/images/pngs/icon-3.png",
    "assets/images/pngs/icon-4.png",
    "assets/images/pngs/icon-5.png",
    "assets/images/pngs/icon-6.png",
    "assets/images/pngs/icon-7.png",
    "assets/images/pngs/icon-8.png",
    "assets/images/pngs/icon-9.png",
    "assets/images/pngs/icon-10.png",
  ];
  List<String> text = [
    "ORDER BOOKING",
    "TELEPHONIC ORDER",
    "SALES",
    "SALES RETURN",
    "RECEIPT",
    "REPLACEMENT",
    "PURCHASE",
    "PURCHASE RETURN",
    "PAYMENT",
    "FEEDBACK",
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2,
        mainAxisSpacing: 3,
        crossAxisSpacing: 4,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: GestureDetector(
            onTap: () {
              context.pushNamed(transactionOptions[index]);
            },
            child: Container(
              width: 173,
              height: 87,
              decoration: BoxDecoration(
                color: colors[index % colors.length],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(images[index], height: 21, width: 24),
                  SizedBox(height: 8),
                  Text(
                    text[index],
                    style: context.textStyle.dustyBlue.roboto.s12.w300,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
