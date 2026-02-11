import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/core/utils/constants.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/presentation/views/home_screen/transactions_container.dart';
import 'package:mpos_beat/presentation/views/transactions/transaction_order_booking/transaction_order_booking_screen.dart';

class Tab1Transactions extends StatefulWidget {
  final TransactionArgs data;
  final PartyMasterData party;

  const Tab1Transactions({super.key, required this.data, required this.party});

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
    final appDb = sl<AppDb>();

    return StreamBuilder<List<VoucherType>>(
      stream: appDb.voucherTypesDao.watchPermittedVoucherTypes(
        companyId: widget.data.company.id ?? 0,
        userId: widget.data.userDetails.userId,
      ),

      builder: (context, snapshot) {
        // 🔹 Loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        // 🔹 Empty
        final vouchers = snapshot.data ?? [];
        if (vouchers.isEmpty) {
          return Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              Image.asset(
                AppAssets.noData,
                height: context.getSize.height * 0.25,
              ),
              h4,
              Text(
                "No voucher listing found",
                style: context.textStyle.s12.w400.bluishGray.roboto,
              ),
            ],
          );
        }

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2,
            mainAxisSpacing: 3,
            crossAxisSpacing: 4,
          ),
          itemCount: vouchers.length,
          itemBuilder: (context, index) {
            final voucher = vouchers[index];

            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: GestureDetector(
                onTap: () {
                  // NEXT STEP:
                  // route = voucher.routeName OR voucher.voucherType
                  if (voucher.voucherMenuName == "Sales Order") {
                    context.pushNamed(
                      AppRouterConst.transactionOrderBooking,
                      extra: TransactionOrderBookingRouteArgs(
                        data: widget.data,
                        party: widget.party,
                      ),
                    );
                  } else if (voucher.voucherMenuName == "Sales") {
                    context.pushNamed(
                      AppRouterConst.salesScreen,
                      extra: TransactionOrderBookingRouteArgs(
                        data: widget.data,
                        party: widget.party,
                      ),
                    );
                  } else if (voucher.voucherMenuName == "Sales Return") {
                    context.pushNamed(AppRouterConst.salesReturnScreen);
                  } else if (voucher.voucherMenuName == "Receipt") {
                    context.pushNamed(AppRouterConst.receiptScreen);
                  } else if (voucher.voucherMenuName == "Payments") {
                    context.pushNamed(AppRouterConst.paymentScreen);
                  } else if (voucher.voucherMenuName == "Purchase") {
                    context.pushNamed(AppRouterConst.purchaseScreen);
                  } else if (voucher.voucherMenuName == "Purchase Return") {
                    context.pushNamed(AppRouterConst.purchaseReturnSCreen);
                  } else if (voucher.voucherMenuName == "Expense") {
                    // context.pushNamed(AppRouterConst.purchaseReturnSCreen);
                  } else if (voucher.voucherMenuName == "Feedback") {
                    // context.pushNamed(AppRouterConst.purchaseReturnSCreen);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: colors[index % colors.length],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        images[index % images.length],
                        height: 21,
                        width: 24,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        voucher.voucherMenuName,
                        textAlign: TextAlign.center,
                        style: context.textStyle.dustyBlue.roboto.s12.w300,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
