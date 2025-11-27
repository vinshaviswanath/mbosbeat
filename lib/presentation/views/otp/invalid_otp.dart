
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/animations/wheel_spinner.dart';
import 'package:mpos_beat/presentation/logic/authentication_provider.dart';
import 'package:mpos_beat/presentation/views/otp/widgets/otp_field.dart';

class InvalidOtp extends StatelessWidget {
  static const routeName = "invalid-otp-screen";
  const InvalidOtp({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalization = context.l10n;
    final wheelKey = GlobalKey<WheelSpinnerState>();
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          context.read<AuthFormProvider>().resetInvalidOtpFlag(false);
        }
      },
      child: Consumer<AuthFormProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  foregroundColor: ColorResources.transparent,
                  surfaceTintColor: ColorResources.transparent,
                  backgroundColor: ColorResources.transparent,
                  centerTitle: true,
                  title: Text(
                    appLocalization.otp_auth_enter_otp_here,
                    style: context.textStyle.s22.indigoBlue.bold,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        h60,
                        OtpInputField(
                          borderColor: ColorResources.roseRed,
                          onCompleted: (otp) {
                            debugPrint("Entered OTP: $otp");
                            provider.updateOtp(otp);
                          },
                        ),
                        h16,
                        if ((provider.otpError != null ||
                            !provider.otp.isValid()))
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppAssets.error,
                                height: 11,
                                width: 11,
                              ),
                              w10,
                              Flexible(
                                child: Text(
                                  "${provider.otpError ?? provider.otp.getFailure?.errorMsg}",
                                  style: context.textStyle.s10.roseRed,
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),

                        h24,
                        CustomButton(
                          buttonText: appLocalization.submit,
                          isborderEnable: false,
                          onTap: () {
                            provider.submitOtp(
                              context,
                              onError: (p0) {},
                              onResponse: (response) {
                                if (response.status == 1) {
                                  context.pushNamed(
                                    AppRouterConst.customRouteScreen,
                                    extra: NavigationType.success,
                                  );
                                  // CustomAlertDialog.showCustomDialog(
                                  //   title: "OTP Verified Successfully",
                                  //   typeAlert: TypeAlert.success,
                                  // );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: const Text(
                                        "OTP Verified Successfully",
                                        textAlign: TextAlign.center,
                                      ),
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 8,
                                      ),
                                    ),
                                  );
                                }

                                // else if (response.status == 0) {
                                //   GoRouter.of(
                                //     context,
                                //   ).pushNamed(AppRouterConst.invalidOtp);
// import 'package:mpos_beat/core/utils/imports.dart';
// import 'package:mpos_beat/presentation/common/animations/wheel_spinner.dart';
// import 'package:mpos_beat/presentation/logic/authentication_provider.dart';
// import 'package:mpos_beat/presentation/views/otp/widgets/otp_field.dart';

// class InvalidOtp extends StatelessWidget {
//   static const routeName = "invalid-otp-screen";
//   const InvalidOtp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final appLocalization = context.l10n;
//     final wheelKey = GlobalKey<WheelSpinnerState>();
//     return PopScope(
//       canPop: true,
//       onPopInvokedWithResult: (didPop, result) {
//         if (didPop) {
//           context.read<AuthFormProvider>().resetInvalidOtpFlag(false);
//         }
//       },
//       child: Consumer<AuthFormProvider>(
//         builder: (context, provider, _) {
//           return Scaffold(
//             body: CustomScrollView(
//               slivers: [
//                 SliverAppBar(
//                   pinned: true,
//                   foregroundColor: ColorResources.transparent,
//                   surfaceTintColor: ColorResources.transparent,
//                   backgroundColor: ColorResources.transparent,
//                   centerTitle: true,
//                   title: Text(
//                     appLocalization.otp_auth_enter_otp_here,
//                     style: context.textStyle.s22.indigoBlue.bold,
//                   ),
//                 ),
//                 SliverToBoxAdapter(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: Column(
//                       children: [
//                         h60,
//                         OtpInputField(
//                           borderColor: ColorResources.roseRed,
//                           onCompleted: (otp) {
//                             debugPrint("Entered OTP: $otp");
//                             provider.updateOtp(otp);
//                           },
//                         ),
//                         h16,
//                         if ((provider.otpError != null ||
//                             !provider.otp.isValid()))
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 AppAssets.error,
//                                 height: 11,
//                                 width: 11,
//                               ),
//                               w10,
//                               Text(
//                                 "${provider.otpError ?? provider.otp.getFailure?.errorMsg}",
//                                 style: context.textStyle.s10.roseRed,
//                               ),
//                             ],
//                           ),
//                         h24,
//                         CustomButton(
//                           buttonText: appLocalization.submit,
//                           isborderEnable: false,
//                           onTap: () {
//                             provider.submitOtp(
//                               context,
//                               onError: (p0) {},
//                               onResponse: (response) {
//                                 if (response.status == 1) {
//                                   context.pushNamed(
//                                     AppRouterConst.customRouteScreen,
//                                     extra: NavigationType.success,
//                                   );
//                                   // CustomAlertDialog.showCustomDialog(
//                                   //   title: "OTP Verified Successfully",
//                                   //   typeAlert: TypeAlert.success,
//                                   // );
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     SnackBar(
//                                       content: const Text(
//                                         "OTP Verified Successfully",
//                                         textAlign: TextAlign.center,
//                                       ),
//                                       behavior: SnackBarBehavior.floating,
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(16),
//                                       ),
//                                       margin: const EdgeInsets.symmetric(
//                                         horizontal: 16,
//                                         vertical: 8,
//                                       ),
//                                     ),
//                                   );
//                                 } 
                                
//                                 // else if (response.status == 0) {
//                                 //   GoRouter.of(
//                                 //     context,
//                                 //   ).pushNamed(AppRouterConst.invalidOtp);
//                                 // }
//                               },
//                             );
//                           },
//                         ),
//                         h24,
//                         Text(
//                           provider.remainingSeconds > 0
//                               ? "${appLocalization.otp_auth_enter_otp_in} ${provider.formatTime()} ${appLocalization.otp_auth_seconds}"
//                               : appLocalization.otp_auth_enter_otp_0,
//                           textAlign: TextAlign.center,
//                           style: context.textStyle.s12.silverGray.w400,
//                         ),
//                         h16,
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             WheelSpinner(
//                               key: wheelKey,
//                               path: AppAssets.refresh,
//                               imageType: ImageType.svg,
//                               height: 22,
//                             ),
//                             w8,
//                             InkWell(
//                               onTap: provider.remainingSeconds > 0
//                                   ? null
//                                   : () {
//                                       provider.startOtpTimer();
//                                       provider.resendOtp(
//                                         context,
//                                         id: provider.customerId,
//                                       );
//                                       wheelKey.currentState?.startSpin();
//                                     },
//                               child: Text(
//                                 appLocalization.otp_auth_resend_otp,
//                                 style: provider.remainingSeconds > 0
//                                     ? context.textStyle.s12.bold.bluishGray
//                                     : context.textStyle.s12.bold.indigoBlue,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
