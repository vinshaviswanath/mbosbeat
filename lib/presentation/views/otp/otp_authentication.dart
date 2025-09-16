import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:go_router/go_router.dart';
import 'package:mpos_beat/core/utils/alert_dialog.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/user_model.dart';
import 'package:mpos_beat/presentation/common/animations/wheel_spinner.dart';
import 'package:mpos_beat/presentation/common/widgets/base_scaffold.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_button.dart';
import 'package:mpos_beat/presentation/logic/authentication_provider.dart';
import 'package:mpos_beat/presentation/views/otp/widgets/otp_field.dart';
import 'package:mpos_beat/route/app_router_const.dart';

class OtpAuthentication extends StatefulWidget {
  final LocalUser user;
  static const routeName = 'otp-auth';
  const OtpAuthentication({super.key, required this.user});

  @override
  State<OtpAuthentication> createState() => _OtpAuthenticationState();
}

class _OtpAuthenticationState extends State<OtpAuthentication> {
  @override
  void initState() {
    // TODO: implement initState
    final provider = Provider.of<AuthFormProvider>(context, listen: false);
    provider.startOtpTimer();
    super.initState();
  }

  // String formatTime(int seconds) {
  @override
  Widget build(BuildContext context) {
    final wheelKey = GlobalKey<WheelSpinnerState>();
    return Consumer<AuthFormProvider>(
      builder: (context, provider, _) {
        return BaseScaffold(
          widget: SizedBox(
            height: context.getSize.height,
            width: context.getSize.width,
            child: CustomScrollView(
              slivers: [
                const SliverGap(60),
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Enter OTP here",
                        style: context.textStyle.s22.white,
                      ),
                    ],
                  ),
                ),
                const SliverGap(28),
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: context.getSize.width - 32,
                        height: context.getSize.height * 0.4,
                        padding: const EdgeInsets.all(36),
                        decoration: BoxDecoration(
                          color: ColorResources.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 13),
                                blurRadius: 20,
                                color: ColorResources.overlayBlack)
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "We have sent a 4 digit code to your\n ${provider.maskedPhone} mobile number.",
                              textAlign: TextAlign.center,
                              style: context.textStyle.s12,
                            ),
                            gap16,
                            OtpInputField(
                              borderColor: ColorResources.indigoBlue,
                              onCompleted: (otp) {
                                debugPrint("Entered OTP: $otp");
                                provider.updateOtp(otp);
                              },
                            ),
                            gap8,
                            if (provider.otpError != null)
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
                                    "${provider.otpError}",
                                    style: context.textStyle.s10.roseRed,
                                  ),
                                ],
                              ),
                            gap8,
                            CustomButton(
                              buttonText: "Submit",
                              isborderEnable: false,
                              onTap: () {
                                context.pushNamed(
                                  AppRouterConst.loadingScreen,
                                  extra: () {
                                    Navigator.pop(context);
                                    provider.submitOtp(
                                      context,
                                      widget.user,
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
                                            extra: widget.user,
                                          );
                                        }
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                            gap40,
                            Text(
                              provider.remainingSeconds > 0
                                  ? "Enter OTP in ${provider.formatTime()} Seconds"
                                  : "Enter OTP in 00:00 Seconds",
                              textAlign: TextAlign.center,
                              style: context.textStyle.s12,
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // SvgPicture.asset(
                                //   AppAssets.refresh,
                                //   height: 22,
                                //   colorFilter: const ColorFilter.mode(
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
                                  onTap: () {
                                    provider.startOtpTimer();
                                    wheelKey.currentState?.startSpin();
                                  },
                                  child: Text(
                                    "Resend OTP",
                                    style:
                                        context.textStyle.s12.bold.indigoBlue,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
