import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:go_router/go_router.dart';
import 'package:mpos_beat/core/utils/alert_dialog.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/user_model.dart';
import 'package:mpos_beat/presentation/common/animations/wheel_spinner.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_button.dart';
import 'package:mpos_beat/presentation/logic/authentication_provider.dart';
import 'package:mpos_beat/presentation/views/otp/widgets/otp_field.dart';
import 'package:mpos_beat/route/app_router_const.dart';

class InvalidOtp extends StatelessWidget {
  static const routeName = "invalid-otp-screen";
  const InvalidOtp({super.key});

  @override
  Widget build(BuildContext context) {
    final wheelKey = GlobalKey<WheelSpinnerState>();
    return PopScope(
      canPop: true, // allow normal back navigation
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          // reset invalid OTP flag when leaving OTP screen
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
                    "Enter OTP here",
                    style: context.textStyle.s22.indigoBlue,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        gap60,
                        OtpInputField(
                          borderColor: ColorResources.roseRed,
                          onCompleted: (otp) {
                            debugPrint("Entered OTP: $otp");
                            provider.updateOtp(otp);
                          },
                        ),
                        gap16,
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
                              gap10,
                              Text(
                                "${provider.otpError ?? provider.otp.getFailure?.errorMsg}",
                                style: context.textStyle.s10.roseRed,
                              ),
                            ],
                          ),
                        gap24,
                        CustomButton(
                          buttonText: "Submit",
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
                                  CustomAlertDialog.showCustomDialog(
                                    title: "OTP Verified Successfully",
                                    typeAlert: TypeAlert.success,
                                  );
                                } else if (response.status == 0) {
                                  GoRouter.of(context).pushNamed(
                                    AppRouterConst.invalidOtp,
                                  );
                                }
                              },
                            );
                          },
                        ),
                        gap24,
                        Text(
                          provider.remainingSeconds > 0
                              ? "Enter OTP in ${provider.formatTime()} Seconds"
                              : "Enter OTP in 00:00 Seconds",
                          textAlign: TextAlign.center,
                          style: context.textStyle.s12,
                        ),
                        gap16,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // SvgPicture.asset(
                            //   AppAssets.refresh,
                            //   height: 22,
                            //   colorFilter: ColorFilter.mode(
                            //       ColorResources.amber, BlendMode.srcIn),
                            // ),
                            WheelSpinner(
                              key: wheelKey,
                              path: AppAssets.refresh,
                              imageType: ImageType.svg,
                              height: 22,
                            ),
                            gap8,
                            InkWell(
                              onTap: provider.remainingSeconds > 0
                                  ? null // disable while timer is active
                                  : () {
                                      provider.startOtpTimer();
                                      provider.resendOtp(context);
                                      wheelKey.currentState?.startSpin();
                                    },
                              child: Text(
                                "Resend OTP",
                                style: provider.remainingSeconds > 0
                                    ? context.textStyle.s12.bold.bluishGray
                                    : context.textStyle.s12.bold.indigoBlue,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
