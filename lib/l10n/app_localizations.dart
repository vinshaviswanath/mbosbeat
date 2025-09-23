import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// No description provided for @onboard_heading1.
  ///
  /// In en, this message translates to:
  /// **'Hello Welcome!'**
  String get onboard_heading1;

  /// No description provided for @onboard_description.
  ///
  /// In en, this message translates to:
  /// **'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor incididunt\nut labore'**
  String get onboard_description;

  /// No description provided for @onboard_heading2.
  ///
  /// In en, this message translates to:
  /// **'Heading Here'**
  String get onboard_heading2;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @get_started.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get get_started;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @welcome_back.
  ///
  /// In en, this message translates to:
  /// **'Welcome back,\nyou\'ve been missed!'**
  String get welcome_back;

  /// No description provided for @email_or_phone.
  ///
  /// In en, this message translates to:
  /// **'Email ID / Mobile Number'**
  String get email_or_phone;

  /// No description provided for @enter_email_or_phone.
  ///
  /// In en, this message translates to:
  /// **'Enter Email / Mobile'**
  String get enter_email_or_phone;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @enter_password.
  ///
  /// In en, this message translates to:
  /// **'Enter Password'**
  String get enter_password;

  /// No description provided for @forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgot_password;

  /// No description provided for @no_account.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get no_account;

  /// No description provided for @sign_up.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get sign_up;

  /// No description provided for @company_name.
  ///
  /// In en, this message translates to:
  /// **'Company Name'**
  String get company_name;

  /// No description provided for @enter_company_name.
  ///
  /// In en, this message translates to:
  /// **'Enter Company Name'**
  String get enter_company_name;

  /// No description provided for @mobile_number.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get mobile_number;

  /// No description provided for @enter_mobile_number.
  ///
  /// In en, this message translates to:
  /// **'Enter Mobile Number'**
  String get enter_mobile_number;

  /// No description provided for @email_ID.
  ///
  /// In en, this message translates to:
  /// **'Email ID'**
  String get email_ID;

  /// No description provided for @enter_email.
  ///
  /// In en, this message translates to:
  /// **'Enter Email'**
  String get enter_email;

  /// No description provided for @confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirm_password;

  /// No description provided for @already_registered.
  ///
  /// In en, this message translates to:
  /// **'You\'re Already Registered !'**
  String get already_registered;

  /// No description provided for @verify_number.
  ///
  /// In en, this message translates to:
  /// **'Verify your mobile number'**
  String get verify_number;

  /// No description provided for @manage_user.
  ///
  /// In en, this message translates to:
  /// **'Manage User'**
  String get manage_user;

  /// No description provided for @manage_company.
  ///
  /// In en, this message translates to:
  /// **'Manage Company'**
  String get manage_company;

  /// No description provided for @enter_otp_here.
  ///
  /// In en, this message translates to:
  /// **'Enter OTP here'**
  String get enter_otp_here;

  /// No description provided for @sent_4_digit.
  ///
  /// In en, this message translates to:
  /// **'We have sent a 4 digit code to your\n'**
  String get sent_4_digit;

  /// No description provided for @mob_number.
  ///
  /// In en, this message translates to:
  /// **'mobile number.'**
  String get mob_number;

  /// No description provided for @enter_otp_0.
  ///
  /// In en, this message translates to:
  /// **'Enter OTP in 00:00 Seconds'**
  String get enter_otp_0;

  /// No description provided for @enter_otp_in.
  ///
  /// In en, this message translates to:
  /// **'Enter OTP in'**
  String get enter_otp_in;

  /// No description provided for @seconds.
  ///
  /// In en, this message translates to:
  /// **'Seconds'**
  String get seconds;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @resend_otp.
  ///
  /// In en, this message translates to:
  /// **'Resend OTP'**
  String get resend_otp;

  /// No description provided for @please_wait.
  ///
  /// In en, this message translates to:
  /// **'Please Wait!'**
  String get please_wait;

  /// No description provided for @reg_is_under_processing.
  ///
  /// In en, this message translates to:
  /// **'Registration is under processing.'**
  String get reg_is_under_processing;

  /// No description provided for @reg_success.
  ///
  /// In en, this message translates to:
  /// **'Registration\nSuccessfully!'**
  String get reg_success;

  /// No description provided for @successfully_registered_admin.
  ///
  /// In en, this message translates to:
  /// **'You are successfully registered as Admin User'**
  String get successfully_registered_admin;

  /// No description provided for @go_home.
  ///
  /// In en, this message translates to:
  /// **'Go Home'**
  String get go_home;

  /// No description provided for @reg_failed.
  ///
  /// In en, this message translates to:
  /// **'Oops!!\nRegistration Failed!'**
  String get reg_failed;

  /// No description provided for @try_again.
  ///
  /// In en, this message translates to:
  /// **'Try Again !'**
  String get try_again;

  /// No description provided for @forgot_password_description.
  ///
  /// In en, this message translates to:
  /// **'Enter the email associated with your account and we\nwill send an email to reset your password.'**
  String get forgot_password_description;

  /// No description provided for @email_address.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get email_address;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @mail_sent.
  ///
  /// In en, this message translates to:
  /// **'Mail Sent'**
  String get mail_sent;

  /// No description provided for @sent_mail_to.
  ///
  /// In en, this message translates to:
  /// **'We have sent a password recovery instructions\nto'**
  String get sent_mail_to;

  /// No description provided for @kindly_verify.
  ///
  /// In en, this message translates to:
  /// **'. Kindly verify!'**
  String get kindly_verify;

  /// No description provided for @log_out.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get log_out;

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'Hello '**
  String get hello;

  /// No description provided for @verify_num_text.
  ///
  /// In en, this message translates to:
  /// **'! you\'re almost ready to start enjoying MPOS Beat. Simply click the button below to verify your mobile number.'**
  String get verify_num_text;

  /// No description provided for @kindly_login.
  ///
  /// In en, this message translates to:
  /// **' your account details are already registered in our database. Kindly Login to continue!'**
  String get kindly_login;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
