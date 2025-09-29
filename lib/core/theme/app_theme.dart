import 'package:flutter/material.dart';
import 'package:mpos_beat/core/theme/colors.dart';
import 'package:mpos_beat/core/theme/text_styles.dart';
import 'package:mpos_beat/core/utils/enums.dart';
import 'package:mpos_beat/core/utils/extentions.dart';

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
          appBarTheme: AppBarTheme(
            scrolledUnderElevation: 0,
            backgroundColor: ColorResources.palegrayblue,
            titleTextStyle: context.textStyle.s22.indigoBlue.roboto.bold,
            iconTheme: const IconThemeData(
              color: ColorResources.indigoBlue,
              size: 18,
            ),
          ),
        );
      case AppThemeMode.dark:
        return ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.black,

          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.white),
          ),

          // fontFamily: 'Dancing Script',
          appBarTheme: AppBarTheme(
            scrolledUnderElevation: 0,
            backgroundColor: ColorResources.palegrayblue,
            titleTextStyle: context.textStyle.s22.indigoBlue.roboto.bold,
            iconTheme: const IconThemeData(
              color: ColorResources.indigoBlue,
              size: 18,
            ),
          ),
        );
    }
  }
}
