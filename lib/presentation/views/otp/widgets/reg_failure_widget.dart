import 'package:go_router/go_router.dart';
import 'package:mpos_beat/route/app_router_const.dart';
import 'package:ripple_wave/ripple_wave.dart';
import 'package:mpos_beat/core/utils/imports.dart';

class RegisterFailureWidget extends StatelessWidget {
  const RegisterFailureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalization = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(32),
          child: RippleWave(
            color: ColorResources.errorRed,
            repeat: true,
            child: CircleAvatar(
              radius: 60,
              backgroundColor: ColorResources.errorRed,
              child: Text("!", style: context.textStyle.s22.white.bold),
            ),
          ),
        ),
        const Spacer(),
        Text(
          appLocalization.reg_failed,
          textAlign: TextAlign.center,
          style: context.textStyle.s22.indigoBlue.bold,
        ),
        gap8,
        InkWell(
          onTap: () {
            // AppRoute.pushNamed(LoginScreen.routeName);
            context.pushNamed(AppRouterConst.login);
          },
          child: Text(
            appLocalization.try_again,
            textAlign: TextAlign.center,
            style: context.textStyle.s10,
          ),
        ),
      ],
    );
  }
}
