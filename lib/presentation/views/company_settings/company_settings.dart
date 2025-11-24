import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/data/get_all_company_settings_data.dart';
import 'package:mpos_beat/domain/request/create_company_settings_request.dart';
import 'package:mpos_beat/l10n/generated/app_localizations.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_settings/tooltip_overlay_manager.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_settings/widgets/info_tool_tip.dart';

class CompanySettingsScreen extends StatefulWidget {
  final int? companyId;
  const CompanySettingsScreen({super.key, this.companyId});
  @override
  _CompanySettingsScreenState createState() => _CompanySettingsScreenState();
}

class _CompanySettingsScreenState extends State<CompanySettingsScreen> {
  Map<int, bool> switchStates = {};
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final fetchsettingsprovider = Provider.of<CompanyCreationProvider>(
        context,
        listen: false,
      );
      fetchsettingsprovider.getCompanySettings(context, widget.companyId!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;
    return WillPopScope(
      onWillPop: () async {
        TooltipOverlayManager().hideCurrent();
        return true;
      },

      child: Scaffold(
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
                      childCount:
                          companysettings.comapanySettingsListData.length,
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
                            allSettings
                                .firstWhere(
                                  (e) => e.id == setting.parentId,
                                  orElse: () => CompanySettingsListData(
                                    parentId: 0,
                                    settingsValue: "No",
                                    id: 0,
                                    companyId: 0,
                                    settingsMenuName: '',
                                    buttonType: ButtonType.TOGGLE,
                                    description: '',
                                    orderNo: 0,
                                    menuType: MenuType.FREE,
                                  ),
                                )
                                .settingsValue ==
                            "Yes";

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
                            onToggle: (val) async {
                              companysettings.updateParentAndChildren(
                                context,
                                setting.id,
                                val,
                                widget.companyId!,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
                // Extra bottom space so last tooltip is fully visible
                SliverToBoxAdapter(
                  child: SizedBox(height: 50), // adjust height as needed
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
