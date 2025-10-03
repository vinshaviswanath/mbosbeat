import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/logic/user_management_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const routeName = "splash-screen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserManagementProvider>().loadDesignations();
    context.read<UserManagementProvider>().loadUsers();

    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        final prefs = sl<SharedPreferences>();
        final token = prefs.getString("token") ?? '';
        final isOnboardingCompleted =
            prefs.getBool("isOnboardingCompleted") ?? false;
        if (isOnboardingCompleted == true) {
          context.pushNamed(AppRouterConst.homeScreen);
          if (token.isEmpty) {
            context.pushNamed(AppRouterConst.salesReturnScreen);
          } else {
            context.pushNamed(AppRouterConst.adminHome);
          }
        } else {
          context.pushNamed(AppRouterConst.onboardScreen);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: context.getSize.height * 0.1,
            left: -context.getSize.width * 0.35,
            child: Image.asset(
              AppAssets.bgVector,
              height: context.getSize.height * 0.3,
            ),
          ),
          Positioned(
            bottom: -context.getSize.height * 0.08,
            right: -context.getSize.width * 0.35,
            child: Image.asset(
              AppAssets.bgVector,
              height: context.getSize.height * 0.3,
            ),
          ),
          CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: Center(
                  child: Image.asset(
                    AppAssets.logo,
                    height: context.getSize.height * 0.14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
