import 'package:avatar_glow/avatar_glow.dart';
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
          child: AvatarGlow(
            glowColor: ColorResources.errorRed,
            glowShape: BoxShape.circle,
            animate: true,
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
          appLocalization.reg_failure_widget_reg_failed,
          textAlign: TextAlign.center,
          style: context.textStyle.s22.indigoBlue.bold,
        ),
        h8,
        InkWell(
          onTap: () {
            // AppRoute.pushNamed(LoginScreen.routeName);
            context.pushNamed(AppRouterConst.login);
          },
          child: Text(
            appLocalization.reg_failure_widget_try_again,
            textAlign: TextAlign.center,
            style: context.textStyle.s10,
          ),
        ),
      ],
    );
  }
}
