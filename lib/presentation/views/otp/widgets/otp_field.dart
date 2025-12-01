import 'package:mpos_beat/presentation/logic/authentication_provider.dart';
import 'package:pinput/pinput.dart';
import 'package:mpos_beat/core/utils/imports.dart';

class OtpInputField extends StatelessWidget {
  final void Function(String)? onCompleted;
  final Color borderColor;
  final TextEditingController? controller;
  final PinTheme? errorPinTheme;

  const OtpInputField({
    super.key,
    this.onCompleted,
    required this.borderColor,
    this.controller,
    this.errorPinTheme,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AuthFormProvider>();
    final hasError =
        provider.showOtpValidation &&
        (provider.otpResponse?.status == 0 || !provider.otp.isValid());

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        color: ColorResources.indigoBlue,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: hasError ? ColorResources.errorRed : ColorResources.indigoBlue,
          width: hasError ? 1.5 : 0,
        ),
        color: ColorResources.bluishGray.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
      ),
    );

    return Pinput(
      controller: controller,
      length: 4,
      defaultPinTheme: defaultPinTheme,
      // focusedPinTheme: defaultPinTheme.copyWith(
      //   decoration: defaultPinTheme.decoration!.copyWith(
      //     border: Border.all(color: borderColor, width: 1.5),
      //   ),
      // ),
      submittedPinTheme: defaultPinTheme,
      errorText: provider.otpError ?? provider.otp.getFailure?.errorMsg,
      onCompleted: onCompleted,
    );
  }
}
