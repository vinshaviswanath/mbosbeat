import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/l10n/app_localizations.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_textField.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_user_appbar.dart';
import 'package:mpos_beat/route/app_router_const.dart';
import 'package:mpos_beat/route/router.dart';

class CustomerTransactions extends StatefulWidget {
  const CustomerTransactions({super.key});

  @override
  State<CustomerTransactions> createState() => _CustomerTransactionsState();
}

class _CustomerTransactionsState extends State<CustomerTransactions> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final appLocalization = context.l10n;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: ColorResources.white,
      appBar: AppBar(
        title: Text(appLocalization.customer_transactions_screen_title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            context.pop();
          },
        ),
      ),

      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: CustomTextField(
              suffixIcon: const Icon(
                Icons.search,
                color: ColorResources.bluishGray,
              ),
              controller: searchController,
              hint:
                  appLocalization.customer_transactions_screen_search_customer,
              backgroundColor: ColorResources.lightGray,
              borderRadius: 12,
              borderColor: ColorResources.transparent,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          const Divider(
            color: ColorResources.lightGray,
            height: 3,
            thickness: 1.4,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.005),
          Expanded(
            child: Container(
              // width: width * 0.920,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.pushNamed(AppRouterConst.transactionDetailpage);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorResources.indigoBlue.withOpacity(0.1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Alackal Stores, Kuruppamthara",
                                        style: context
                                            .textStyle
                                            .s14
                                            .w600
                                            .indigoBlue
                                            .roboto,
                                      ),
                                      Spacer(),
                                      Text(
                                        "Balance",
                                        style: context
                                            .textStyle
                                            .s10
                                            .dustyBlue
                                            .roboto,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: height * 0.002),

                                  //contact person
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.person,
                                        color: ColorResources.bluishGray,
                                        size: 13,
                                      ),
                                      Text(
                                        "Contact Person : Gopakumar",
                                        style: context
                                            .textStyle
                                            .s09
                                            .dustyBlue
                                            .roboto,
                                      ),
                                      Spacer(),
                                      Text(
                                        "26,500.00 Cr",
                                        style: context
                                            .textStyle
                                            .s14
                                            .rosePink
                                            .roboto
                                            .w600,
                                      ),
                                    ],
                                  ),

                                  //mobile number
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.phone_android,
                                        color: ColorResources.bluishGray,
                                        size: 13,
                                      ),
                                      Text(
                                        "Mobile : 9876543215",
                                        style: context
                                            .textStyle
                                            .s09
                                            .dustyBlue
                                            .roboto,
                                      ),
                                      Spacer(),
                                      const CircleAvatar(
                                        backgroundColor:
                                            ColorResources.freshgreen,

                                        radius: 10,
                                        child: Icon(
                                          Icons.call_rounded,
                                          size: 12,
                                          color: ColorResources.white,
                                        ),
                                      ),
                                      SizedBox(width: width * 0.01),
                                      const CircleAvatar(
                                        backgroundColor:
                                            ColorResources.dustyBlue,
                                        radius: 10,
                                        child: Icon(
                                          Icons.location_on_sharp,
                                          size: 12,
                                          color: ColorResources.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.005,
                          ),
                          const Divider(
                            color: ColorResources.lightGray,
                            height: 3,
                            thickness: 1.4,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.005,
                          ),
                        ],
                      ),
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
