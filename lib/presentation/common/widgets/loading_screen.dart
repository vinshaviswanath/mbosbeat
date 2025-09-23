import 'package:mpos_beat/core/utils/imports.dart';

class LoadingScreen extends StatelessWidget {
  static const routeName = "loading-screen";
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalization = context.l10n;
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ColorFiltered(
                colorFilter: const ColorFilter.mode(
                  ColorResources.indigoBlue,
                  BlendMode.srcIn,
                ),
                child: Lottie.asset(AppAssets.loading_anim),
              ),
              gap28,
              Text(
                appLocalization.please_wait,
                style: context.textStyle.s22.indigoBlue.bold,
              ),
              gap10,
              Text(
                appLocalization.reg_is_under_processing,
                style: context.textStyle.s10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
