import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthDialogs {
  static Future<bool> show(BuildContext context) async {
    final shouldExit = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text("Exit App"),
          content: const Text("Are you sure you want to exit the app?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(true),
              child: const Text("Exit"),
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
