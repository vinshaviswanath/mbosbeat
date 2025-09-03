import 'package:go_router/go_router.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/route/app_router_const.dart';

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
    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        // AppRoute.pushNamed(OnBoardingScreen.routeName);
        context.pushNamed( AppRouterConst.onboardScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: context.getSize.height * 0.08,
              left: -context.getSize.width * 0.35,
              child: Image.asset(AppAssets.bgVector)),
          Positioned(
              bottom: -context.getSize.height * 0.08,
              right: -context.getSize.width * 0.35,
              child: Image.asset(AppAssets.bgVector)),
          CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: Center(
                  child: Image.asset(AppAssets.logo),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
