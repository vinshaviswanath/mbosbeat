import 'package:mpos_beat/core/network/network_provider.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/logic/user_provider.dart';
import 'package:mpos_beat/presentation/views/customer_transactions/tabs/tab1_transactions.dart';
import 'package:mpos_beat/presentation/views/customer_transactions/tabs/tab2_outstanding.dart';
import 'package:mpos_beat/presentation/views/customer_transactions/tabs/tab3_visit_history.dart';
import 'package:mpos_beat/presentation/views/customer_transactions/transaction_detail_page/skip_dialog.dart';
import 'package:mpos_beat/presentation/views/home_screen/transactions_container.dart';

class TransactionDetailpage extends StatefulWidget {
  final TransactionArgs data;
  const TransactionDetailpage({super.key, required this.data});

  @override
  State<TransactionDetailpage> createState() => _TransactionDetailpageState();
}

class _TransactionDetailpageState extends State<TransactionDetailpage>
    with SingleTickerProviderStateMixin {
  String? checkInTime;
  String? checkOutTime;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // Forces widget rebuild to update colors
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<UserProvider>();
      provider.getSkipReasons(context);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  String _getCurrentTime() {
    final now = DateTime.now();
    return "${now.hour}:${now.minute.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    final applocalization = context.l10n;
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    // final color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          applocalization.customer_transaction_detail_check_in_out,
          style: context.textStyle.roboto.s20.bold.indigoBlue,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 18),
          onPressed: () {
            context.pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.edit_note_outlined,
              //color: Appcolor.primary,
              size: 22,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Alackal Stores, Kuruppamthara",
                      style: context.textStyle.s12.roboto.indigoBlue.w600,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.002,
                    ),
                    //gst no.....
                    Text(
                      "${applocalization.customer_transaction_detail_GSTno}JDGSJ2468246572",
                      style: context.textStyle.s08.roboto.dustyBlue,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.002,
                    ),
                    //contact person.....
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: ColorResources.dustyBlue,
                          size: 11,
                        ),
                        Text(
                          "${applocalization.customer_transaction_detail_ContactPerson}: Gopakumar",

                          style: context.textStyle.s08.roboto.dustyBlue,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.002,
                    ),
                    //mobile......
                    Row(
                      children: [
                        const Icon(
                          Icons.phone_android,
                          color: ColorResources.dustyBlue,
                          size: 11,
                        ),
                        Text(
                          "${applocalization.customer_transaction_detail_Mobile} 9876543215",
                          style: context.textStyle.s08.roboto.dustyBlue,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.002,
                    ),
                    //address....
                    Text(
                      "${applocalization.customer_transaction_detail_Address}: Kuruppamthara, Kerala",
                      style: context.textStyle.s08.roboto.dustyBlue,
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      applocalization.customer_transaction_detail_Balance,
                      style: context.textStyle.s09.roboto.dustyBlue,
                    ),

                    //balance....
                    Text(
                      "56,874.00 Cr",
                      style: context.textStyle.s14.roboto.indigoBlue.w600,
                    ),

                    //signal strength.....
                    Row(
                      children: [
                        Text(
                          'Signal Strength :',
                          style: context.textStyle.s10.w400.dustyBlue,
                        ),
                        const SizedBox(width: 8),
                        const NetworkSignalBars(),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.004,
                    ),
                    //checkin and skip button.....
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (checkInTime == null) {
                                // First time clicking check-in
                                checkInTime = _getCurrentTime();
                                checkOutTime = null; // reset checkout
                              }
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              color: ColorResources.rosePink,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              child: Text(
                                checkInTime ??
                                    applocalization
                                        .customer_transaction_detail_CheckIn,
                                style: context.textStyle.s09.roboto.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (checkInTime != null && checkOutTime == null) {
                                // If already checked in, allow checkout
                                checkOutTime = _getCurrentTime();
                                checkInTime = null; // reset checkin button
                              } else if (checkInTime == null &&
                                  checkOutTime == null) {
                                skipDialog(context);
                              }
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              color:
                                  (checkInTime != null && checkOutTime == null)
                                  ? ColorResources.errorRed
                                  : checkOutTime != null
                                  ? ColorResources.rosePink
                                  : ColorResources.bluishGray,
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                child: Text(
                                  checkInTime != null && checkOutTime == null
                                      ? applocalization
                                            .customer_transaction_detail_CheckOut
                                      : checkOutTime ??
                                            applocalization
                                                .customer_transaction_detail_Skip,
                                  style: context.textStyle.s11.roboto.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Divider(
              height: 2,
              thickness: 0.8,
              color: ColorResources.palegrayblue,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text(
              applocalization.customer_transaction_detail_ModuleSummary,
              style: context.textStyle.s14.roboto.indigoBlue.bold,
            ),

            //tabs....
            TabBar(
              labelPadding: EdgeInsets.only(right: 10),
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              dividerColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              controller: _tabController,
              tabs: [
                Tab(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: _tabController.index == 0
                          ? ColorResources.indigoBlue
                          : ColorResources.babyblue,
                    ),

                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 9,
                      ),
                      child: Text(
                        'Transactions',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: _tabController.index == 0
                              ? ColorResources.white
                              : ColorResources.dustyBlue,
                        ),
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: _tabController.index == 1
                          ? ColorResources.indigoBlue
                          : ColorResources.babyblue,
                    ),

                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 9,
                      ),
                      child: Text(
                        'Outstanding',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: _tabController.index == 1
                              ? ColorResources.white
                              : ColorResources.dustyBlue,
                        ),
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: _tabController.index == 2
                          ? ColorResources.indigoBlue
                          : ColorResources.babyblue,
                    ),

                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 9,
                      ),
                      child: Text(
                        'VisitHistory',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: _tabController.index == 2
                              ? ColorResources.white
                              : ColorResources.dustyBlue,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            //pages....
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Tab1Transactions(data: widget.data),
                  Tab2Outstanding(),
                  Tab3VisitHistory(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NetworkSignalBars extends StatelessWidget {
  const NetworkSignalBars({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<NetworkProvider>();
    final quality = provider.quality;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// Signal quality text
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: Text(
            quality.value,
            key: ValueKey(quality),
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: quality.color,
            ),
          ),
        ),

        const SizedBox(width: 8),

        /// Signal bars
        Row(
          children: List.generate(4, (index) {
            final isActive = index < quality.bars;

            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              width: 3,
              height: 4.0 + index * 4,
              decoration: BoxDecoration(
                color: isActive ? quality.color : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            );
          }),
        ),
      ],
    );
  }
}
