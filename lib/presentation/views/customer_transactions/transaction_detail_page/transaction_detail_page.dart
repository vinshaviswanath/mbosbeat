import 'package:intl/intl.dart';
import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/service/location_services.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/data_sources/user/party_MasterSync/party_MasterSync.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/domain/request/checkin_params.dart';
import 'package:mpos_beat/domain/request/checkout_params.dart';
import 'package:mpos_beat/presentation/logic/user_provider.dart';
import 'package:mpos_beat/core/network/network_provider.dart';
import 'package:mpos_beat/presentation/views/customer_transactions/tabs/tab1_transactions.dart';
import 'package:mpos_beat/presentation/views/customer_transactions/tabs/tab2_outstanding.dart';
import 'package:mpos_beat/presentation/views/customer_transactions/tabs/tab3_visit_history.dart';
import 'package:mpos_beat/presentation/views/home_screen/widgets/checkin_out_shimmer.dart';
import 'package:mpos_beat/presentation/views/customer_transactions/transaction_detail_page/skip_dialog.dart';
import 'package:mpos_beat/presentation/views/home_screen/transactions_container.dart';
import 'package:mpos_beat/presentation/views/home_screen/widgets/home_shimmer.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  int? _checkInId;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this)
      ..addListener(() => setState(() {}));
    load();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _restoreCheckInState();
      context.read<UserProvider>().getSkipReasons(context);
    });
  }

  Future<void> load() async {
    final party = await sl<PartyMasterSync>().fetchParty(
      widget.data.company.id!,
      widget.party.ledgerId,
    );

    if (party != null) {
      context.read<UserProvider>().applyParty(party);
    }
  }

  @override
  void didUpdateWidget(TransactionDetailpage oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.party.ledgerId != widget.party.ledgerId) {
      context.read<UserProvider>().clearSelectedPriceLevel();
      load();
    }
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

  Future<int> _getNextVisitSequence(int ledgerId) async {
    final prefs = sl<SharedPreferences>();
    final key = 'visit_sequence_$ledgerId';
    final lastSeq = prefs.getInt(key) ?? 0;
    return lastSeq + 1;
    //  return (prefs.getInt(key) ?? 0) + 1;
  }

  /* ────────────── CHECK-IN ────────────────*/

  Future<void> _handleCheckIn(BuildContext context) async {
    final prefs = sl<SharedPreferences>();
    final activePartyId = prefs.getInt('checkin_party_id');
    final userProvider = context.read<UserProvider>();

    if (activePartyId != null && activePartyId != widget.party.ledgerId) {
      _showSnack(context, "You are currently checked in with another party");
      return;
    }

    userProvider.setCheckinStarting(true);
    final visitSequence = await _getNextVisitSequence(widget.party.ledgerId);

    final locationService = sl<LocationService>();
    final provider = context.read<UserProvider>();

    try {
      final position = await locationService.getCurrentLocation();
      final address = await locationService.getNormalAddress(
        position.latitude,
        position.longitude,
      );
      print(provider.currentTripId);
      final now = DateTime.now();
      final response = await provider.checkIn(
        params: CheckinParams(
          tripId: provider.currentTripId ?? 0,
          vistType: "Regular",
          visitSequence: visitSequence,
          partyId: widget.party.ledgerId,
          partyName: widget.party.ledgerName ?? "",
          date: DateFormat('yyyy-MM-dd').format(now),
          time: DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(now),
          latitude: position.latitude,
          longitude: position.longitude,
          accuracy: position.accuracy,
          address: address,
        ),
      );

      if (response?.status == 1 && response?.id != null) {
        setState(() {
          _checkInId = response!.id;
          checkInTime = _getCurrentTime();
          checkOutTime = null;
        });

        await prefs.setInt('checkin_party_id', widget.party.ledgerId);
        await prefs.setInt('checkin_id', response?.id ?? 0);
        await prefs.setString('checkin_time', checkInTime!);

        _showSnack(context, response?.message ?? "Checked in");
      } else {
        _showSnack(context, response?.message ?? "");
      }
    } catch (e) {
      debugPrint("Check-in error: $e");
      _showSnack(context, "Unable to check in");
    } finally {
      userProvider.setCheckinStarting(false);
    }
  }

  /* ───────────────── RESTORE CHECK-IN ───────────────── */

  Future<void> _restoreCheckInState() async {
    final prefs = sl<SharedPreferences>();

    final savedPartyId = prefs.getInt('checkin_party_id');
    final savedCheckInId = prefs.getInt('checkin_id');
    final savedCheckInTime = prefs.getString('checkin_time');

    if (savedPartyId == widget.party.ledgerId &&
        savedCheckInId != null &&
        savedCheckInTime != null) {
      setState(() {
        _checkInId = savedCheckInId;
        checkInTime = savedCheckInTime;
        checkOutTime = null;
      });
    }
  }

  /* ───────────────── CHECK-OUT ───────────────── */

  Future<void> _handleCheckout(
    BuildContext context, {
    required String remarks,
  }) async {
    if (_checkInId == null) return;

    final locationService = sl<LocationService>();
    final provider = context.read<UserProvider>();
    final userProvider = context.read<UserProvider>();
    userProvider.setCheckoutStarting(true);
    try {
      final position = await locationService.getCurrentLocation();
      final address = await locationService.getNormalAddress(
        position.latitude,
        position.longitude,
      );
      print(provider.currentTripId);
      final response = await provider.checkOut(
        context,
        params: CheckoutParams(
          tripId: provider.currentTripId ?? 0,
          time: DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(DateTime.now()),
          latitude: position.latitude,
          longitude: position.longitude,
          accuracy: position.accuracy,
          address: address,
          checkinId: _checkInId!,
          remarks: remarks,
        ),
      );

      if (response?.status == 1) {
        final prefs = sl<SharedPreferences>();
        final key = 'visit_sequence_${widget.party.ledgerId}';

        final lastSeq = prefs.getInt(key) ?? 0;
        await prefs.setInt(key, lastSeq + 1);
        prefs.setInt(key, (prefs.getInt(key) ?? 0) + 1);

        setState(() {
          checkOutTime = _getCurrentTime();
          checkInTime = null;
          _checkInId = null;
        });

        await prefs.remove('checkin_party_id');
        await prefs.remove('checkin_id');
        await prefs.remove('checkin_time');

        _showSnack(context, response?.message ?? "Check-out successful");
      }
      //  else {
      //   _showSnack(context, response?.message ?? "Check-out failed");
      // }
    } catch (e) {
      debugPrint("Check-out error: $e");
    } finally {
      userProvider.setCheckoutStarting(false);
    }
  }

  /* ───────────────── CHECKOUT REMARKS ───────────────── */

  Future<void> _showCheckoutRemarksDialog(BuildContext context) async {
    final controller = TextEditingController();

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: const Text("Checkout Remarks"),
        content: TextField(
          controller: controller,
          maxLines: 3,
          decoration: const InputDecoration(hintText: "Enter remarks"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () async {
              if (controller.text.trim().isEmpty) {
                _showSnack(context, "Please enter remarks");
                return;
              }
              Navigator.pop(context);
              await _handleCheckout(context, remarks: controller.text.trim());
            },
            child: const Text("Submit"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<UserProvider>();
    final applocalization = context.l10n;
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
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.edit_note_outlined, size: 22),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Consumer<UserProvider>(
          builder: (context, provider, child) {
            if (provider.isCheckinStarting || provider.isChecoutStarting) {
              return CheckInOutShimmer();
            }

            return child!;
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.party.ledgerName ?? "",
                          maxLines: 2,
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
                            Expanded(
                              child: Text(
                                maxLines: 2,
                                "${applocalization.customer_transaction_detail_ContactPerson}: G${widget.party.contactPerson}",

                                style: context.textStyle.s08.roboto.dustyBlue,
                              ),
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

                        //  Spacer(),
                      ],
                    ),
                  ),
                  // Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
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
                        // Row(
                        //   children: [
                        //     Text(
                        //       'Signal Strength :',
                        //       style: context.textStyle.s10.w400.dustyBlue,
                        //     ),
                        //     const SizedBox(width: 8),
                        //     const NetworkSignalBars(),
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height * 0.004,
                        // ),

                        //checkin and skip button.....
                        // StreamBuilder<CompanySettingsTableData?>(
                        //   stream: appDb.companySettingsDao.watchcheckInOutSetting(
                        //     widget.data.company.id ?? 0,
                        //   ),
                        //   builder: (_, snap) {
                        //     final setting = snap.data;
                        //     if (setting == null || setting.settingsValue != "Yes") {
                        //       return const SizedBox.shrink();
                        //     }
                        //     return
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                if (provider.currentTripId == null) {
                                  _showSnack(context, "Start day and trip first");
                                  return;
                                }
                                await _handleCheckIn(context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(11),
                                  color: provider.currentTripId == null
                                      ? ColorResources.bluishGray
                                      : ColorResources.rosePink,
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
                          //  );
                          // },
                        ),
                      ],
                    ),
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
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 2,
                      ),
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
                          style: Theme.of(context).textTheme.labelSmall!
                              .copyWith(
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
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 2,
                      ),
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
                          style: Theme.of(context).textTheme.labelSmall!
                              .copyWith(
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
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 2,
                      ),
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
                          style: Theme.of(context).textTheme.labelSmall!
                              .copyWith(
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
                    Tab1Transactions(data: widget.data, party: widget.party),
                    Tab2Outstanding(),
                    Tab3VisitHistory(),
                  ],
                ),
              ),
            ],
          ),
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
