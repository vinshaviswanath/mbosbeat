import 'package:mpos_beat/core/theme/colors.dart';
import 'package:mpos_beat/core/utils/app_details.dart';
import 'package:mpos_beat/core/utils/enums.dart';
import 'package:mpos_beat/core/theme/theme/theme_provider.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

const baseTestStyle = TextStyle(fontFamily: 'Roboto');
// const baseHeadingStyle = TextStyle(fontFamily: 'Jost');

final _scaleWidth = AppDetails.screenSize.width / AppDetails.designWidth;

const premiumTextGradient = LinearGradient(colors: [
  Color(0xFFFFFFCC),
  Color(0xFFFFF4B4),
  Color(0XFFFFD159),
]);

extension TextStyleX on TextStyle {
  TextStyle get w300 => copyWith(fontWeight: FontWeight.w300);
  TextStyle get w400 => copyWith(fontWeight: FontWeight.w400);
  TextStyle get w500 => copyWith(fontWeight: FontWeight.w500);
  TextStyle get w600 => copyWith(fontWeight: FontWeight.w600);
  TextStyle get w700 => copyWith(fontWeight: FontWeight.w700);
  TextStyle get w800 => copyWith(fontWeight: FontWeight.w800);
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  TextStyle get s09 => copyWith(fontSize: 9 * _scaleWidth);
  TextStyle get s10 => copyWith(fontSize: 10 * _scaleWidth);
  TextStyle get s11 => copyWith(fontSize: 11 * _scaleWidth);
  TextStyle get s12 => copyWith(fontSize: 12 * _scaleWidth);
  TextStyle get s14 => copyWith(fontSize: 14 * _scaleWidth);
  TextStyle get s16 => copyWith(fontSize: 16 * _scaleWidth);
  TextStyle get s18 => copyWith(fontSize: 18 * _scaleWidth);
  TextStyle get s20 => copyWith(fontSize: 20 * _scaleWidth);
  TextStyle get s22 => copyWith(fontSize: 22 * _scaleWidth);
  TextStyle get s24 => copyWith(fontSize: 24 * _scaleWidth);
  TextStyle get s26 => copyWith(fontSize: 26 * _scaleWidth);
  TextStyle get s28 => copyWith(fontSize: 28 * _scaleWidth);
  TextStyle get s31 => copyWith(fontSize: 31 * _scaleWidth);

  TextStyle get underline => copyWith(
        decoration: TextDecoration.underline,
      );

  TextStyle get raleway => copyWith(fontFamily: 'Roboto');
  // TextStyle get jost => copyWith(fontFamily: 'Jost');

  TextStyle get white => copyWith(color: ColorResources.white);
  TextStyle get black => copyWith(color: ColorResources.black);
  TextStyle get bluishGray => copyWith(color: ColorResources.bluishGray);
  TextStyle get roseRed => copyWith(color: ColorResources.roseRed);
  TextStyle get indigoBlue => copyWith(color: ColorResources.indigoBlue);
  TextStyle get amber => copyWith(color: ColorResources.amber);




  // TextStyle get buttonGradientColor2 =>
  //     copyWith(color: ColorResources.buttonGradientColor2);
  // TextStyle get indigoDye => copyWith(color: ColorResources.indigoDye);

}

// class ThemeTextStyles {
//   static TextStyle getPrimaryTextStyle(BuildContext context) {
//     final themeMode = context.watch<ThemeCubit>().state.themeMode;
//     final baseStyle = Theme.of(context).textTheme.titleSmall;

//     switch (themeMode) {
//       case AppThemeMode.light:
//         return baseStyle!.deepMaroon;
//       case AppThemeMode.dark:
//         return baseStyle!.white;
//     }
//   }

//   static TextStyle getSecondaryTextStyle(BuildContext context) {
//     final themeMode = context.watch<ThemeCubit>().state.themeMode;
//     final baseStyle = Theme.of(context).textTheme.titleSmall;

//     switch (themeMode) {
//       case AppThemeMode.light:
//         return baseStyle!.mauveBrown;
//       case AppThemeMode.dark:
//         return baseStyle!.slateGray;
//     }
//   }
// }

class ThemeTextStyles {
  static TextStyle getPrimaryTextStyle(BuildContext context) {
    final themeMode = context.watch<ThemeProvider>().themeMode;
    final baseStyle = Theme.of(context).textTheme.titleSmall;

    switch (themeMode) {
      case AppThemeMode.light:
        return baseStyle!.bluishGray;
      case AppThemeMode.dark:
        return baseStyle!.white;
    }
  }

  static TextStyle getSecondaryTextStyle(BuildContext context) {
    final themeMode = context.watch<ThemeProvider>().themeMode;
    final baseStyle = Theme.of(context).textTheme.titleSmall;

    switch (themeMode) {
      case AppThemeMode.light:
        return baseStyle!.black;
      case AppThemeMode.dark:
        return baseStyle!.white;
    }
  }
}
