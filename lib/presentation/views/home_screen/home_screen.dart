// ignore_for_file: use_build_context_synchronously

import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/service/location_services.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';
import 'package:mpos_beat/presentation/dialogs/auth_dialogs.dart';
import 'package:mpos_beat/presentation/logic/user_provider.dart';
import 'package:mpos_beat/presentation/views/admin_home/widget/common_logoutdialogbox.dart';
import 'package:mpos_beat/presentation/views/home_screen/dialogs/endTrip_dialogbox.dart';
import 'package:mpos_beat/presentation/views/home_screen/dialogs/mark_attendance.dart';
import 'package:mpos_beat/presentation/views/home_screen/dialogs/startTrip_dialogbox.dart';
import 'package:mpos_beat/presentation/views/home_screen/transactions_container.dart';
import 'package:mpos_beat/presentation/views/home_screen/trip_summary.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mpos_beat/presentation/views/home_screen/controller/home_init_controller.dart';
import 'package:mpos_beat/presentation/views/home_screen/widgets/home_content.dart';
import 'package:mpos_beat/presentation/views/home_screen/widgets/home_appBar.dart';
import 'package:mpos_beat/presentation/views/home_screen/widgets/home_loading_overlay.dart';
import 'package:mpos_beat/presentation/views/home_screen/widgets/home_shimmer.dart';

class HomeScreen extends StatefulWidget {
  final Company company;
  const HomeScreen({super.key, required this.company});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeInitController _controller;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final provider = Provider.of<UserProvider>(context, listen: false);
      await loadData();
      await loadSavedRoute();

      provider.setCompanyId(widget.company.id!);
      await provider.partyMasterSync();

      final appDb = sl<AppDb>();
      final appDb = sl<AppDb>();
  await appDb.partyMasterDao.getAllParties();
      final parties = await appDb.partyMasterDao.getAllParties();
          Logger.logInfo("📦 PartyMaster DB count:....................................................................... ${parties.length}");

    });
    super.initState();
  }


  Future<void> loadSavedRoute() async {
    final prefs = sl<SharedPreferences>();
    setState(() {
      selectedRouteName = prefs.getString('last_route_name');
    _controller = sl<HomeInitController>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.initialize(context, widget.company);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(
      "id......................................................${widget.company.id}",
    );
    final appDb = sl<AppDb>();

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) async {
        final userId = await appDb.registrationDetailDao.getLoggedInUserId();

        final value = await appDb.userSettingsDao.getCompanySwitchingValue(
          userId ?? 0,
        );

                  },
                );
              },
            ),

            const SizedBox(height: 20),
            const TripSummarySection(),
            const SizedBox(height: 20),

            StreamBuilder<RegistrationDetail?>(
              stream: appDb.registrationDetailDao.watchLoggedInUser(),
              builder: (_, snap) {
                if (snap.data == null) return const SizedBox();
                return TransactionsContainers(
                  userDetails: snap.data!,
                  company: widget.company,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HomeHeader extends StatelessWidget {
  final Company company;
  final RegistrationDetail? user;
  final CompanySettingsTableData? routeSettings;

  const HomeHeader({
    super.key,
    required this.company,
    required this.user,
    required this.routeSettings,
  });

  @override
  Widget build(BuildContext context) {
    final today =
        "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}";
    return Selector<UserProvider, _HeaderState>(
      selector: (_, p) => _HeaderState(
        dayStarted: p.dayStarted,
        routeStarted: p.routeStarted,
        routeName: p.routeName,
      ),
      builder: (_, state, __) {
        return Consumer<UserProvider>(
          builder: (context, provider, _) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// LEFT
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      h16,
                      Text(
                        "Dashboard",
                        style: context.textStyle.s14.bluishGray.w300.roboto,
                      ),
                      h4,
                      Text(
                        company.companyName ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.textStyle.s28.indigoBlue.bold.roboto,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.person_2,
                            size: 15,
                            color: ColorResources.dustyBlue,
                          ),
                          Text(
                            user?.designation ?? '',
                            style: context.textStyle.s10.dustyBlue.roboto,
                          ),
                        ],
                      ),
                    ],
                  ),

                  /// RIGHT
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (routeSettings?.settingsValue == "Yes" &&
                          state.routeName != null)
                        Text(
                          "Beat: ${state.routeName}",
                          style: context.textStyle.s10.dustyBlue.roboto,
                        ),

                      h4,

                      /// DAY
                      Row(
                        children: [
                          Text(
                            "Day : ",
                            style: context.textStyle.s10.dustyBlue.roboto,
                          ),
                          Text(
                            today,
                            style: context.textStyle.s10.dustyBlue.roboto,
                          ),
                          const SizedBox(width: 5),
                          CircleAvatar(
                            radius: 6,
                            backgroundColor: provider.isAttendanceMarked
                                ? ColorResources.mintGreen
                                : ColorResources.bluishGray,
                          ),
                          const SizedBox(width: 5),
                          _DayToggleButton(
                            started: provider.isAttendanceMarked,
                          ),
                        ],
                      ),

                      /// ROUTE
                      if (routeSettings?.settingsValue == "Yes") ...[
                        h10,
                        Row(
                          children: [
                            Text(
                              "Route : ",
                              style: context.textStyle.s10.dustyBlue.roboto,
                            ),
                            Text(
                              " Start",
                              style: context.textStyle.s10.dustyBlue.roboto,
                            ),
                            const SizedBox(width: 5),
                            CircleAvatar(
                              radius: 6,
                              backgroundColor: state.routeStarted
                                  ? ColorResources.mintGreen
                                  : ColorResources.bluishGray,
                            ),
                            const SizedBox(width: 5),
                            _RouteToggleButton(
                              started: state.routeStarted,
                              companyId: company.id ?? 0,
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
       if (value == "Yes") {
          Navigator.of(context).pop();
        } else {
          final shouldExit = await AuthDialogs.show(context);
          if (shouldExit) AuthDialogs.exitApp();
        }
      },
      child: Scaffold(
        appBar: const HomeAppBar(),
        body: Selector<UserProvider, bool>(
          selector: (_, p) => p.isLoading,
          builder: (_, isLoading, __) {
            if (isLoading) {
              return const HomeScreenShimmer();
            }
            return const HomeContent();
          },
        ),
      ),
    );
  }
}
