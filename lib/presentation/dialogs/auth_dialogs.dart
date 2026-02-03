import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mpos_beat/core/theme/colors.dart';
import 'package:mpos_beat/core/utils/extentions.dart';
import 'package:mpos_beat/core/utils/imports.dart';

class AuthDialogs {
  static Future<bool> show(BuildContext context) async {
    final shouldExit = await showDialog<bool>(
      context: context,
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
                    "Exit App",
                    style: context.textStyle.s14.w500.indigoBlue,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Are you sure you want to exit the app?",
                    style: context.textStyle.s12.w500.dustyBlue,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          buttonText: "Cancel",
                          color: ColorResources.bluishGray,
                          isborderEnable: false,
                          borderRadius: BorderRadius.circular(16),
                          onTap: () {
                            Navigator.of(ctx).pop(false);
                          },
                          textStyle: context.textStyle.s12.white.w500,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CustomButton(
                          buttonText: "Exit",
                          isborderEnable: false,
                          borderRadius: BorderRadius.circular(16),
                          onTap: () {
                            Navigator.of(ctx).pop(true);
                            exitApp();
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
    return shouldExit ?? false;
  }

  static void exitApp() {
    SystemNavigator.pop();
  }
}
