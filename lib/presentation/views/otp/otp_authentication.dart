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
  @override
  void initState() {
    final provider = Provider.of<AuthFormProvider>(context, listen: false);
    provider.startOtpTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalization = context.l10n;
    final wheelKey = GlobalKey<WheelSpinnerState>();
    return Consumer<AuthFormProvider>(
      builder: (context, provider, _) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) async {
            if (didPop) return;

            provider.resetSignUpForm();
            Navigator.pop(context);
          },
          child: BaseScaffold(
            widget: SizedBox(
              height: context.getSize.height,
              width: context.getSize.width,
              child: CustomScrollView(
                slivers: [
                  const SliverSpace(diamention: h60),
                  SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          appLocalization.otp_auth_enter_otp_here,
                          style: context.textStyle.s22.white.bold,
                        ),
                      ],
                    ),
                  ),
                  const SliverSpace(diamention: h28),
                  SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: context.getSize.width - 32,
                          height: context.getSize.height * 0.38,
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${appLocalization.otp_auth_sent_4_digit} ${provider.maskedPhone} ${appLocalization.otp_auth_mob_number}",
                                textAlign: TextAlign.center,
                                style: context.textStyle.s12.bluishGray.w400,
                              ),
                              h16,
                              OtpInputField(
                                borderColor: ColorResources.indigoBlue,
                                onCompleted: (otp) {
                                  debugPrint("Entered OTP: $otp");
                                  provider.updateOtp(otp);
                                },
                              ),
                              h8,
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
                                      "${provider.otpError ?? provider.otp.getFailure?.errorMsg}",
                                      style: context.textStyle.s10.roseRed,
                                    ),
                                  ],
                                ),
                              h8,
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: CustomButton(
                                  height: context.getSize.height * 0.05,
                                  buttonText: appLocalization.submit,
                                  isborderEnable: false,
                                  onTap: () {
                                    provider.submitOtp(
                                      context,
                                      onError: (p0) {},
                                      onResponse: (response) {
                                        Navigator.pop(context);
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
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 16,
                                                    vertical: 8,
                                                  ),
                                            ),
                                          );
                                        } else if (response.status == 0) {


                                        }
                                      },
                                    );
                                  },
                                ),
                              ),
                              h30,
                              Text(
                                provider.remainingSeconds > 0
                                    ? "${appLocalization.otp_auth_enter_otp_in} ${provider.formatTime()} ${appLocalization.otp_auth_seconds}"
                                    : appLocalization.otp_auth_enter_otp_0,
                                textAlign: TextAlign.center,
                                style: context.textStyle.s12.bluishGray.w400,
                              ),
                              h20,
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
                                        : () {
                                            provider.startOtpTimer();
                                            provider.resendOtp(
                                              context,
                                              id: provider.customerId,
                                            );
                                            wheelKey.currentState?.startSpin();
                                          },
                                    child: Text(
                                      appLocalization.otp_auth_resend_otp,
                                      style: provider.remainingSeconds > 0
                                          ? context
                                                .textStyle
                                                .s12
                                                .bold
                                                .bluishGray
                                          : context
                                                .textStyle
                                                .s12
                                                .bold
                                                .indigoBlue,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
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
