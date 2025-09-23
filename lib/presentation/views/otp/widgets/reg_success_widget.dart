import 'package:ripple_wave/ripple_wave.dart';
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
          padding: EdgeInsets.all(32),
          child: RippleWave(
            color: ColorResources.amber,
            repeat: true,
            child: SvgPicture.asset(AppAssets.tick, height: 144),
          ),
        ),
        const Spacer(),
        Text(
          appLocalization.reg_success,
          textAlign: TextAlign.center,
          style: context.textStyle.s22.indigoBlue.bold,
        ),
        gap8,
        Text(
          appLocalization.successfully_registered_admin,
          textAlign: TextAlign.center,
          style: context.textStyle.s12.silverGray,
        ),
        gap12,
      ],
    );
  }
}
