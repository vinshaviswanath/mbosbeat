import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mpos_beat/core/theme/colors.dart';
import 'package:mpos_beat/core/theme/diamentions.dart';
import 'package:mpos_beat/core/theme/text_styles.dart';
import 'package:mpos_beat/core/utils/app_assets.dart';
import 'package:mpos_beat/core/utils/custom_dialogs.dart';
import 'package:mpos_beat/core/utils/extentions.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_button.dart';
import 'package:mpos_beat/presentation/logic/authentication_provider.dart';
import 'package:mpos_beat/presentation/views/login/login_screen.dart';
import 'package:mpos_beat/route/app_router_const.dart';
import 'package:provider/provider.dart';

class RegistrationDialogs {
  static Future<void> pendingRegisteredDialog(
    BuildContext context,
    String title, {
    int? id,
  }) {
    return CustomDialog.showBottomCustomDialog(
      chid: Consumer<AuthFormProvider>(
        builder: (context, provider, _) {
          final appLocalization = context.l10n;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              h20,
              Text(
                appLocalization.registration_dialogs_already_registered,
                style: context.textStyle.s12.w700.indigoBlue,
              ),
              h16,
              Image.asset(
                AppAssets.alreadyRegistered,
                height: context.getSize.height * 0.15,
              ),
              h24,
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: appLocalization.registration_dialogs_hello),
                    TextSpan(
                      text: title,
                      style: context.textStyle.s12.bluishGray.bold,
                    ),
                    TextSpan(
                      text:
                          appLocalization.registration_dialogs_verify_num_text,
                    ),
                  ],
                  style: context.textStyle.s12.bluishGray,
                ),
                textAlign: TextAlign.center,
              ),
              h24,
              CustomButton(
                onTap: () async {
                  await provider.resendOtp(context, id: id);
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.pop(context);
                    context.push(AppRouterConst.otpAuth);
                  });
                },
                buttonText: appLocalization.registration_dialogs_verify_number,
                textStyle: context.textStyle.s12.white.bold,
                isborderEnable: false,
                borderRadius: BorderRadius.circular(16),
                width: context.getSize.width / 2,
              ),
              h28,
            ],
          );
        },
      ),
    );
  }

  static Future<void> completedRegisteredDialog(
    BuildContext context,
    String name,
  ) {
    final appLocalization = context.l10n;

    return CustomDialog.showBottomCustomDialog(
      chid: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          h20,
          Text(
            appLocalization.registration_dialogs_already_registered,
            style: context.textStyle.s12.w700.indigoBlue,
          ),
          h16,
          Image.asset(
            AppAssets.registered,
            height: context.getSize.height * 0.15,
          ),
          h24,
          SizedBox(
            width: context.getSize.width * 0.8,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: appLocalization.registration_dialogs_hello),
                  TextSpan(
                    text: name,
                    style: context.textStyle.s12.bluishGray.bold,
                  ),
                  TextSpan(
                    text: appLocalization.registration_dialogs_kindly_login,
                  ),
                ],
                style: context.textStyle.s12.bluishGray,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          h24,
          CustomButton(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            buttonText: appLocalization.login,
            textStyle: context.textStyle.s12.white.bold,
            isborderEnable: false,
            borderRadius: BorderRadius.circular(16),
            width: context.getSize.width / 2,
          ),
          h28,
        ],
      ),
    );
  }

  static Future<void> customDialog({
    required BuildContext context,
    required String heading,
    required String subTitle,
    required VoidCallback onTap,
    required String buttonText,
  }) {
    final appLocalization = context.l10n;

    return CustomDialog.showBottomCustomDialog(
      chid: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(heading, style: context.textStyle.s14.w500.indigoBlue),
            h10,
            Text(
              subTitle,
              style: context.textStyle.s12.w500.dustyBlue.roboto,
              textAlign: TextAlign.center,
            ),
            h24,
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onTap: () {
                      onTap();
                    },
                    buttonText: buttonText,
                    textStyle: context.textStyle.s12.w500.white.roboto,
                    isborderEnable: false,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                w10,
                Expanded(
                  child: CustomButton(
                    onTap: () => Navigator.pop(context),
                    buttonText: appLocalization.cancel,
                    textStyle: context.textStyle.s12.w500.white.roboto,
                    color: ColorResources.bluishGray,
                    isborderEnable: false,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ],
            ),
            h10,
          ],
        ),
      ),
    );
  }
}
