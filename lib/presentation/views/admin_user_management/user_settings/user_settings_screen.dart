import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_settings/widgets/info_tool_tip.dart';

class UserSettingsScreen extends StatelessWidget {
  const UserSettingsScreen({super.key});

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
          appLocalizations.user_settings_screen_user_settings,
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
                  title: appLocalizations.user_settings_screen_sales,
                  description:
                      appLocalizations.user_settings_screen_description,
                  onToggle: (val) {
                    debugPrint("Switch toggled: $val");
                  },
                ),
                h4,
                InfoTooltip(
                  title: appLocalizations.user_settings_screen_sales_return,
                  description:
                      appLocalizations.user_settings_screen_description,
                  onToggle: (val) {
                    debugPrint("Switch toggled: $val");
                  },
                ),
                h4,
                InfoTooltip(
                  title: appLocalizations.user_settings_screen_payment,
                  description:
                      appLocalizations.user_settings_screen_description,
                  onToggle: (val) {
                    debugPrint("Switch toggled: $val");
                  },
                ),
                h4,
                InfoTooltip(
                  title: appLocalizations.user_settings_screen_edit_rate,
                  description:
                      appLocalizations.user_settings_screen_description,
                  onToggle: (val) {
                    debugPrint("Switch toggled: $val");
                  },
                ),
                h4,
                InfoTooltip(
                  title: appLocalizations
                      .user_settings_screen_block_zero_rate_item,
                  description:
                      appLocalizations.user_settings_screen_description,
                  onToggle: (val) {
                    debugPrint("Switch toggled: $val");
                  },
                ),
                h4,
                InfoTooltip(
                  title:
                      appLocalizations.user_settings_screen_company_switching,
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
                  title: appLocalizations.user_settings_screen_sales_order,
                  description:
                      appLocalizations.user_settings_screen_description,
                  onToggle: (val) {
                    debugPrint("Switch toggled: $val");
                  },
                ),
                h4,
                InfoTooltip(
                  title: appLocalizations.user_settings_screen_receipt,
                  description:
                      appLocalizations.user_settings_screen_description,
                  onToggle: (val) {
                    debugPrint("Switch toggled: $val");
                  },
                ),
                h4,
                InfoTooltip(
                  title: appLocalizations.user_settings_screen_stock_transfer,
                  description:
                      appLocalizations.user_settings_screen_description,
                  onToggle: (val) {
                    debugPrint("Switch toggled: $val");
                  },
                ),

                h4,
                InfoTooltip(
                  title: appLocalizations.user_settings_screen_edit_discount,
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
                  title:
                      appLocalizations.user_settings_screen_change_price_list,
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
                  title:
                      appLocalizations.user_settings_screen_edit_party_details,
                  description:
                      appLocalizations.user_settings_screen_description,
                  onToggle: (val) {
                    debugPrint("Switch toggled: $val");
                  },
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
