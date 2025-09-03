import 'package:mpos_beat/core/theme/colors.dart';
import 'package:mpos_beat/core/theme/theme/theme_provider.dart';
import 'package:mpos_beat/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:mpos_beat/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

extension StringCapitalization on String {
  String get capitalize {
    if (isEmpty) {
      return this;
    }

    List<String> words = split(" ");
    for (int i = 0; i < words.length; i++) {
      if (words[i].isNotEmpty) {
        words[i] = words[i][0].toUpperCase() + words[i].substring(1);
      }
    }
    return words.join(" ");
  }
}

// extension BuildContextX on BuildContext {
//   // int? get userId =>
//   //     int.tryParse(sl<SharedPreferences>().getString('id') ?? '');
//   AppThemeMode get theme => watch<ThemeProvider>().themeMode;
//   AppThemeMode get theme1 => watch<ThemeProvider>().themeMode;

//   TextStyle get body => Theme.of(this).textTheme.bodyMedium!;

//   TextStyle get textStyle {
//     switch (theme) {
//       case AppThemeMode.light:
//         return Theme.of(this)
//             .textTheme
//             .bodyMedium!
//             .copyWith(color: ColorResources.lemonYellow);
//       case AppThemeMode.dark:
//         return Theme.of(this)
//             .textTheme
//             .bodyMedium!
//             .copyWith(color: ColorResources.red);
//     }
//   }
// }

extension BuildContextX on BuildContext {
  AppThemeMode get theme => read<ThemeProvider>().themeMode;

  TextStyle get textStyle {
    switch (theme) {
      case AppThemeMode.light:
        return Theme.of(this)
            .textTheme
            .bodyMedium!
            .copyWith(color: ColorResources.bluishGray, fontFamily: 'Roboto');
      case AppThemeMode.dark:
        return Theme.of(this)
            .textTheme
            .bodyMedium!
            .copyWith(color: ColorResources.white, fontFamily: 'Roboto');
    }
  }

  Size get getSize => MediaQuery.sizeOf(this);
}

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
