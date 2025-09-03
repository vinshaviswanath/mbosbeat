// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get fetchlead_title => 'Lead Requests';

  @override
  String get fetchlead_search_hint => 'Search';

  @override
  String get fetchsupport_title => 'Support Requests';

  @override
  String get fetchsupport_search_hint => 'Search';

  @override
  String get greetings => 'Hi there...';

  @override
  String get login => 'Login';

  @override
  String get mPos => 'mPos Beat';

  @override
  String get welcome_back => 'Welcome back,\nyou\'ve been missed!';
}
