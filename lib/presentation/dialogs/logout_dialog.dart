import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/theme/colors.dart';
import 'package:mpos_beat/core/utils/extentions.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogOutDialogs {
  static Future<bool> show(BuildContext context) async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(20),
              constraints: BoxConstraints(
                minHeight: 180,
                minWidth: 280,
                maxWidth: context.getSize.width - 32,
              ),
              decoration: BoxDecoration(
                color: ColorResources.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Logout",
                    style: context.textStyle.s14.w500.indigoBlue,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Are you sure you want to logout?",
                    style: context.textStyle.s12.w500.dustyBlue,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),

                  /// BUTTONS
                  Row(
                    children: [
                      /// LOGOUT BUTTON
                      Expanded(
                        child: CustomButton(
                          buttonText: "Logout",
                          isborderEnable: false,
                          borderRadius: BorderRadius.circular(16),
                          onTap: () async {
                            final prefs = sl<SharedPreferences>();
                            await prefs.remove("token");
                            final appDb = sl<AppDb>();
                            await appDb.registrationDetailDao.clearAll();

                            /// Close dialog first
                            Navigator.of(ctx).pop(true);

                            /// Navigate after closing dialog
                            context.pushNamed(AppRouterConst.login);
                          },
                          textStyle: context.textStyle.s12.white.w500,
                        ),
                      ),

                      const SizedBox(width: 10),

                      /// CANCEL BUTTON
                      Expanded(
                        child: CustomButton(
                          color: ColorResources.bluishGray,
                          buttonText: "Cancel",
                          isborderEnable: false,
                          borderRadius: BorderRadius.circular(16),
                          onTap: () {
                            Navigator.of(ctx).pop(false);
                          },
                          textStyle: context.textStyle.s12.white.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    return shouldLogout ?? false;
  }
}
