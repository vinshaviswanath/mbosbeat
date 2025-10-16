import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_settings/widgets/info_tool_tip.dart';

class CompanySettingsScreen extends StatelessWidget {
  const CompanySettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.transparent,
        foregroundColor: ColorResources.transparent,
        surfaceTintColor: ColorResources.transparent,
        leading: IconButton(
          onPressed: () {
            FocusScope.of(context).requestFocus(FocusNode());
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: ColorResources.indigoBlue,
          ),
        ),
        title: Text(
          "Company Settings",
          style: context.textStyle.s20.indigoBlue.bold.roboto,
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.sizeOf(context).width, 15),
          child: Container(color: Colors.transparent),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                InfoTooltip(
                  title: "Free Quantity",
                  description:
                      appLocalizations.user_settings_screen_description,
                  onToggle: (val) {
                    debugPrint("Switch toggled: $val");
                  },
                ),
                h4,
                InfoTooltip(
                  title: "Enable bill wise report (Stand Alone)",
                  description:
                      appLocalizations.user_settings_screen_description,
                  onToggle: (val) {
                    debugPrint("Switch toggled: $val");
                  },
                ),
                h4,
                InfoTooltip(
                  title: "Bill wise Receipt",
                  description:
                      appLocalizations.user_settings_screen_description,
                  onToggle: (val) {
                    debugPrint("Switch toggled: $val");
                  },
                ),
                h4,
                InfoTooltip(
                  title: "Auto Receipt",
                  description:
                      appLocalizations.user_settings_screen_description,
                  ispremium: true,
                  onToggle: (val) {
                    debugPrint("Switch toggled: $val");
                  },
                ),
                h4,
                InfoTooltip(
                  title: "Day Start -End (Attendance)",
                  description:
                      appLocalizations.user_settings_screen_description,
                  onToggle: (val) {
                    debugPrint("Switch toggled: $val");
                  },
                ),
                h4,
                InfoTooltip(
                  title: "Sales Price (Party wise Single Price list)",
                  description:
                      appLocalizations.user_settings_screen_description,
                  onToggle: (val) {
                    debugPrint("Switch toggled: $val");
                  },
                ),
                h4,
                InfoTooltip(
                  title: appLocalizations.user_settings_screen_edit_transaction,
                  description:
                      appLocalizations.user_settings_screen_description,
                  onToggle: (val) {
                    debugPrint("Switch toggled: $val");
                  },
                ),
                h4,
                InfoTooltip(
                  title: "Inclusive Tax",
                  description:
                      appLocalizations.user_settings_screen_description,
                  onToggle: (val) {
                    debugPrint("Switch toggled: $val");
                  },
                ),
                h4,
                InfoTooltip(
                  title: "Item wise Discount %",
                  description:
                      appLocalizations.user_settings_screen_description,
                  ispremium: true,
                  onToggle: (val) {
                    debugPrint("Switch toggled: $val");
                  },
                ),
                h4,
                InfoTooltip(
                  title: "Ledger Discount",
                  description:
                      appLocalizations.user_settings_screen_description,
                  onToggle: (val) {
                    debugPrint("Switch toggled: $val");
                  },
                ),

                h4,
                InfoTooltip(
                  title: "Defaut cash Sales",
                  description:
                      appLocalizations.user_settings_screen_description,
                  onToggle: (val) {
                    debugPrint("Switch toggled: $val");
                  },
                ),
                h4,
                InfoTooltip(
                  title: appLocalizations.user_settings_screen_party_creation,
                  description:
                      appLocalizations.user_settings_screen_description,
                  onToggle: (val) {
                    debugPrint("Switch toggled: $val");
                  },
                ),
                h4,
                InfoTooltip(
                  title: "Alternative Units",
                  description:
                      appLocalizations.user_settings_screen_description,
                  onToggle: (val) {
                    debugPrint("Switch toggled: $val");
                  },
                ),
                h4,
                InfoTooltip(
                  title:
                      appLocalizations.user_settings_screen_change_voucher_date,
                  description:
                      appLocalizations.user_settings_screen_description,
                  onToggle: (val) {
                    debugPrint("Switch toggled: $val");
                  },
                ),
                h4,
                InfoTooltip(
                  title: "Enable Excise",
                  description:
                      appLocalizations.user_settings_screen_description,
                  ispremium: true,
                  onToggle: (val) {
                    debugPrint("Switch toggled: $val");
                  },
                ),
                h4,
                InfoTooltip(
                  title: "Additional Discount Applicable:",
                  description:
                      appLocalizations.user_settings_screen_description,
                  onToggle: (val) {
                    debugPrint("Switch toggled: $val");
                  },
                ),
                h4,
                InfoTooltip(
                  title: "Net Rate Editing for Sales/Sales Return",
                  description:
                      appLocalizations.user_settings_screen_description,
                  onToggle: (val) {
                    debugPrint("Switch toggled: $val");
                  },
                ),
                h4,
                InfoTooltip(
                  title: "Remove Skip Customer Option",
                  description:
                      appLocalizations.user_settings_screen_description,
                  onToggle: (val) {
                    debugPrint("Switch toggled: $val");
                  },
                  ispremium: true,
                ),
                h4,
                InfoTooltip(
                  title: "Is Check In/Out Control:",
                  style: context.textStyle.s12.bold.bluishGray.roboto,
                  description:
                      appLocalizations.user_settings_screen_description,
                  onToggle: (val) {
                    debugPrint("Switch toggled: $val");
                  },
                  child: InfoTooltip(
                    title: "Day End Control if all customer is check-in",
                    description:
                        appLocalizations.user_settings_screen_description,
                    onToggle: (val) {
                      debugPrint("Switch toggled: $val");
                    },
                    backgroundColor: ColorResources.transparent,
                    padding: const EdgeInsets.only(top: 4),
                  ),
                ),
                h4,
                InfoTooltip(
                  title: "Day Start Image Capture:",
                  description:
                      appLocalizations.user_settings_screen_description,
                  onToggle: (val) {
                    debugPrint("Switch toggled: $val");
                  },
                  child: Column(
                    children: [
                      InfoTooltip(
                        title: "Selfie:",
                        description:
                            appLocalizations.user_settings_screen_description,
                        onToggle: (val) {
                          debugPrint("Switch toggled: $val");
                        },
                        backgroundColor: ColorResources.transparent,
                        padding: const EdgeInsets.only(top: 4),
                      ),
                      InfoTooltip(
                        title: "Odo meter reading:",
                        description:
                            appLocalizations.user_settings_screen_description,
                        onToggle: (val) {
                          debugPrint("Switch toggled: $val");
                        },
                        backgroundColor: ColorResources.transparent,
                        padding: const EdgeInsets.only(top: 8),
                      ),
                    ],
                  ),
                ),
                h4,
                InfoTooltip(
                  title: "PayQR in invoice Printout:",
                  description:
                      appLocalizations.user_settings_screen_description,
                  onToggle: (val) {
                    debugPrint("Switch toggled: $val");
                  },
                  ispremium: true,
                ),
                h60,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Voucher Series Method",
                      style: context.textStyle.s14.w500.dustyBlue,
                    ),
                  ],
                ),
                h20,
                CustomButton(
                  buttonText: "Route Wise",
                  isborderEnable: false,
                  onTap: () {
                    context.pushNamed(AppRouterConst.routeWiseScreen);
                  },
                ),
                h26,
                CustomButton(
                  buttonText: "Vehicle/Godown Wise",
                  isborderEnable: false,
                  onTap: () {
                    context.pushNamed(AppRouterConst.godownWiseScreen);
                  },
                ),
                h90,
                CustomButton(
                  buttonText: "Complete Settings",
                  isborderEnable: false,
                  onTap: () {},
                ),
                h16,
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
