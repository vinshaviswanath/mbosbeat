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
        return AlertDialog(
          backgroundColor: ColorResources.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text("Exit App", style: context.textStyle.s22.dustyBlue),
          content: Text(
            "Are you sure you want to exit the app?",
            style: context.textStyle.s14.dustyBlue,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: Text(
                "Cancel",
                style: context.textStyle.s12.indigoBlue.w600,
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(true),
              child: Text("Exit", style: context.textStyle.s12.indigoBlue.w600),
            ),
          ],
        );
      },
    );
    return shouldExit ?? false;
  }

  static void exitApp() {
    SystemNavigator.pop();
  }
}
