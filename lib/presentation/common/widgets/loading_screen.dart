import 'package:mpos_beat/core/utils/imports.dart';

class LoadingScreen extends StatelessWidget {
  final VoidCallback onCompleted;
  static const routeName = "loading-screen";
  const LoadingScreen({super.key, required this.onCompleted});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      onCompleted();
    });
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ColorFiltered(
                colorFilter: const ColorFilter.mode(
                    ColorResources.indigoBlue, BlendMode.srcIn),
                child: Lottie.asset(
                  AppAssets.loading_anim,
                ),
              ),
              gap28,
              Text(
                "Please Wait!",
                style: context.textStyle.s22.indigoBlue.bold,
              ),
              gap10,
              Text(
                "Registration is under processing.",
                style: context.textStyle.s10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
