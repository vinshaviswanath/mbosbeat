import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/l10n/generated/app_localizations.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_settings/widgets/info_tool_tip.dart';

class CompanySettingsScreen extends StatefulWidget {
  final int? companyId;
  // final GetAllCompanyData? companyData;
  const CompanySettingsScreen({
    super.key,
    this.companyId,
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
      //fetchsettingsprovider.getCompanySettings(context, 1336);
      fetchsettingsprovider.getCompanySettings(context, widget.companyId!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.transparent,
        foregroundColor: ColorResources.transparent,
        surfaceTintColor: ColorResources.transparent,
        centerTitle: true,
        title: Text(
          appLocalizations.company_settings_screen_title,
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

          final allSettings = companysettings.comapanySettingsListData;

          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(7),

                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: companysettings.comapanySettingsListData.length,
                    (context, index) {
                      final setting = allSettings[index];

                      bool isChild = setting.parentId > 1;

                      // get current toggle state
                      final bool isOn =
                          switchStates[setting.id] ??
                          (setting.settingsValue == "Yes");

                      final bool isFree =
                          setting.menuType.toString().trim().toLowerCase() !=
                          'menutype.free';

                      // parent toggle check
                      final bool parentEnabled =
                          switchStates[setting.parentId] ?? false;

                      // if child and parent is OFF, hide it
                      if (isChild && !parentEnabled) {
                        return const SizedBox.shrink();
                      }

                      return Padding(
                        padding: EdgeInsets.only(
                          left: isChild ? 20 : 0,
                          top: 4,
                          bottom: 4,
                        ),
                        child: InfoTooltip(
                          title: setting.settingsMenuName,
                          description: setting.description,
                          ispremium: isFree,
                          initialValue: isOn,
                          onToggle: (val) {
                            setState(() {
                              switchStates[setting.id] = val;

                              // if this is a parent turning OFF, also hide its children
                              if (!val) {
                                for (var child in allSettings.where(
                                  (c) => c.parentId == setting.id,
                                )) {
                                  switchStates[child.id] = false;
                                }
                              }
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
          );
        },
      ),
    );
  }
}
