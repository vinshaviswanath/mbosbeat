import 'dart:convert';

import 'package:mpos_beat/core/theme/theme/theme_provider.dart';
import 'package:mpos_beat/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:mpos_beat/l10n/generated/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

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
        return Theme.of(this).textTheme.bodyMedium!;
      case AppThemeMode.dark:
        return Theme.of(this).textTheme.bodyMedium!;
    }
  }

  Size get getSize => MediaQuery.sizeOf(this);
}

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}

extension ResponseX on http.Response {
  bool get isOk => statusCode == 200 || statusCode == 201;

  dynamic get data => jsonDecode(body);

  String get message {
    if (data is Map && data['message'] != null) {
      return data['message'].toString();
    }
    return data['message']?.toString() ?? '';
  }

  String get error {
    if (data is Map && data['message'] != null) {
      return data['message'].toString();
    }
    return 'Unknown error';
  }
}


extension StreamedResponseX on http.StreamedResponse {
  Future<bool> get isOk async => statusCode == 200 || statusCode == 201;

  Future<dynamic> get data async {
    final body = await stream.bytesToString();
    return jsonDecode(body);
  }

  Future<String> get message async {
    final decoded = await data;
    if (decoded is Map && decoded['message'] != null) {
      return decoded['message'].toString();
    }
    return decoded['message']?.toString() ?? '';
  }

  Future<String> get error async {
    final decoded = await data;
    if (decoded is Map && decoded['message'] != null) {
      return decoded['message'].toString();
    }
    return 'Unknown error';
  }
}

// extension StreamedResponseX on http.StreamedResponse {
//   Future<http.Response> toResponse() async {
//     return await http.Response.fromStream(this);
//   }
// }




// extension JsonPrintable<T extends Object> on T {
//   /// Convert to raw JSON string if object has `toJson`
//   String toRawJson() {
//     if (!(this as dynamic).toJson is Function) {
//       throw UnsupportedError(
//           "${T.toString()} does not implement toJson()");
//     }
//     final map = (this as dynamic).toJson() as Map<String, dynamic>;
//     return jsonEncode(map);
//   }

//   /// Pretty print JSON with indentation
//   String prettyPrint() {
//     if (!(this as dynamic).toJson is Function) {
//       throw UnsupportedError(
//           "${T.toString()} does not implement toJson()");
//     }
//     final map = (this as dynamic).toJson() as Map<String, dynamic>;
//     return const JsonEncoder.withIndent('  ').convert(map);
//   }
// }