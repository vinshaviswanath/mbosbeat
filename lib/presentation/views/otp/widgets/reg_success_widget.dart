import 'package:ripple_wave/ripple_wave.dart';
import 'package:mpos_beat/core/utils/imports.dart';

class RegisterSuccessWidget extends StatelessWidget {
  const RegisterSuccessWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(32),
          child: RippleWave(
            color: ColorResources.amber,
            repeat: true,
            child: CircleAvatar(
              radius: 60,
              backgroundColor: ColorResources.amber,
              child: Icon(
                Icons.check,
                size: 80,
                color: ColorResources.white,
              ),
            ),
          ),
        ),
        const Spacer(),
        Text(
          "Registration\nSuccessfully!",
          textAlign: TextAlign.center,
          style: context.textStyle.s22.indigoBlue.bold,
        ),
        gap8,
        Text(
          "You are successfully registered as Admin User",
          textAlign: TextAlign.center,
          style: context.textStyle.s10,
        ),
      ],
    );
  }
}
