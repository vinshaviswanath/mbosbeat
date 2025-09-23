import 'package:pinput/pinput.dart';
import 'package:mpos_beat/core/utils/imports.dart';

class OtpInputField extends StatelessWidget {
  final void Function(String)? onCompleted;
  final Color borderColor;

  const OtpInputField({super.key, this.onCompleted, required this.borderColor});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        color: ColorResources.indigoBlue,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: ColorResources.bluishGray.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
      ),
    );

    return Pinput(
      length: 4,
      errorPinTheme: PinTheme(
          decoration: BoxDecoration(border: Border.all(color: Colors.red))),
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          border: Border.all(color: borderColor, width: 1.5),
        ),
      ),
      submittedPinTheme: defaultPinTheme,
      onCompleted: onCompleted,
    );
  }
}
