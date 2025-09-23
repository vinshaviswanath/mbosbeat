import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mpos_beat/core/theme/diamentions.dart';
import 'package:mpos_beat/core/theme/text_styles.dart';
import 'package:mpos_beat/core/utils/app_assets.dart';
import 'package:mpos_beat/core/utils/custom_dialogs.dart';
import 'package:mpos_beat/core/utils/extentions.dart';
import 'package:mpos_beat/l10n/app_localizations.dart';
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
              gap20,
              Text(
                appLocalization.already_registered,
                style: context.textStyle.s12.w700.indigoBlue,
              ),
              gap16,
              Image.asset(
                AppAssets.mailSend,
                height: context.getSize.height * 0.15,
              ),
              gap24,
              SizedBox(
                width: context.getSize.width * 0.8,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: appLocalization.hello),
                      TextSpan(
                        text: title,
                        style: context.textStyle.s12.bluishGray.bold,
                      ),
                      TextSpan(text: appLocalization.verify_num_text),
                    ],
                    style: context.textStyle.s12.bluishGray,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              gap24,
              CustomButton(
                onTap: () async {
                  await provider.resendOtp(context, id: id);
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.pop(context);
                    context.push(AppRouterConst.otpAuth);
                  });
                },
                buttonText: appLocalization.verify_number,
                textStyle: context.textStyle.s12.white.bold,
                isborderEnable: false,
                borderRadius: BorderRadius.circular(16),
                width: context.getSize.width / 2,
              ),
              gap28,
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
          gap20,
          Text(
            appLocalization.already_registered,
            style: context.textStyle.s12.w700.indigoBlue,
          ),
          gap16,
          Image.asset(
            AppAssets.registered,
            height: context.getSize.height * 0.15,
          ),
          gap24,
          SizedBox(
            width: context.getSize.width * 0.8,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: appLocalization.hello),
                  TextSpan(
                    text: name,
                    style: context.textStyle.s12.bluishGray.bold,
                  ),
                  TextSpan(text: appLocalization.kindly_login),
                ],
                style: context.textStyle.s12.bluishGray,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          gap24,
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
          gap28,
        ],
      ),
    );
  }
}
