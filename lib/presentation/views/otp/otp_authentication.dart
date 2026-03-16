import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/animations/wheel_spinner.dart';
import 'package:mpos_beat/presentation/common/widgets/base_scaffold.dart';
import 'package:mpos_beat/presentation/common/widgets/sliverSpace.dart';
import 'package:mpos_beat/presentation/logic/authentication_provider.dart';
import 'package:mpos_beat/presentation/views/otp/widgets/otp_field.dart';

class OtpAuthentication extends StatefulWidget {
  static const routeName = 'otp-auth';
  const OtpAuthentication({super.key});

  @override
  State<OtpAuthentication> createState() => _OtpAuthenticationState();
}

class _OtpAuthenticationState extends State<OtpAuthentication> {
  late TextEditingController otpController;
  final wheelKey = GlobalKey<WheelSpinnerState>();

  @override
  void initState() {
    super.initState();
    otpController = TextEditingController();

    final provider = Provider.of<AuthFormProvider>(context, listen: false);
    provider.startOtpTimer(); // ✅ Start only once when screen loads
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalization = context.l10n;

    return Consumer<AuthFormProvider>(
      builder: (context, provider, _) {
        return PopScope(
          canPop: true,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) return;
            // provider.resetSignUpForm();
          },
          child: BaseScaffold(
            widget: SizedBox(
              height: context.getSize.height,
              width: context.getSize.width,
              child: CustomScrollView(
                slivers: [
                  const SliverSpace(diamention: h60),

                  SliverToBoxAdapter(
                    child: Center(
                      child: Text(
                        appLocalization.otp_auth_enter_otp_here,
                        style: context.textStyle.s22.white.bold,
                      ),
                    ),
                  ),

                  const SliverSpace(diamention: h28),

                  SliverToBoxAdapter(
                    child: Center(
                      child: Container(
                        width: context.getSize.width - 32,
                        padding: const EdgeInsets.all(36),
                        decoration: BoxDecoration(
                          color: ColorResources.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 13),
                              blurRadius: 20,
                              color: ColorResources.overlayBlack,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              "${appLocalization.otp_auth_sent_4_digit} ${provider.maskedPhone}",
                              textAlign: TextAlign.center,
                              style: context.textStyle.s12.bluishGray.w400,
                            ),
                            h16,

                            /// OTP FIELD
                            OtpInputField(
                              borderColor: ColorResources.indigoBlue,
                              controller: otpController,
                              onCompleted: provider.updateOtp,
                            ),

                            h8,

                            /// ERROR MESSAGE
                            if ((provider.otpError != null ||
                                    !provider.otp.isValid()) &&
                                provider.otpAutovalidateMode ==
                                    AutovalidateMode.always)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    AppAssets.error,
                                    height: 11,
                                    width: 11,
                                  ),
                                  w10,
                                  Text(
                                    provider.otpError ??
                                        provider.otp.getFailure?.errorMsg ??
                                        "",
                                    style: context.textStyle.s10.roseRed,
                                  ),
                                ],
                              ),

                            h8,

                            /// SUBMIT BUTTON
                            CustomButton(
                              height: context.getSize.height * 0.05,
                              buttonText: appLocalization.submit,
                              isborderEnable: false,
                              onTap: () {
                                provider.submitOtp(
                                  context,
                                  onError: (_) {},
                                  onResponse: (response) {
                                    if (response.status == 1) {
                                      context.pushNamed(
                                        AppRouterConst.customRouteScreen,
                                        extra: NavigationType.success,
                                      );

                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: const Text(
                                            "OTP Verified Successfully",
                                            textAlign: TextAlign.center,
                                          ),
                                          behavior: SnackBarBehavior.floating,
                                        ),
                                      );
                                    }
                                  },
                                );
                              },
                            ),

                            h30,

                            /// TIMER
                            Text(
                              provider.remainingSeconds > 0
                                  ? "Enter OTP in ${provider.formatTime()}"
                                  : "OTP Expired",
                              textAlign: TextAlign.center,
                              style: context.textStyle.s12.bluishGray.w400,
                            ),

                            h20,

                            /// RESEND
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                WheelSpinner(
                                  key: wheelKey,
                                  path: AppAssets.refresh,
                                  imageType: ImageType.svg,
                                  height: 22,
                                ),
                                w8,
                                InkWell(
                                  onTap: provider.remainingSeconds > 0
                                      ? null
                                      : () async {
                                          otpController.clear();
                                          wheelKey.currentState?.startSpin();

                                          await provider.resendOtp(
                                            context,
                                            id: provider.customerId,
                                          );
                                        },
                                  child: Text(
                                    "Resend OTP",
                                    style: provider.remainingSeconds > 0
                                        ? context.textStyle.s12.bold.bluishGray
                                        : context.textStyle.s12.bold.indigoBlue,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
