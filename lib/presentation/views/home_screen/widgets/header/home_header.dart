import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/presentation/logic/user_provider.dart';
import 'package:mpos_beat/presentation/views/home_screen/widgets/header/company_switch_tile.dart';
import 'package:mpos_beat/presentation/views/home_screen/widgets/header/header_info.dart';
import 'package:mpos_beat/presentation/views/home_screen/widgets/header/header_state.dart';

class HomeHeader extends StatelessWidget {
  final Company company;
  final RegistrationDetail user;
  final CompanySettingsTableData? companySettings;

  const HomeHeader({
    super.key,
    required this.company,
    required this.user,
    required this.companySettings,
  });

  @override
  Widget build(BuildContext context) {
    final appDb = sl<AppDb>();
    final today =
        "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}";

    return StreamBuilder<List<UserSettingsTableData>>(
      stream: appDb.userSettingsDao.watchSettings(user.userId),
      builder: (_, snap) {
        if (!snap.hasData) return const SizedBox();

        final isCompanySwitchEnabled =
            snap.data!
                .firstWhere(
                  (e) => e.id == 6,
                  orElse: () => UserSettingsTableData(value: "No"),
                )
                .value ==
            "Yes";

        return Selector<UserProvider, HeaderState>(
          selector: (_, p) => HeaderState(
            dayStarted: p.isAttendanceMarked,
            routeStarted: p.routeStarted,
            routeName: p.routeName,
          ),
          builder: (_, state, __) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  h16,
                  if (isCompanySwitchEnabled)
                    CompanySwitchTile(company: company),
                  HeaderInfo(
                    company: company,
                    user: user,
                    today: today,
                    state: state,
                    companySettings: companySettings,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
