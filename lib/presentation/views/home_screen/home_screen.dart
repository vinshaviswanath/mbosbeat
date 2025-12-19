import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/l10n/app_localizations.dart';
import 'package:mpos_beat/presentation/views/admin_home/widget/common_logoutdialogbox.dart';
import 'package:mpos_beat/presentation/views/home_screen/endTrip_dialogbox.dart';
import 'package:mpos_beat/presentation/views/home_screen/markEndDay_dialogobox.dart';
import 'package:mpos_beat/presentation/views/home_screen/startTrip_dialogbox.dart';
import 'package:mpos_beat/presentation/views/home_screen/transactions_container.dart';
import 'package:mpos_beat/presentation/views/home_screen/trip_summary.dart';

class HomeScreen extends StatefulWidget {
  final Company company;
  const HomeScreen({super.key, required this.company});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool dayStart = false;
  bool routStart = false;

  @override
  Widget build(BuildContext context) {
    final appDb = sl<AppDb>();

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
    final appLocalization = context.l10n;

    final local = AppLocalizations.of(context);
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
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 251, 248, 252),
                    Color.fromARGB(255, 170, 183, 196),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            StreamBuilder<RegistrationDetail?>(
              stream: appDb.registrationDetailDao.watchLoggedInUser(),
              builder: (context, snapshot) {
                final user = snapshot.data;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Dashboard",
                            style: context.textStyle.s14.dustyBlue.w300.roboto,
                          ),
                          Row(
                            children: [
                              Text(
                                "Day : ",
                                style: context.textStyle.s10.dustyBlue.roboto,
                              ),
                              Text(
                                "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
                                style: context.textStyle.s10.dustyBlue.roboto,
                              ),
                              SizedBox(width: 5),
                              CircleAvatar(
                                radius: 6,
                                backgroundColor: ColorResources.bluishGray,
                              ),
                              SizedBox(width: 5),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    dayStart = !dayStart;
                                  });
                                  if (!dayStart) {
                                    showMarkEndDayDialog(context);
                                  }
                                },
                                child: Container(
                                  width: 40,
                                  height: 18,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: dayStart
                                        ? ColorResources.roseRed
                                        : Colors.transparent,
                                    border: Border.all(
                                      color: dayStart
                                          ? ColorResources.roseRed
                                          : ColorResources.mintGreen,
                                    ),
                                  ),
                                  child: Text(
                                    dayStart ? "   End" : "  Start",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(
                                          color: dayStart
                                              ? ColorResources.white
                                              : ColorResources.mintGreen,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.company.companyName ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.textStyle.s28.indigoBlue.bold.roboto,
                          ),
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
                              SizedBox(width: 5),
                              CircleAvatar(
                                radius: 6,
                                backgroundColor: ColorResources.bluishGray,
                              ),
                              SizedBox(width: 5),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    routStart = !routStart;
                                  });

                                  if (routStart) {
                                    showStartTripDialog(context);
                                  } else {
                                    showEndTripDialog(context);
                                  }
                                },
                                child: Container(
                                  width: 40,
                                  height: 18,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: routStart
                                        ? ColorResources.roseRed
                                        : Colors.transparent,
                                    border: Border.all(
                                      color: routStart
                                          ? ColorResources.roseRed
                                          : ColorResources.mintGreen,
                                    ),
                                  ),
                                  child: Text(
                                    routStart ? "   End" : "  Start",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(
                                          color: routStart
                                              ? ColorResources.white
                                              : ColorResources.mintGreen,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Icon(
                            Icons.person_2,
                            color: ColorResources.dustyBlue,
                            size: 15,
                          ),
                          Text(
                            "Territory Executive",
                            style: context.textStyle.s10.dustyBlue.roboto,
                          ),
                        ],
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Text(
                        "Trip Summary",
                        style: context.textStyle.s14.dustyBlue.roboto,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      TripSummary(items: summaryItems),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      if (user != null) ...[
                        TransactionsContainers(userDetails: user),
                      ],
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
