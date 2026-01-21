import 'package:intl/intl.dart';
import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/service/location_services.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/domain/request/checkin_params.dart';
import 'package:mpos_beat/domain/request/checkout_params.dart';
import 'package:mpos_beat/presentation/logic/user_provider.dart';
import 'package:mpos_beat/core/network/network_provider.dart';
import 'package:mpos_beat/presentation/views/customer_transactions/tabs/tab1_transactions.dart';
import 'package:mpos_beat/presentation/views/customer_transactions/tabs/tab2_outstanding.dart';
import 'package:mpos_beat/presentation/views/customer_transactions/tabs/tab3_visit_history.dart';
import 'package:mpos_beat/presentation/views/customer_transactions/transaction_detail_page/skip_dialog.dart';
import 'package:mpos_beat/presentation/views/home_screen/transactions_container.dart';

class TransactionDetailpage extends StatefulWidget {
  final TransactionArgs data;
  final PartyMasterData party;
  const TransactionDetailpage({
    super.key,
    required this.data,
    required this.party,
  });

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
      setState(() {});
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

  int? _checkInId;
  void _showSnack(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text(
            message,
            textAlign: TextAlign.center,
            style: context.textStyle.s12.w500.white.roboto,
          ),
          backgroundColor: ColorResources.black.withValues(alpha: 0.6),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
  }

  Future<void> _handleCheckIn(BuildContext context) async {
    final locationService = sl<LocationService>();
    final provider = context.read<UserProvider>();

    try {
      final position = await locationService.getCurrentLocation();
      final address = await locationService.getNormalAddress(
        position.latitude,
        position.longitude,
      );
      final now = DateTime.now();
      final response = await provider.checkIn(
        params: CheckinParams(
          tripId: 101,
          vistType: "Regular",
          visitSequence: 1,
          partyId: widget.party.ledgerId,
          partyName: widget.party.ledgerName ?? "",
          date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
          time: DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(now),
          latitude: position.latitude,
          longitude: position.longitude,
          accuracy: position.accuracy,
          address: address,
        ),
      );

      if (response != null) {
        if (response.status == 1) {
          setState(() {
            _checkInId = response.id;
            checkInTime = _getCurrentTime();
            checkOutTime = null;
          });
          _showSnack(context, response.message ?? "Check-in successful");
        }
      } else if (response!.status == 0 &&
          response.message == "Customer Already Check In") {
        setState(() {
          _checkInId = response.id;
          checkInTime = _getCurrentTime();
          checkOutTime = null;
        });
        _showSnack(context, response.message!);
      } else {
        _showSnack(context, response.message ?? "Check-in failed");
      }
    } catch (e) {
      debugPrint("Check-in error: $e");
    }
  }

  Future<void> _handleCheckout(
    BuildContext context, {
    required String remarks,
  }) async {
    final locationService = sl<LocationService>();
    final provider = context.read<UserProvider>();
    try {
      final position = await locationService.getCurrentLocation();
      final address = await locationService.getNormalAddress(
        position.latitude,
        position.longitude,
      );
      final now = DateTime.now();
      final response = await provider.checkOut(
        context,
        params: CheckoutParams(
          tripId: 101,
          time: DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(now),
          latitude: position.latitude,
          longitude: position.longitude,
          accuracy: position.accuracy,
          address: address,
          checkinId: _checkInId!,
          remarks: remarks,
        ),
      );
      if (response != null) {
        if (response.status == 1) {
          setState(() {
            checkOutTime = _getCurrentTime();
            checkInTime = null;
            _checkInId = null;
          });
          _showSnack(context, response.message ?? "Check-out successful");
        }
      } else if (response!.status == 0 &&
          response.message ==
              "Customer Already Check Out/ Invalid Check In ID") {
        setState(() {
          checkOutTime = _getCurrentTime();
          checkInTime = null;
          _checkInId = null;
        });
        _showSnack(context, response.message!);
      } else {
        _showSnack(context, response.message ?? "Check-out failed");
      }
    } catch (e) {
      debugPrint("Check-out error: $e");
    }
  }

  Future<void> _showCheckoutRemarksDialog(BuildContext context) async {
    final TextEditingController remarksController = TextEditingController();

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Checkout Remarks",
            style: context.textStyle.s14.roboto.bold,
          ),
          content: TextField(
            controller: remarksController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: "Enter remarks",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () async {
                final remarks = remarksController.text.trim();

                if (remarks.isEmpty) {
                  _showSnack(context, "Please enter remarks");
                  return;
                }

                Navigator.pop(context);

                await _handleCheckout(context, remarks: remarks);
              },
              child: const Text("Submit"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final applocalization = context.l10n;
    final appDb = sl<AppDb>();
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
            icon: Icon(Icons.edit_note_outlined, size: 22),
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
                      widget.party.ledgerName ?? "",
                      style: context.textStyle.s12.roboto.indigoBlue.w600,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.002,
                    ),
                    //gst no.....
                    Text(
                      "${applocalization.customer_transaction_detail_GSTno}${widget.party.taxNumber}",
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
                          "${applocalization.customer_transaction_detail_ContactPerson}: G${widget.party.contactPerson}",

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
                          "${applocalization.customer_transaction_detail_Mobile} ${widget.party.mobile}",
                          style: context.textStyle.s08.roboto.dustyBlue,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.002,
                    ),
                    //address....
                    Text(
                      "${applocalization.customer_transaction_detail_Address}: ${widget.party.address1}",
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
                      "${widget.party.closingBalance}",
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
                    StreamBuilder<CompanySettingsTableData?>(
                      stream: appDb.companySettingsDao.watchcheckInOutSetting(
                        widget.data.company.id ?? 0,
                      ),
                      builder: (_, snap) {
                        final setting = snap.data;
                        if (setting == null || setting.settingsValue != "Yes") {
                          return const SizedBox.shrink();
                        }
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                if (checkInTime == null) {
                                  await _handleCheckIn(context);
                                }
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
                              onTap: () async {
                                if (checkInTime != null &&
                                    checkOutTime == null) {
                                  await _showCheckoutRemarksDialog(context);
                                } else if (checkInTime == null &&
                                    checkOutTime == null) {
                                  skipDialog(context);
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(11),
                                  color:
                                      (checkInTime != null &&
                                          checkOutTime == null)
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
                                      checkInTime != null &&
                                              checkOutTime == null
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
                        );
                      },
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
