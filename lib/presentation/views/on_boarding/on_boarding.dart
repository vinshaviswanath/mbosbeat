import 'package:go_router/go_router.dart';
import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/route/app_router_const.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  static const routeName = "on_boarding-screen";

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();

    _controller.addListener(() {
      final page = _controller.page?.round() ?? 0;
      if (page != _currentIndex) {
        setState(() {
          _currentIndex = page;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> _slides = [
      {
        "image": AppAssets.ob1,
        "title": context.l10n.onboard_heading1,
        "subtitle": context.l10n.onboard_description,
      },
      {
        "image": AppAssets.ob2,
        "title": context.l10n.onboard_heading2,
        "subtitle": context.l10n.onboard_description,
      },
      {
        "image": AppAssets.ob3,
        "title": context.l10n.onboard_heading2,
        "subtitle": context.l10n.onboard_description,
      },
    ];
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: _slides.length,
              itemBuilder: (context, index) {
                final slide = _slides[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(slide["image"]),
                      gap40,
                      Text(
                        slide["title"],
                        style: context.textStyle.s24.indigoBlue.bold,
                        textAlign: TextAlign.center,
                      ),
                      gap16,
                      SizedBox(
                        width: context.getSize.width / 1.4,
                        height: context.getSize.height * 0.1,
                        child: Text(
                          slide["subtitle"],
                          style: context.textStyle
                              .copyWith(fontSize: 14)
                              .bluishGray,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      gap16,
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: SmoothPageIndicator(
              controller: _controller,
              count: _slides.length,
              effect: const ExpandingDotsEffect(
                activeDotColor: ColorResources.indigoBlue,
                dotColor: ColorResources.amber,
                dotHeight: 10,
                dotWidth: 10,
                spacing: 8,
              ),
            ),
          ),
          gap20,
          InkWell(
            onTap: () {
              // AppRoute.pushNamed(LoginScreen.routeName);
              final prefs = sl<SharedPreferences>();
              prefs.setBool("isOnboardingCompleted", true);
              context.pushNamed(AppRouterConst.login);
            },
            child: Text(
              _currentIndex == _slides.length - 1
                  ? context.l10n.get_started
                  : context.l10n.skip,
              style: context.textStyle.s12.indigoBlue.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: context.textStyle.indigoBlue.color,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          gap48,
        ],
      ),
    );
  }
}
