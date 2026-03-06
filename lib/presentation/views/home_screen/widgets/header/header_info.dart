import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/presentation/logic/user_provider.dart';
import 'package:mpos_beat/presentation/views/home_screen/widgets/header/day_toggle_button.dart';
import 'package:mpos_beat/presentation/views/home_screen/widgets/header/header_state.dart';
import 'package:mpos_beat/presentation/views/home_screen/widgets/header/route_toggle_button.dart';
import 'package:mpos_beat/presentation/views/home_screen/widgets/home_shimmer.dart';

class HeaderInfo extends StatelessWidget {
  final Company company;
  final RegistrationDetail user;
  final String today;
  final HeaderState state;
  final CompanySettingsTableData? companySettings;

  const HeaderInfo({
    super.key,
    required this.company,
    required this.user,
    required this.today,
    required this.state,
    required this.companySettings,
  });

  @override
  Widget build(BuildContext context) {
    final addressParts = [company.address1, company.address2, company.address3];

    final addressText = addressParts
        .where((e) => e != null && e.trim().isNotEmpty)
        .join(", ");

    return Consumer<UserProvider>(
      builder: (context, provider, child) {
        if (provider.isTripStarting) {
          return const HomeScreenShimmer();
        }
        return child!;
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// LEFT
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // h8,
              Row(
                children: [
                  const Icon(
                    Icons.person_2,
                    size: 15,
                    color: ColorResources.dustyBlue,
                  ),
                  Text(
                    user.designation ?? '',
                    style: context.textStyle.s10.dustyBlue.roboto,
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.pin_drop_rounded,
                    size: 15,
                    color: ColorResources.dustyBlue,
                  ),
                  Text(
                    addressText,
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
              // const SizedBox(height: 12),
              if (companySettings?.settingsValue == "Yes" &&
                  state.routeStarted &&
                  state.routeName != null)
                Text(
                  "Beat: ${state.routeName}",
                  style: context.textStyle.s10.dustyBlue.roboto,
                ),

              h8,

              /// DAY
              if (companySettings?.settingsValue == "Yes") ...[
                Row(
                  children: [
                    Text(
                      "Day : ",
                      style: context.textStyle.s10.dustyBlue.roboto,
                    ),
                    Text(today, style: context.textStyle.s10.dustyBlue.roboto),
                    const SizedBox(width: 5),
                    CircleAvatar(
                      radius: 6,
                      backgroundColor: state.dayStarted
                          ? ColorResources.mintGreen
                          : ColorResources.bluishGray,
                    ),
                    const SizedBox(width: 5),
                    DayToggleButton(started: state.dayStarted),
                  ],
                ),
              ],

              /// ROUTE
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Route : ",
                    style: context.textStyle.s10.dustyBlue.roboto,
                  ),
                  Text(
                    !state.routeStarted ? "Start  " : "End ",
                    style: context.textStyle.s10.dustyBlue.roboto,
                  ),
                  CircleAvatar(
                    radius: 6,
                    backgroundColor: state.routeStarted
                        ? ColorResources.mintGreen
                        : ColorResources.bluishGray,
                  ),
                  const SizedBox(width: 5),
                  RouteToggleButton(
                    started: state.routeStarted,
                    companyId: company.id ?? 0,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
