import 'package:avatar_glow/avatar_glow.dart';
import 'package:mpos_beat/core/utils/imports.dart';

class RegisterSuccessWidget extends StatelessWidget {
  const RegisterSuccessWidget({super.key});

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
            glowColor: ColorResources.amber,
            glowShape: BoxShape.circle,
            glowRadiusFactor: 0.3,
            animate: true,
            repeat: true,
            child: SvgPicture.asset(AppAssets.tick, height: 144),
          ),
        ),
        const Spacer(),
        Text(
          appLocalization.reg_success_widget_reg_success,
          textAlign: TextAlign.center,
          style: context.textStyle.s22.indigoBlue.bold,
        ),
        h8,
        Text(
          appLocalization.reg_success_widget_successfully_registered_admin,
          textAlign: TextAlign.center,
          style: context.textStyle.s12.silverGray,
        ),
        h12,
      ],
    );
  }
}
