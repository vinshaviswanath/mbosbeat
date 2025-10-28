// import 'package:mpos_beat/core/utils/imports.dart';
// import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';
// import 'package:mpos_beat/presentation/views/admin_user_management/user_settings/widgets/info_tool_tip.dart';

// class CompanySettingsScreen extends StatefulWidget {
//   const CompanySettingsScreen({super.key});

//   @override
//   State<CompanySettingsScreen> createState() => _CompanySettingsScreenState();
// }

// class _CompanySettingsScreenState extends State<CompanySettingsScreen> {
//   @override
//   void initState() {
//     final provider = Provider.of<CompanyCreationProvider>(
//       context,
//       listen: false,
//     );
//     provider.getCompanySettings(context, 1336);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final appLocalizations = context.l10n;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: ColorResources.transparent,
//         foregroundColor: ColorResources.transparent,
//         surfaceTintColor: ColorResources.transparent,
//         leading: IconButton(
//           onPressed: () {
//             FocusScope.of(context).requestFocus(FocusNode());
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             Icons.keyboard_arrow_left,
//             color: ColorResources.indigoBlue,
//           ),
//         ),
//         title: Text(
//           "Company Settings",
//           style: context.textStyle.s20.indigoBlue.bold.roboto,
//         ),
//         centerTitle: true,
//         bottom: PreferredSize(
//           preferredSize: Size(MediaQuery.sizeOf(context).width, 15),
//           child: Container(color: Colors.transparent),
//         ),
//       ),
//       body: CustomScrollView(
//         slivers: [
//           SliverPadding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             sliver: SliverList(
//               delegate: SliverChildListDelegate([
//                 InfoTooltip(
//                   title: "Free Quantity",
//                   description:
//                       appLocalizations.user_settings_screen_description,
//                   onToggle: (val) {
//                     debugPrint("Switch toggled: $val");
//                   },
//                 ),
//                 h4,
//                 InfoTooltip(
//                   title: "Enable bill wise report (Stand Alone)",
//                   description:
//                       appLocalizations.user_settings_screen_description,
//                   onToggle: (val) {
//                     debugPrint("Switch toggled: $val");
//                   },
//                 ),
//                 h4,
//                 InfoTooltip(
//                   title: "Bill wise Receipt",
//                   description:
//                       appLocalizations.user_settings_screen_description,
//                   onToggle: (val) {
//                     debugPrint("Switch toggled: $val");
//                   },
//                 ),
//                 h4,
//                 InfoTooltip(
//                   title: "Auto Receipt",
//                   description:
//                       appLocalizations.user_settings_screen_description,
//                   ispremium: true,
//                   onToggle: (val) {
//                     debugPrint("Switch toggled: $val");
//                   },
//                 ),
//                 h4,
//                 InfoTooltip(
//                   title: "Day Start -End (Attendance)",
//                   description:
//                       appLocalizations.user_settings_screen_description,
//                   onToggle: (val) {
//                     debugPrint("Switch toggled: $val");
//                   },
//                 ),
//                 h4,
//                 InfoTooltip(
//                   title: "Sales Price (Party wise Single Price list)",
//                   description:
//                       appLocalizations.user_settings_screen_description,
//                   onToggle: (val) {
//                     debugPrint("Switch toggled: $val");
//                   },
//                 ),
//                 h4,
//                 InfoTooltip(
//                   title: appLocalizations.user_settings_screen_edit_transaction,
//                   description:
//                       appLocalizations.user_settings_screen_description,
//                   onToggle: (val) {
//                     debugPrint("Switch toggled: $val");
//                   },
//                 ),
//                 h4,
//                 InfoTooltip(
//                   title: "Inclusive Tax",
//                   description:
//                       appLocalizations.user_settings_screen_description,
//                   onToggle: (val) {
//                     debugPrint("Switch toggled: $val");
//                   },
//                 ),
//                 h4,
//                 InfoTooltip(
//                   title: "Item wise Discount %",
//                   description:
//                       appLocalizations.user_settings_screen_description,
//                   ispremium: true,
//                   onToggle: (val) {
//                     debugPrint("Switch toggled: $val");
//                   },
//                 ),
//                 h4,
//                 InfoTooltip(
//                   title: "Ledger Discount",
//                   description:
//                       appLocalizations.user_settings_screen_description,
//                   onToggle: (val) {
//                     debugPrint("Switch toggled: $val");
//                   },
//                 ),

//                 h4,
//                 InfoTooltip(
//                   title: "Defaut cash Sales",
//                   description:
//                       appLocalizations.user_settings_screen_description,
//                   onToggle: (val) {
//                     debugPrint("Switch toggled: $val");
//                   },
//                 ),
//                 h4,
//                 InfoTooltip(
//                   title: appLocalizations.user_settings_screen_party_creation,
//                   description:
//                       appLocalizations.user_settings_screen_description,
//                   onToggle: (val) {
//                     debugPrint("Switch toggled: $val");
//                   },
//                 ),
//                 h4,
//                 InfoTooltip(
//                   title: "Alternative Units",
//                   description:
//                       appLocalizations.user_settings_screen_description,
//                   onToggle: (val) {
//                     debugPrint("Switch toggled: $val");
//                   },
//                 ),
//                 h4,
//                 InfoTooltip(
//                   title:
//                       appLocalizations.user_settings_screen_change_voucher_date,
//                   description:
//                       appLocalizations.user_settings_screen_description,
//                   onToggle: (val) {
//                     debugPrint("Switch toggled: $val");
//                   },
//                 ),
//                 h4,
//                 InfoTooltip(
//                   title: "Enable Excise",
//                   description:
//                       appLocalizations.user_settings_screen_description,
//                   ispremium: true,
//                   onToggle: (val) {
//                     debugPrint("Switch toggled: $val");
//                   },
//                 ),
//                 h4,
//                 InfoTooltip(
//                   title: "Additional Discount Applicable:",
//                   description:
//                       appLocalizations.user_settings_screen_description,
//                   onToggle: (val) {
//                     debugPrint("Switch toggled: $val");
//                   },
//                 ),
//                 h4,
//                 InfoTooltip(
//                   title: "Net Rate Editing for Sales/Sales Return",
//                   description:
//                       appLocalizations.user_settings_screen_description,
//                   onToggle: (val) {
//                     debugPrint("Switch toggled: $val");
//                   },
//                 ),
//                 h4,
//                 InfoTooltip(
//                   title: "Remove Skip Customer Option",
//                   description:
//                       appLocalizations.user_settings_screen_description,
//                   onToggle: (val) {
//                     debugPrint("Switch toggled: $val");
//                   },
//                   ispremium: true,
//                 ),
//                 h4,
//                 InfoTooltip(
//                   title: "Is Check In/Out Control:",
//                   style: context.textStyle.s12.bold.bluishGray.roboto,
//                   description:
//                       appLocalizations.user_settings_screen_description,
//                   onToggle: (val) {
//                     debugPrint("Switch toggled: $val");
//                   },
//                   child: InfoTooltip(
//                     title: "Day End Control if all customer is check-in",
//                     description:
//                         appLocalizations.user_settings_screen_description,
//                     onToggle: (val) {
//                       debugPrint("Switch toggled: $val");
//                     },
//                     backgroundColor: ColorResources.transparent,
//                     padding: const EdgeInsets.only(top: 4),
//                   ),
//                 ),
//                 h4,
//                 InfoTooltip(
//                   title: "Day Start Image Capture:",
//                   description:
//                       appLocalizations.user_settings_screen_description,
//                   onToggle: (val) {
//                     debugPrint("Switch toggled: $val");
//                   },
//                   child: Column(
//                     children: [
//                       InfoTooltip(
//                         title: "Selfie:",
//                         description:
//                             appLocalizations.user_settings_screen_description,
//                         onToggle: (val) {
//                           debugPrint("Switch toggled: $val");
//                         },
//                         backgroundColor: ColorResources.transparent,
//                         padding: const EdgeInsets.only(top: 4),
//                       ),
//                       InfoTooltip(
//                         title: "Odo meter reading:",
//                         description:
//                             appLocalizations.user_settings_screen_description,
//                         onToggle: (val) {
//                           debugPrint("Switch toggled: $val");
//                         },
//                         backgroundColor: ColorResources.transparent,
//                         padding: const EdgeInsets.only(top: 8),
//                       ),
//                     ],
//                   ),
//                 ),
//                 h4,
//                 InfoTooltip(
//                   title: "PayQR in invoice Printout:",
//                   description:
//                       appLocalizations.user_settings_screen_description,
//                   onToggle: (val) {
//                     debugPrint("Switch toggled: $val");
//                   },
//                   ispremium: true,
//                 ),
//                 h60,
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Voucher Series Method",
//                       style: context.textStyle.s14.w500.dustyBlue,
//                     ),
//                   ],
//                 ),
//                 h20,
//                 CustomButton(
//                   buttonText: "Route Wise",
//                   isborderEnable: false,
//                   onTap: () {
//                     context.pushNamed(AppRouterConst.routeWiseScreen);
//                   },
//                 ),
//                 h26,
//                 CustomButton(
//                   buttonText: "Vehicle/Godown Wise",
//                   isborderEnable: false,
//                   onTap: () {
//                     context.pushNamed(AppRouterConst.godownWiseScreen);
//                   },
//                 ),
//                 h90,
//                 CustomButton(
//                   buttonText: "Complete Settings",
//                   isborderEnable: false,
//                   onTap: () {},
//                 ),
//                 h16,
//               ]),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/l10n/generated/app_localizations.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_settings/widgets/info_tool_tip.dart';

class CompanySettingsScreen extends StatefulWidget {
  // final int companyId;
  // final GetAllCompanyData? companyData;
  const CompanySettingsScreen({
    super.key,
    // required this.companyId,
    //   required this.companyData
  });
  @override
  _CompanySettingsScreenState createState() => _CompanySettingsScreenState();
}

class _CompanySettingsScreenState extends State<CompanySettingsScreen> {
  Map<int, bool> switchStates = {};
  @override
  void initState() {
    super.initState();
    // print("companyid in company settings ....${widget.companyId}");
    // print(
    //     "hasintegrationsettings company settings ....${widget.companyData!.hasVoucherTypeSettings}");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final fetchsettingsprovider = Provider.of<CompanyCreationProvider>(
        context,
        listen: false,
      );
      fetchsettingsprovider.getCompanySettings(context, 1336);
      // fetchsettingsprovider.fetchCompany(widget.companyId);
    });
  }

  @override
  Widget build(BuildContext context) {
    //final appLocalizations = context.l10n;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.transparent,
        foregroundColor: ColorResources.transparent,
        surfaceTintColor: ColorResources.transparent,
        centerTitle: true,
        title: Text(
          "Company Settings",
          style: context.textStyle.s24.indigoBlue.bold.roboto,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: ColorResources.indigoBlue,
            size: 15,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Consumer<CompanyCreationProvider>(
        builder: (context, companysettings, child) {
          if (companysettings.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (companysettings.comapanySettingsListData.isEmpty) {
            return Center(child: Text("No settings found"));
          }

          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(7),

                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: companysettings.comapanySettingsListData.length,
                    (context, index) {
                      final setting =
                          companysettings.comapanySettingsListData[index];
                      bool isChild = setting.parentId > 1;
                      final parentEnabled =
                          switchStates[setting.parentId] ?? true;

                      // Hide child if parent toggle is off
                      if (isChild && !parentEnabled) {
                        return const SizedBox.shrink();
                      }

                      final istoggle =
                          switchStates[setting.id] ??
                          (setting.settingsValue == "Yes");

                      final isfree =
                          setting.menuType.toString().trim().toLowerCase() !=
                          'menutype.free';

                      if (isChild &&
                          !(switchStates[setting.parentId - 1] ?? false)) {
                        return SizedBox.shrink();
                      }

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: InfoTooltip(
                          title: setting.settingsMenuName,
                          description: setting.description,
                          ispremium: isfree,
                          onToggle: (val) {
                            setState(() {
                              switchStates[index] = val;
                            });
                          },



                          

                          // child: Row(
                          //   children: [
                          //     Expanded(
                          //       child: Text(
                          //         setting.settingsMenuName,
                          //         style: Theme.of(
                          //           context,
                          //         ).textTheme.displayMedium,
                          //       ),
                          //     ),
                          //     // $ symbol
                          //     if (!isfree)
                          //       Container(
                          //         width:
                          //             MediaQuery.of(
                          //               context,
                          //             ).size.width *
                          //             0.052,
                          //         height:
                          //             MediaQuery.of(
                          //               context,
                          //             ).size.height *
                          //             0.021,
                          //         decoration: BoxDecoration(
                          //           shape: BoxShape.circle,
                          //           gradient: LinearGradient(
                          //             colors: [
                          //               Colors.orange,
                          //               Colors.yellow,
                          //             ],
                          //             begin: Alignment.topLeft,
                          //             end: Alignment.bottomRight,
                          //           ),
                          //         ),
                          //         child: Center(
                          //           child: Icon(
                          //             Icons.currency_rupee_outlined,
                          //             color: Colors.white,
                          //             size: 14,
                          //           ),
                          //         ),
                          //       ),
                          //toggle button
                          // Transform.scale(
                          //   scale: 0.7,
                          //   child: Switch(
                          //     inactiveThumbColor: Theme.of(
                          //       context,
                          //     ).colorScheme.secondary,
                          //     activeColor: Theme.of(
                          //       context,
                          //     ).colorScheme.onPrimary,
                          //     inactiveTrackColor: Theme.of(
                          //       context,
                          //     ).colorScheme.onPrimary,
                          //     activeTrackColor: Theme.of(
                          //       context,
                          //     ).colorScheme.primary,
                          //     value: istoggle,
                          //     onChanged: (value) async {
                          //       setState(() {
                          //         switchStates[setting.id] =
                          //             value;
                          //       });
                          // final toggleprovider =
                          //     Provider.of<
                          //       CreateCompanyProvider
                          //     >(context, listen: false);
                          // final newvalue = value
                          //     ? "Yes"
                          //     : "No";

                          // final check = await toggleprovider
                          //     .createcompanysettings(
                          //       CreateCompanysettingsRequest(
                          //         id: setting.id,
                          //         companyid:
                          //             widget.companyId,
                          //         settingsvalue: newvalue,
                          //       ),
                          //     );
                          // if (check!) {
                          //   CommonSnackBar.show(
                          //     context,
                          //     message:
                          //         toggleprovider
                          //             .serverMessage ??
                          //         "",
                          //   );
                          // } else {
                          //   CommonSnackBar.show(
                          //     context,
                          //     message:
                          //         toggleprovider
                          //             .serverMessage ??
                          //         "",
                          //   );
                          // }
                          //},
                          // ),
                          //  ),
                          // CustomTooltip(
                          //   message: setting.description,
                          //   child: Icon(
                          //     Icons.info_outline_rounded,
                          //     color: Theme.of(
                          //       context,
                          //     ).colorScheme.primary,
                          //   ),
                          // ),
                          //],
                          // ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
            // child: ListView.builder(
            //   itemCount:
            //       companysettings.comapanySettingsListData.length,
            //   itemBuilder: (context, index) {
            // if (index == 0) {
            //   return _buildTopContainer(
            //     local,
            //     companysettings.getcompany.isNotEmpty
            //         ? companysettings
            //               .getcompany[0]
            //               .hasVoucherTypeSettings
            //         : 0,
            //     companysettings.getcompany.isNotEmpty
            //         ? companysettings.getcompany[0].regType
            //         : 0,
            //   );
            // } else if (index <=
            //     companysettings.companySettingsList.length) {

            // } else {
            //   return _buildButtons(
            //     companysettings.getcompany.isNotEmpty
            //         ? companysettings
            //               .getcompany[0]
            //               .hasVoucherTypeSettings
            //         : 0,
            //   );
            // }
            // },
            // ),
          );
        },
      ),
    );
  }

  // Widget _buildTopContainer(
  //   AppLocalizations local,
  //   final voucher,
  //   final regtype,
  // ) {
  //   Color? buttonColor = voucher == null || voucher == 0
  //       ? Appcolor.primary
  //       : Appcolor.background;
  //   print('voucher inside _buildTopContainer:.. $voucher');
  //   print('regtype _buildTopContainer: $regtype');

  //   return Padding(
  //     padding: const EdgeInsets.all(4),
  //     child: Container(
  //       decoration: BoxDecoration(
  //         color: Color(0xFFFAFAFC),
  //         borderRadius: BorderRadius.circular(12),
  //       ),
  //       height: MediaQuery.of(context).size.height * 0.07,
  //       child: Padding(
  //         padding: const EdgeInsets.all(10),
  //         child: Row(
  //           children: [
  //             Text(
  //               local.company_settings_voucher_type_screen_subtitle,
  //               style: Theme.of(context).textTheme.displayMedium,
  //             ),
  //             Spacer(),
  //             ElevatedButton(
  //               style: ElevatedButton.styleFrom(
  //                 backgroundColor: buttonColor,
  //                 minimumSize: Size(
  //                   MediaQuery.of(context).size.width * 0.200,
  //                   MediaQuery.of(context).size.height * 0.038,
  //                 ),
  //               ),
  //               onPressed: () {
  //                 context.pushNamed(
  //                   "vouchertypesettings",
  //                   extra: {'companyId': widget.companyId, 'regType': regtype},
  //                 );
  //               },
  //               child: Row(
  //                 children: [
  //                   Text(
  //                     local.company_settings_screen_configure_button,
  //                     style: Theme.of(context).textTheme.labelSmall!.copyWith(
  //                       color: Theme.of(context).colorScheme.onPrimary,
  //                     ),
  //                   ),
  //                   Icon(
  //                     Icons.arrow_forward_ios_rounded,
  //                     size: 15,
  //                     color: Theme.of(context).colorScheme.onPrimary,
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildButtons(final voucher) {
  //   final local = AppLocalizations.of(context);
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 10.0),
  //     child: Column(
  //       children: [
  //         SizedBox(height: MediaQuery.of(context).size.height * 0.04),
  //         Text(
  //           local.company_settings_screen_voucher_series_method,
  //           style: Theme.of(
  //             context,
  //           ).textTheme.titleMedium!.copyWith(fontSize: 16),
  //         ),
  //         SizedBox(height: MediaQuery.of(context).size.height * 0.03),
  //         ElevatedButton(
  //           onPressed: () {
  //             context.pushNamed(
  //               "companyroutewissettings",
  //               queryParameters: {'companyId': widget.companyId.toString()},
  //             );
  //           },
  //           child: Text(local.company_settings_screen_elevated_button1),
  //         ),
  //         SizedBox(height: MediaQuery.of(context).size.height * 0.02),
  //         ElevatedButton(
  //           onPressed: () {
  //             context.pushNamed(
  //               "companyvehiclewissettings",
  //               queryParameters: {'companyId': widget.companyId.toString()},
  //             );
  //           },
  //           child: Text(local.company_settings_screen_elevated_button2),
  //         ),
  //         SizedBox(height: MediaQuery.of(context).size.height * 0.02),
  //         ElevatedButton(
  //           style: ElevatedButton.styleFrom(
  //             backgroundColor: voucher == 0
  //                 ? Theme.of(context).colorScheme.secondary
  //                 : null,
  //           ),
  //           onPressed: voucher == 0
  //               ? () {}
  //               : () async {
  //                   final completeSettings = Provider.of<CreateCompanyProvider>(
  //                     context,
  //                     listen: false,
  //                   );
  //                   final check = await completeSettings
  //                       .companySettingsComplete(widget.companyId);
  //                   if (check!) {
  //                     if (widget.companyData!.hasCompanySettings != 0) {
  //                       context.goNamed("managecompany");
  //                     } else {
  //                       context.goNamed("Dashboard");
  //                     }
  //                     CommonSnackBar.show(
  //                       context,
  //                       message: completeSettings.serverMessage ?? '',
  //                     );
  //                   }
  //                 },
  //           child: Text("Complete"),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
