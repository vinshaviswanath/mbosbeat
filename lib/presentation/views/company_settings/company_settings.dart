import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/data/get_all_company_settings_data.dart';

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
          builder: (context, provider, _) {
            final appLocalizations = context.l10n;

            // STREAM DATA
            final settings = context.watch<List<CompanySettingsListData>>();

            if (provider.isLoading && settings.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            if (settings.isEmpty) {
              return const Center(child: Text("No settings found"));
            }

            return CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.all(7),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: settings.length,
                      (context, index) {
                        final setting = settings[index];
                        // child check
                        final bool isChild = setting.parentId > 1;
                        // parent enabled check
                        final bool parentEnabled =
                            settings
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
                            ispremium:
                                setting.menuType.toString().toLowerCase() !=
                                "menutype.free",
                            initialValue: setting.settingsValue == "Yes",
                            onToggle: (val) {
                              provider.updateParentAndChildren(
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
                SliverToBoxAdapter(child: SizedBox(height: 50)),
              ],
            );
          },
        ),
      ),
    );
  }
}
