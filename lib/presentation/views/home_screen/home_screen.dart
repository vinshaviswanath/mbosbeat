// ignore_for_file: use_build_context_synchronously

import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/presentation/dialogs/auth_dialogs.dart';
import 'package:mpos_beat/presentation/logic/user_provider.dart';
import 'package:mpos_beat/presentation/views/home_screen/controller/home_init_controller.dart';
import 'package:mpos_beat/presentation/views/home_screen/widgets/home_content.dart';
import 'package:mpos_beat/presentation/views/home_screen/widgets/home_appBar.dart';
import 'package:mpos_beat/presentation/views/home_screen/widgets/home_loading_overlay.dart';
import 'package:mpos_beat/presentation/views/home_screen/widgets/home_shimmer.dart';

class HomeScreen extends StatefulWidget {
  final Company company;
  const HomeScreen({super.key, required this.company});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeInitController _controller;

  @override
  void initState() {
    super.initState();
    _controller = sl<HomeInitController>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.initialize(context, widget.company);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appDb = sl<AppDb>();

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) async {
        final userId = await appDb.registrationDetailDao.getLoggedInUserId();

        final value = await appDb.userSettingsDao.getCompanySwitchingValue(
          userId ?? 0,
        );

        if (value == "Yes") {
          Navigator.of(context).pop();
        } else {
          final shouldExit = await AuthDialogs.show(context);
          if (shouldExit) AuthDialogs.exitApp();
        }
      },
      child: Scaffold(
        appBar: const HomeAppBar(),
        body: Selector<UserProvider, bool>(
          selector: (_, p) => p.isLoading,
          builder: (_, isLoading, __) {
            if (isLoading) {
              return const HomeScreenShimmer();
            }
            return const HomeContent();
          },
        ),
      ),
    );
  }
}
