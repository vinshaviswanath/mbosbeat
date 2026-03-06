import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/presentation/logic/user_provider.dart';
import 'package:mpos_beat/presentation/views/home_screen/home_screen.dart';
import 'package:mpos_beat/presentation/views/home_screen/transactions_container.dart';
import 'package:mpos_beat/presentation/views/home_screen/widgets/header/home_header.dart';
import 'package:mpos_beat/presentation/views/home_screen/widgets/home_shimmer.dart';
import 'package:mpos_beat/presentation/views/home_screen/widgets/trip_summary/trip_summary_section.dart';
import 'package:mpos_beat/presentation/views/home_screen/widgets/tripstart_shimmer.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final appDb = sl<AppDb>();
    final company =
        (context.findAncestorWidgetOfExactType<HomeScreen>())!.company;

    return StreamBuilder<RegistrationDetail?>(
      stream: appDb.registrationDetailDao.watchLoggedInUser(),
      builder: (_, snap) {
        final user = snap.data;
        if (user == null) return const SizedBox();

        return SingleChildScrollView(
          child: Column(
            children: [
              HeaderContainer(company: company, user: user),
              const SizedBox(height: 20),
              Consumer<UserProvider>(
                builder: (context, provider, child) {
                  if (provider.isTripStarting || provider.isTripending) {
                    return const TripStartShimmer();
                  }

                  return child!;
                },

                child: Column(
                  children: [
                    const TripSummarySection(),
                    const SizedBox(height: 20),
                    TransactionsContainers(userDetails: user, company: company),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        );
      },
    );
  }
}

class HeaderContainer extends StatelessWidget {
  final Company company;
  final RegistrationDetail user;

  const HeaderContainer({super.key, required this.company, required this.user});

  @override
  Widget build(BuildContext context) {
    final appDb = sl<AppDb>();

    return StreamBuilder<CompanySettingsTableData?>(
      stream: appDb.companySettingsDao.watchRouteSetting(company.id ?? 0),
      builder: (_, snap) {
        return HomeHeader(
          company: company,
          user: user,
          companySettings: snap.data,
        );
      },
    );
  }
}
