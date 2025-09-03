// import 'package:clean_format/core/theme/colors.dart';
// import 'package:clean_format/core/theme/text_styles.dart';
// import 'package:clean_format/core/utils/enums.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class AppTheme {
//   // static ThemeData getTheme(AppThemeMode mode) {
//   //   switch (mode) {
//   //     case AppThemeMode.dark:
//   //       return _darkTheme;
//   //     case AppThemeMode.light:
//   //       return _lightTheme;
//   //   }
//   // }

//   // static ThemeData get _lightTheme => ThemeData(
//   //       scaffoldBackgroundColor: ColorResources.white,
//   //       textTheme: const TextTheme(
//   //         bodyMedium: baseTestStyle,
//   //         headlineSmall: baseHeadingStyle,
//   //       ),
//   //       appBarTheme: const AppBarTheme(
//   //         systemOverlayStyle: SystemUiOverlayStyle(
//   //           statusBarColor: Colors.transparent,
//   //         ),
//   //       ),
//   //     );
//   // static ThemeData get _darkTheme => ThemeData(
//   //       scaffoldBackgroundColor:  Color(0xFF191B20),
//   //       textTheme: const TextTheme(
//   //         bodyMedium: baseTestStyle,
//   //         headlineSmall: baseHeadingStyle,
//   //       ),
//   //       appBarTheme: const AppBarTheme(
//   //         systemOverlayStyle: SystemUiOverlayStyle(
//   //           statusBarColor: Colors.transparent,
//   //         ),
//   //       ),
//   //     );
//   // static ThemeData get _premiumTheme => ThemeData(
//   //       scaffoldBackgroundColor: const Color(0xFF211D1D),
//   //       textTheme: const TextTheme(
//   //         bodyMedium: baseTestStyle,
//   //         headlineSmall: baseHeadingStyle,
//   //       ),
//   //       appBarTheme: const AppBarTheme(
//   //         systemOverlayStyle: SystemUiOverlayStyle(
//   //           statusBarColor: Colors.transparent,
//   //         ),
//   //       ),
//   //     );

//   // static PinTheme get defaultPinTheme => PinTheme(
//   //       // width: 70,
//   //       // height: 70,
//   //       margin: const EdgeInsets.all(1),
//   //       textStyle: const TextStyle(
//   //         fontSize: 20,
//   //         color: ColorResources.textColor,
//   //
//   //         fontWeight: FontWeight.w600,
//   //       ),
//   //       decoration: BoxDecoration(
//   //         color: ColorResources.secondary,
//   //         border: Border.all(
//   //           color: ColorResources.secondary,
//   //         ),
//   //         borderRadius: BorderRadius.circular(16),

//   //       ),
//   //     );

//   // static PinTheme get focusedPinTheme => defaultPinTheme.copyDecorationWith(
//   //       border: Border.all(color: ColorResources.secondary),
//   //       borderRadius: BorderRadius.circular(16),
//   //     );

//   // static PinTheme get submittedPinTheme => defaultPinTheme.copyWith(
//   //       decoration: defaultPinTheme.decoration?.copyWith(
//   //         color: ColorResources.secondary,
//   //       ),
//   //     );
// }

import 'package:mpos_beat/core/theme/colors.dart';
import 'package:mpos_beat/core/utils/enums.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getTheme(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.light:
        return ThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: ColorResources.white,
          textTheme: const TextTheme(
            // bodyMedium: baseTestStyle,
            bodyMedium: TextStyle(color: Colors.black),
          ),
        );
      case AppThemeMode.dark:
        return ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.black,
          textTheme: const TextTheme(
            // bodyMedium: baseTestStyle,
            bodyMedium: TextStyle(color: Colors.white),
          ),
        );
    }
  }
}
