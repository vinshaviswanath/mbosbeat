import 'package:flutter/material.dart';
import 'package:mpos_beat/core/theme/colors.dart';
import 'package:mpos_beat/core/utils/enums.dart';

class AppTheme {
  static ThemeData getTheme(AppThemeMode mode, BuildContext context) {
    switch (mode) {
      case AppThemeMode.light:
        return ThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: ColorResources.white,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.black),
          ),

          // fontFamily: 'Dancing Script',
        );
      case AppThemeMode.dark:
        return ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.black,

          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.white),
          ),
          // fontFamily: 'Dancing Script',
        );
    }
  }
}
