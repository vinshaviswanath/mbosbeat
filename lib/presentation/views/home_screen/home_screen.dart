import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';
import 'package:mpos_beat/presentation/logic/user_provider.dart';
import 'package:mpos_beat/presentation/views/admin_home/widget/common_logoutdialogbox.dart';
import 'package:mpos_beat/presentation/views/home_screen/endTrip_dialogbox.dart';
import 'package:mpos_beat/presentation/views/home_screen/markEndDay_dialogobox.dart';
import 'package:mpos_beat/presentation/views/home_screen/startTrip_dialogbox.dart';
import 'package:mpos_beat/presentation/views/home_screen/transactions_container.dart';
import 'package:mpos_beat/presentation/views/home_screen/trip_summary.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  final Company company;
  const HomeScreen({super.key, required this.company});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedRouteName;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadData();
      await loadSavedRoute();
    });
  }

  Future<void> loadSavedRoute() async {
    final prefs = sl<SharedPreferences>();
    setState(() {
      selectedRouteName = prefs.getString('last_route_name');
    });
  }

  Future<void> loadData() async {
    final provider = context.read<CompanyCreationProvider>();
    final companyId = widget.company.id ?? 0;
    await Future.wait([
      provider.fetchVoucherTypes(context, companyId),
      provider.getCompanySettings(context, companyId),
      provider.getAllGodowns(context: context, companyId: companyId.toString()),
      provider.getAllRoutess(context: context, companyId: companyId.toString()),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final appDb = sl<AppDb>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.cloudGray,
        centerTitle: true,
        title: Text(
          "Home",
          style: context.textStyle.s20.indigoBlue.bold.roboto,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.sort_sharp,
            color: ColorResources.indigoBlue,
            size: 22,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.sync, color: ColorResources.dustyBlue, size: 22),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.power_settings_new_sharp,
              color: ColorResources.dustyBlue,
              size: 22,
            ),
            onPressed: () {
              CommonLogoutDialog(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// USER + ROUTE SETTINGS (SMALL STREAM)
            StreamBuilder<RegistrationDetail?>(
              stream: appDb.registrationDetailDao.watchLoggedInUser(),
              builder: (_, userSnap) {
                return StreamBuilder<CompanySettingsTableData?>(
                  stream: appDb.companySettingsDao.watchRouteSetting(
                    widget.company.id ?? 0,
                  ),
                  builder: (_, routeSnap) {
                    return HomeHeader(
                      company: widget.company,
                      user: userSnap.data,
                      routeSettings: routeSnap.data,
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
    Logger.logSuccess("valuew................${routeSettings?.settingsValue}");
    final today =
        "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}";
    return Selector<UserProvider, _HeaderState>(
      selector: (_, p) => _HeaderState(
        dayStarted: p.dayStarted,
        routeStarted: p.routeStarted,
        routeName: p.routeName,
      ),
      builder: (_, state, __) {
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
                        backgroundColor: state.dayStarted
                            ? ColorResources.mintGreen
                            : ColorResources.bluishGray,
                      ),
                      const SizedBox(width: 5),
                      _DayToggleButton(started: state.dayStarted),
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
  }
}

class _DayToggleButton extends StatelessWidget {
  final bool started;
  const _DayToggleButton({required this.started});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<UserProvider>().toggleDay();
      },
      child: Container(
        width: 40,
        height: 18,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: started ? ColorResources.roseRed : Colors.transparent,
          border: Border.all(
            color: started ? ColorResources.roseRed : ColorResources.mintGreen,
          ),
        ),
        child: Text(
          started ? "   End" : "  Start",
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
            color: started ? ColorResources.white : ColorResources.mintGreen,
          ),
        ),
      ),
    );
  }
}

class _RouteToggleButton extends StatelessWidget {
  final bool started;
  final int companyId;

  const _RouteToggleButton({required this.started, required this.companyId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!started) {
          showStartTripDialog(
            context,
            companyId: companyId,
            onTap: (routeName) {
              context.read<UserProvider>().startRoute(routeName);
            },
          );
        } else {
          showEndTripDialog(
            context,
            onTap: () {
              context.read<UserProvider>().endRoute();
              context.pop();
            },
          );
        }
      },

      child: Container(
        width: 40,
        height: 18,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: started ? ColorResources.roseRed : Colors.transparent,
          border: Border.all(
            color: started ? ColorResources.roseRed : ColorResources.mintGreen,
          ),
        ),
        child: Text(
          started ? "   End" : "  Start",
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
            color: started ? ColorResources.white : ColorResources.mintGreen,
          ),
        ),
      ),
    );
  }
}

class _HeaderState {
  final bool dayStarted;
  final bool routeStarted;
  final String? routeName;

  const _HeaderState({
    required this.dayStarted,
    required this.routeStarted,
    required this.routeName,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _HeaderState &&
          dayStarted == other.dayStarted &&
          routeStarted == other.routeStarted &&
          routeName == other.routeName;

  @override
  int get hashCode =>
      dayStarted.hashCode ^ routeStarted.hashCode ^ routeName.hashCode;
}

class TripSummarySection extends StatelessWidget {
  const TripSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    final summaryItems = [
      SummaryItem(
        value: "3.00",
        label: "Customers\nVisited",
        backgroundColor: ColorResources.pastelPurple,
        textColor: ColorResources.dustyBlue,
      ),
      SummaryItem(
        value: "1.00",
        label: "Customers\nSkipped",
        backgroundColor: ColorResources.lavenderBlue,
        textColor: ColorResources.dustyBlue,
      ),
      SummaryItem(
        value: "0.00",
        label: "Total\nValue",
        backgroundColor: ColorResources.peachPink,
        textColor: ColorResources.dustyBlue,
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Trip Summary", style: context.textStyle.s14.dustyBlue.roboto),
          const SizedBox(height: 12),
          TripSummary(items: summaryItems),
        ],
      ),
    );
  }
}

// class HomeScreen extends StatefulWidget {
//   final Company company;
//   const HomeScreen({super.key, required this.company});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   bool dayStart = false;
//   bool routStart = false;
//   String? selectedRouteName;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       await loadData();
//       await loadSavedRoute();
//     });
//   }

//   Future<void> loadSavedRoute() async {
//     final prefs = sl<SharedPreferences>();
//     setState(() {
//       selectedRouteName = prefs.getString('last_route_name');
//     });
//   }

//   Future<void> loadData() async {
//     final provider = context.read<CompanyCreationProvider>();
//     final companyId = widget.company.id ?? 0;

//     await Future.wait([
//       provider.fetchVoucherTypes(context, companyId),
//       provider.getCompanySettings(context, companyId),
//       provider.getAllGodowns(context: context, companyId: companyId.toString()),
//       provider.getAllRoutess(context: context, companyId: companyId.toString()),
//     ]);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final appDb = sl<AppDb>();
//     final summaryItems = [
//       SummaryItem(
//         value: "3.00",
//         label: "Customers\nVisited",
//         backgroundColor: ColorResources.pastelPurple,
//         textColor: ColorResources.dustyBlue,
//       ),
//       SummaryItem(
//         value: "1.00",
//         label: "Customers\nSkipped",
//         backgroundColor: ColorResources.lavenderBlue,
//         textColor: ColorResources.dustyBlue,
//       ),
//       SummaryItem(
//         value: "0.00",
//         label: "Total\nValue",
//         backgroundColor: ColorResources.peachPink,
//         textColor: ColorResources.dustyBlue,
//       ),
//     ];
//     // final appLocalization = context.l10n;

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: ColorResources.cloudGray,
//         centerTitle: true,
//         title: Text(
//           "Home",
//           style: context.textStyle.s20.indigoBlue.bold.roboto,
//         ),
//         leading: IconButton(
//           icon: Icon(
//             Icons.sort_sharp,
//             color: ColorResources.indigoBlue,
//             size: 22,
//           ),
//           onPressed: () {},
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.sync, color: ColorResources.dustyBlue, size: 22),
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: Icon(
//               Icons.power_settings_new_sharp,
//               color: ColorResources.dustyBlue,
//               size: 22,
//             ),
//             onPressed: () {
//               CommonLogoutDialog(context);
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Stack(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Color.fromARGB(255, 251, 248, 252),
//                     Color.fromARGB(255, 170, 183, 196),
//                   ],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//               ),
//             ),
//             StreamBuilder<RegistrationDetail?>(
//               stream: appDb.registrationDetailDao.watchLoggedInUser(),
//               builder: (context, snapshot) {
//                 final user = snapshot.data;

//                 return StreamBuilder<CompanySettingsTableData?>(
//                   stream: appDb.companySettingsDao.watchRouteSetting(
//                     widget.company.id ?? 0,
//                   ),
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return const SizedBox();
//                     }

//                     final routeSettings = snapshot.data;

//                     return Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 15),
//                       child: Column(
//                         crossAxisAlignment: .start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: .spaceBetween,
//                             children: [
//                               Column(
//                                 crossAxisAlignment: .start,
//                                 children: [
//                                   h16,
//                                   Text(
//                                     "Dashboard",
//                                     style: context
//                                         .textStyle
//                                         .s14
//                                         .bluishGray
//                                         .w300
//                                         .roboto,
//                                   ),
//                                   h4,
//                                   Text(
//                                     widget.company.companyName ?? '',
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: context
//                                         .textStyle
//                                         .s28
//                                         .indigoBlue
//                                         .bold
//                                         .roboto,
//                                   ),
//                                   Row(
//                                     children: [
//                                       Icon(
//                                         Icons.person_2,
//                                         color: ColorResources.dustyBlue,
//                                         size: 15,
//                                       ),
//                                       Text(
//                                         "${user?.designation}",
//                                         style: context
//                                             .textStyle
//                                             .s10
//                                             .dustyBlue
//                                             .roboto,
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 crossAxisAlignment: .end,
//                                 children: [
//                                   if (routeSettings?.settingsValue == "Yes" &&
//                                       selectedRouteName != null)
//                                     Text(
//                                       "Beat: ${selectedRouteName!}",
//                                       style: context
//                                           .textStyle
//                                           .s10
//                                           .dustyBlue
//                                           .w400
//                                           .roboto,
//                                     ),
//                                   h4,
//                                   Row(
//                                     children: [
//                                       Text(
//                                         "Day : ",
//                                         style: context
//                                             .textStyle
//                                             .s10
//                                             .dustyBlue
//                                             .roboto,
//                                       ),
//                                       Text(
//                                         "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
//                                         style: context
//                                             .textStyle
//                                             .s10
//                                             .dustyBlue
//                                             .roboto,
//                                       ),
//                                       SizedBox(width: 5),
//                                       CircleAvatar(
//                                         radius: 6,
//                                         backgroundColor: dayStart
//                                             ? ColorResources.mintGreen
//                                             : ColorResources.bluishGray,
//                                       ),
//                                       SizedBox(width: 5),
//                                       GestureDetector(
//                                         onTap: () {
//                                           setState(() {
//                                             dayStart = !dayStart;
//                                           });
//                                           if (!dayStart) {
//                                             showMarkEndDayDialog(context);
//                                           }
//                                         },
//                                         child: Container(
//                                           width: 40,
//                                           height: 18,
//                                           decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.circular(
//                                               10,
//                                             ),
//                                             color: dayStart
//                                                 ? ColorResources.roseRed
//                                                 : Colors.transparent,
//                                             border: Border.all(
//                                               color: dayStart
//                                                   ? ColorResources.roseRed
//                                                   : ColorResources.mintGreen,
//                                             ),
//                                           ),
//                                           child: Text(
//                                             dayStart ? "   End" : "  Start",
//                                             style: Theme.of(context)
//                                                 .textTheme
//                                                 .labelSmall!
//                                                 .copyWith(
//                                                   color: dayStart
//                                                       ? ColorResources.white
//                                                       : ColorResources
//                                                             .mintGreen,
//                                                 ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   if (routeSettings?.settingsValue ==
//                                       "Yes") ...[
//                                     h10,
//                                     Row(
//                                       children: [
//                                         Text(
//                                           "Route : ",
//                                           style: context
//                                               .textStyle
//                                               .s10
//                                               .dustyBlue
//                                               .roboto,
//                                         ),
//                                         Text(
//                                           " Start",
//                                           style: context
//                                               .textStyle
//                                               .s10
//                                               .dustyBlue
//                                               .roboto,
//                                         ),
//                                         SizedBox(width: 5),
//                                         CircleAvatar(
//                                           radius: 6,
//                                           backgroundColor:
//                                               ColorResources.bluishGray,
//                                         ),
//                                         SizedBox(width: 5),
//                                         GestureDetector(
//                                           onTap: () {
//                                             if (!routStart) {
//                                               showStartTripDialog(
//                                                 context,
//                                                 companyId:
//                                                     widget.company.id ?? 0,
//                                                 onTap: () {
//                                                   setState(
//                                                     () =>
//                                                         routStart = !routStart,
//                                                   );
//                                                 },
//                                               );
//                                             } else {
//                                               showEndTripDialog(
//                                                 context,
//                                                 onTap: () {
//                                                   setState(() {
//                                                     routStart = !routStart;
//                                                   });
//                                                   Navigator.pop(context);
//                                                 },
//                                               );
//                                             }
//                                           },
//                                           child: Container(
//                                             width: 40,
//                                             height: 18,
//                                             decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(10),
//                                               color: routStart
//                                                   ? ColorResources.roseRed
//                                                   : Colors.transparent,
//                                               border: Border.all(
//                                                 color: routStart
//                                                     ? ColorResources.roseRed
//                                                     : ColorResources.mintGreen,
//                                               ),
//                                             ),
//                                             child: Text(
//                                               routStart ? "   End" : "  Start",
//                                               style: Theme.of(context)
//                                                   .textTheme
//                                                   .labelSmall!
//                                                   .copyWith(
//                                                     color: routStart
//                                                         ? ColorResources.white
//                                                         : ColorResources
//                                                               .mintGreen,
//                                                   ),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ],
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.03,
//                           ),
//                           Text(
//                             "Trip Summary",
//                             style: context.textStyle.s14.dustyBlue.roboto,
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.01,
//                           ),
//                           TripSummary(items: summaryItems),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.03,
//                           ),
//                           if (user != null) ...[
//                             TransactionsContainers(
//                               userDetails: user,
//                               company: widget.company,
//                             ),
//                           ],
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
