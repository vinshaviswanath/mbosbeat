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
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

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

  /// No description provided for @onboard_skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onboard_skip;

  /// No description provided for @onboard_get_started.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get onboard_get_started;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @login_welcome_back.
  ///
  /// In en, this message translates to:
  /// **'Welcome back,\nyou\'ve been missed!'**
  String get login_welcome_back;

  /// No description provided for @login_email_or_phone.
  ///
  /// In en, this message translates to:
  /// **'Email ID / Mobile Number'**
  String get login_email_or_phone;

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

  /// No description provided for @login_forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get login_forgot_password;

  /// No description provided for @login_no_account.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get login_no_account;

  /// No description provided for @sign_up.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get sign_up;

  /// No description provided for @sign_up_company_name.
  ///
  /// In en, this message translates to:
  /// **'Company Name'**
  String get sign_up_company_name;

  /// No description provided for @sign_up_enter_company_name.
  ///
  /// In en, this message translates to:
  /// **'Enter Company Name'**
  String get sign_up_enter_company_name;

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

  /// No description provided for @registration_dialogs_already_registered.
  ///
  /// In en, this message translates to:
  /// **'You\'re Already Registered !'**
  String get registration_dialogs_already_registered;

  /// No description provided for @sign_up_verify_number.
  ///
  /// In en, this message translates to:
  /// **'Verify your mobile number'**
  String get sign_up_verify_number;

  /// No description provided for @admin_home_manage_user.
  ///
  /// In en, this message translates to:
  /// **'Manage User'**
  String get admin_home_manage_user;

  /// No description provided for @admin_home_manage_company.
  ///
  /// In en, this message translates to:
  /// **'Manage Company'**
  String get admin_home_manage_company;

  /// No description provided for @otp_auth_enter_otp_here.
  ///
  /// In en, this message translates to:
  /// **'Enter OTP here'**
  String get otp_auth_enter_otp_here;

  /// No description provided for @otp_auth_sent_4_digit.
  ///
  /// In en, this message translates to:
  /// **'We have sent a 4 digit code to your\n'**
  String get otp_auth_sent_4_digit;

  /// No description provided for @otp_auth_mob_number.
  ///
  /// In en, this message translates to:
  /// **'mobile number.'**
  String get otp_auth_mob_number;

  /// No description provided for @otp_auth_enter_otp_0.
  ///
  /// In en, this message translates to:
  /// **'Enter OTP in 00:00 Seconds'**
  String get otp_auth_enter_otp_0;

  /// No description provided for @otp_auth_enter_otp_in.
  ///
  /// In en, this message translates to:
  /// **'Enter OTP in'**
  String get otp_auth_enter_otp_in;

  /// No description provided for @otp_auth_seconds.
  ///
  /// In en, this message translates to:
  /// **'Seconds'**
  String get otp_auth_seconds;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @otp_auth_resend_otp.
  ///
  /// In en, this message translates to:
  /// **'Resend OTP'**
  String get otp_auth_resend_otp;

  /// No description provided for @loading_screen_please_wait.
  ///
  /// In en, this message translates to:
  /// **'Please Wait!'**
  String get loading_screen_please_wait;

  /// No description provided for @loading_screen_reg_is_under_processing.
  ///
  /// In en, this message translates to:
  /// **'Registration is under processing.'**
  String get loading_screen_reg_is_under_processing;

  /// No description provided for @reg_success_widget_reg_success.
  ///
  /// In en, this message translates to:
  /// **'Registration\nSuccessfully!'**
  String get reg_success_widget_reg_success;

  /// No description provided for @reg_success_widget_successfully_registered_admin.
  ///
  /// In en, this message translates to:
  /// **'You are successfully registered as Admin User'**
  String get reg_success_widget_successfully_registered_admin;

  /// No description provided for @custom_route_screen_go_home.
  ///
  /// In en, this message translates to:
  /// **'Go Home'**
  String get custom_route_screen_go_home;

  /// No description provided for @custom_route_screen_create_company.
  ///
  /// In en, this message translates to:
  /// **'Create Company'**
  String get custom_route_screen_create_company;

  /// No description provided for @reg_failure_widget_reg_failed.
  ///
  /// In en, this message translates to:
  /// **'Oops!!\nRegistration Failed!'**
  String get reg_failure_widget_reg_failed;

  /// No description provided for @reg_failure_widget_try_again.
  ///
  /// In en, this message translates to:
  /// **'Try Again !'**
  String get reg_failure_widget_try_again;

  /// No description provided for @forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgot_password;

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

  /// No description provided for @verify_number.
  ///
  /// In en, this message translates to:
  /// **'Verify your mobile number'**
  String get verify_number;

  /// No description provided for @kindly_login.
  ///
  /// In en, this message translates to:
  /// **' your account details are already registered in our database. Kindly Login to continue!'**
  String get kindly_login;

  /// No description provided for @customer_transactions_screen_title.
  ///
  /// In en, this message translates to:
  /// **'Customer Transactions'**
  String get customer_transactions_screen_title;

  /// No description provided for @customer_transactions_screen_search_customer.
  ///
  /// In en, this message translates to:
  /// **'Search Customer'**
  String get customer_transactions_screen_search_customer;

  /// No description provided for @customer_transaction_detail_check_in_out.
  ///
  /// In en, this message translates to:
  /// **'Check IN-OUT'**
  String get customer_transaction_detail_check_in_out;

  /// No description provided for @customer_transaction_detail_ContactPerson.
  ///
  /// In en, this message translates to:
  /// **'Contact Person'**
  String get customer_transaction_detail_ContactPerson;

  /// No description provided for @customer_transaction_detail_Mobile.
  ///
  /// In en, this message translates to:
  /// **'Mobile'**
  String get customer_transaction_detail_Mobile;

  /// No description provided for @customer_transaction_detail_GSTno.
  ///
  /// In en, this message translates to:
  /// **'GST No. '**
  String get customer_transaction_detail_GSTno;

  /// No description provided for @customer_transaction_detail_Address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get customer_transaction_detail_Address;

  /// No description provided for @customer_transaction_detail_Balance.
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get customer_transaction_detail_Balance;

  /// No description provided for @customer_transaction_detail_Signal.
  ///
  /// In en, this message translates to:
  /// **'Signal Strength '**
  String get customer_transaction_detail_Signal;

  /// No description provided for @customer_transaction_detail_CheckIn.
  ///
  /// In en, this message translates to:
  /// **'Check In'**
  String get customer_transaction_detail_CheckIn;

  /// No description provided for @customer_transaction_detail_CheckOut.
  ///
  /// In en, this message translates to:
  /// **'Check Out'**
  String get customer_transaction_detail_CheckOut;

  /// No description provided for @customer_transaction_detail_Skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get customer_transaction_detail_Skip;

  /// No description provided for @customer_transaction_detail_ModuleSummary.
  ///
  /// In en, this message translates to:
  /// **'Module Summary'**
  String get customer_transaction_detail_ModuleSummary;

  /// No description provided for @customer_transaction_detail_outstanding_tab_sl_no.
  ///
  /// In en, this message translates to:
  /// **'Sl No.'**
  String get customer_transaction_detail_outstanding_tab_sl_no;

  /// No description provided for @customer_transaction_detail_outstanding_tab_bill_no.
  ///
  /// In en, this message translates to:
  /// **'Bill No.'**
  String get customer_transaction_detail_outstanding_tab_bill_no;

  /// No description provided for @customer_transaction_detail_outstanding_tab_date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get customer_transaction_detail_outstanding_tab_date;

  /// No description provided for @customer_transaction_detail_outstanding_tab_due_date.
  ///
  /// In en, this message translates to:
  /// **'Due Date'**
  String get customer_transaction_detail_outstanding_tab_due_date;

  /// No description provided for @customer_transaction_detail_outstanding_tab_amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get customer_transaction_detail_outstanding_tab_amount;

  /// No description provided for @customer_transaction_detail_outstanding_total.
  ///
  /// In en, this message translates to:
  /// **'Total:'**
  String get customer_transaction_detail_outstanding_total;

  /// No description provided for @customer_transaction_detail_outstanding_on_account.
  ///
  /// In en, this message translates to:
  /// **'On Account:'**
  String get customer_transaction_detail_outstanding_on_account;

  /// No description provided for @customer_transaction_detail_outstanding_grand_total.
  ///
  /// In en, this message translates to:
  /// **'Grand Total:'**
  String get customer_transaction_detail_outstanding_grand_total;

  /// No description provided for @customer_transaction_detail_visit_history_heading.
  ///
  /// In en, this message translates to:
  /// **'Visit History'**
  String get customer_transaction_detail_visit_history_heading;

  /// No description provided for @customer_transaction_detail_visit_history_transaction_no.
  ///
  /// In en, this message translates to:
  /// **'Transaction No.'**
  String get customer_transaction_detail_visit_history_transaction_no;

  /// No description provided for @customer_transaction_detail_visit_history_type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get customer_transaction_detail_visit_history_type;

  /// No description provided for @customer_transaction_detail_skip_dilaog_title.
  ///
  /// In en, this message translates to:
  /// **'Reason for Skip'**
  String get customer_transaction_detail_skip_dilaog_title;

  /// No description provided for @customer_transaction_detail_skip_dilaog_confirm_skip.
  ///
  /// In en, this message translates to:
  /// **'Confirm Skip'**
  String get customer_transaction_detail_skip_dilaog_confirm_skip;

  /// No description provided for @customer_transaction_detail_skip_dilaog_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get customer_transaction_detail_skip_dilaog_cancel;

  /// No description provided for @other_transactions_stockTransfer_Togodown.
  ///
  /// In en, this message translates to:
  /// **'TO GODOWN / VAN'**
  String get other_transactions_stockTransfer_Togodown;

  /// No description provided for @other_transactions_stockTransfer_additem.
  ///
  /// In en, this message translates to:
  /// **'+ Add Item'**
  String get other_transactions_stockTransfer_additem;

  /// No description provided for @other_transactions_stockTransfer_productname.
  ///
  /// In en, this message translates to:
  /// **'Product Name'**
  String get other_transactions_stockTransfer_productname;

  /// No description provided for @other_transactions_stockTransfer_Quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get other_transactions_stockTransfer_Quantity;

  /// No description provided for @other_transactions_stockTransfer_Unit.
  ///
  /// In en, this message translates to:
  /// **'Units'**
  String get other_transactions_stockTransfer_Unit;

  /// No description provided for @other_transactions_stockTransfer_ItemCount.
  ///
  /// In en, this message translates to:
  /// **'Item Count'**
  String get other_transactions_stockTransfer_ItemCount;

  /// No description provided for @other_transactions_stockTransfer_saveButton.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get other_transactions_stockTransfer_saveButton;

  /// No description provided for @other_transactions_stockReceive_view.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get other_transactions_stockReceive_view;

  /// No description provided for @other_transactions_stockReceive_update_button.
  ///
  /// In en, this message translates to:
  /// **'Update Approved Stock'**
  String get other_transactions_stockReceive_update_button;

  /// No description provided for @other_transactions_stockReceive_reject_button.
  ///
  /// In en, this message translates to:
  /// **'Reject Approved Stock'**
  String get other_transactions_stockReceive_reject_button;

  /// No description provided for @other_transactions_stockReceive_Balance_text.
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get other_transactions_stockReceive_Balance_text;

  /// No description provided for @other_transactions_stockReceive_SlNo.
  ///
  /// In en, this message translates to:
  /// **'Sl No'**
  String get other_transactions_stockReceive_SlNo;

  /// No description provided for @other_transactions_stockReceive_vocherNo.
  ///
  /// In en, this message translates to:
  /// **'Voucher No'**
  String get other_transactions_stockReceive_vocherNo;

  /// No description provided for @other_transactions_stockReceive_date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get other_transactions_stockReceive_date;

  /// No description provided for @other_transactions_stockReceive_pricelist_text.
  ///
  /// In en, this message translates to:
  /// **'Price List'**
  String get other_transactions_stockReceive_pricelist_text;

  /// No description provided for @expense_title.
  ///
  /// In en, this message translates to:
  /// **'Petty Expense'**
  String get expense_title;

  /// No description provided for @expense_oustanding.
  ///
  /// In en, this message translates to:
  /// **'Outstanding'**
  String get expense_oustanding;

  /// No description provided for @expense_meter_reading.
  ///
  /// In en, this message translates to:
  /// **'Meter Reading'**
  String get expense_meter_reading;

  /// No description provided for @expense_fuel_quantity.
  ///
  /// In en, this message translates to:
  /// **'Fuel Quantity'**
  String get expense_fuel_quantity;

  /// No description provided for @expense_place.
  ///
  /// In en, this message translates to:
  /// **'Place'**
  String get expense_place;

  /// No description provided for @expense_amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get expense_amount;

  /// No description provided for @expense_remarks.
  ///
  /// In en, this message translates to:
  /// **'Remarks'**
  String get expense_remarks;

  /// No description provided for @expense_saveButton.
  ///
  /// In en, this message translates to:
  /// **'Save Petty Expense'**
  String get expense_saveButton;

  /// No description provided for @expense_cancelButton.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get expense_cancelButton;

  /// No description provided for @transaction_detail_order_booking_title.
  ///
  /// In en, this message translates to:
  /// **'Order Booking'**
  String get transaction_detail_order_booking_title;

  /// No description provided for @transaction_detail_order_booking_rate.
  ///
  /// In en, this message translates to:
  /// **'Rate'**
  String get transaction_detail_order_booking_rate;

  /// No description provided for @transaction_detail_order_booking_discount.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get transaction_detail_order_booking_discount;

  /// No description provided for @transaction_detail_order_booking_sub_total.
  ///
  /// In en, this message translates to:
  /// **'Sub Total'**
  String get transaction_detail_order_booking_sub_total;

  /// No description provided for @transaction_detail_order_booking_add_item_search_product.
  ///
  /// In en, this message translates to:
  /// **'Search Product'**
  String get transaction_detail_order_booking_add_item_search_product;

  /// No description provided for @transaction_detail_order_booking_add_item_select_by_group.
  ///
  /// In en, this message translates to:
  /// **'Select by Group'**
  String get transaction_detail_order_booking_add_item_select_by_group;

  /// No description provided for @transaction_detail_order_booking_add_item_select_by_category.
  ///
  /// In en, this message translates to:
  /// **'Select by Category'**
  String get transaction_detail_order_booking_add_item_select_by_category;

  /// No description provided for @transaction_detail_order_booking_add_item_select_group.
  ///
  /// In en, this message translates to:
  /// **'Select Group'**
  String get transaction_detail_order_booking_add_item_select_group;

  /// No description provided for @transaction_detail_order_booking_add_item_seleable_stock.
  ///
  /// In en, this message translates to:
  /// **'Saleable Stock :'**
  String get transaction_detail_order_booking_add_item_seleable_stock;

  /// No description provided for @transaction_detail_order_booking_add_item_group.
  ///
  /// In en, this message translates to:
  /// **'Group'**
  String get transaction_detail_order_booking_add_item_group;

  /// No description provided for @transaction_detail_order_booking_add_order_qty.
  ///
  /// In en, this message translates to:
  /// **'Order Qty'**
  String get transaction_detail_order_booking_add_order_qty;

  /// No description provided for @mail_sent_screen_sent_mail_to.
  ///
  /// In en, this message translates to:
  /// **'We have sent a password recovery instructions\nto'**
  String get mail_sent_screen_sent_mail_to;

  /// No description provided for @mail_sent_screen_kindly_verify.
  ///
  /// In en, this message translates to:
  /// **'. Kindly verify!'**
  String get mail_sent_screen_kindly_verify;

  /// No description provided for @admin_home_log_out.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get admin_home_log_out;

  /// No description provided for @registration_dialogs_hello.
  ///
  /// In en, this message translates to:
  /// **'Hello '**
  String get registration_dialogs_hello;

  /// No description provided for @registration_dialogs_verify_num_text.
  ///
  /// In en, this message translates to:
  /// **'! you\'re almost ready to start enjoying MPOS Beat. Simply click the button below to verify your mobile number.'**
  String get registration_dialogs_verify_num_text;

  /// No description provided for @registration_dialogs_verify_number.
  ///
  /// In en, this message translates to:
  /// **'Verify your mobile number'**
  String get registration_dialogs_verify_number;

  /// No description provided for @registration_dialogs_kindly_login.
  ///
  /// In en, this message translates to:
  /// **' your account details are already registered in our database. Kindly Login to continue!'**
  String get registration_dialogs_kindly_login;

  /// No description provided for @user_management_user.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get user_management_user;

  /// No description provided for @user_management_user_designation.
  ///
  /// In en, this message translates to:
  /// **'User Designation'**
  String get user_management_user_designation;

  /// No description provided for @user_settings_screen_user_settings.
  ///
  /// In en, this message translates to:
  /// **'User Settings'**
  String get user_settings_screen_user_settings;

  /// No description provided for @user_settings_screen_sales.
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get user_settings_screen_sales;

  /// No description provided for @user_settings_screen_description.
  ///
  /// In en, this message translates to:
  /// **'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean congueso dales ante, vel tristique felis pharetra nec. Sed ullamcorper gravida urnsem per neqeuismod, Nam maximus dui vel blandit convallis. Cras sceleris quee nim sit amet nunc posuere, rhoncus eros lacinia.'**
  String get user_settings_screen_description;

  /// No description provided for @user_settings_screen_sales_return.
  ///
  /// In en, this message translates to:
  /// **'Sales Return'**
  String get user_settings_screen_sales_return;

  /// No description provided for @user_settings_screen_payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get user_settings_screen_payment;

  /// No description provided for @user_settings_screen_edit_rate.
  ///
  /// In en, this message translates to:
  /// **'Edit Rate'**
  String get user_settings_screen_edit_rate;

  /// No description provided for @user_settings_screen_block_zero_rate_item.
  ///
  /// In en, this message translates to:
  /// **'Block Zero rate item'**
  String get user_settings_screen_block_zero_rate_item;

  /// No description provided for @user_settings_screen_company_switching.
  ///
  /// In en, this message translates to:
  /// **'Company Switching'**
  String get user_settings_screen_company_switching;

  /// No description provided for @user_settings_screen_edit_transaction.
  ///
  /// In en, this message translates to:
  /// **'Edit Transaction'**
  String get user_settings_screen_edit_transaction;

  /// No description provided for @user_settings_screen_sales_order.
  ///
  /// In en, this message translates to:
  /// **'Sales Order'**
  String get user_settings_screen_sales_order;

  /// No description provided for @user_settings_screen_receipt.
  ///
  /// In en, this message translates to:
  /// **'Receipt'**
  String get user_settings_screen_receipt;

  /// No description provided for @user_settings_screen_stock_transfer.
  ///
  /// In en, this message translates to:
  /// **'Stock Transfer'**
  String get user_settings_screen_stock_transfer;

  /// No description provided for @user_settings_screen_edit_discount.
  ///
  /// In en, this message translates to:
  /// **'Edit Discount'**
  String get user_settings_screen_edit_discount;

  /// No description provided for @user_settings_screen_party_creation.
  ///
  /// In en, this message translates to:
  /// **'Party Creation'**
  String get user_settings_screen_party_creation;

  /// No description provided for @user_settings_screen_change_price_list.
  ///
  /// In en, this message translates to:
  /// **'Change Price List'**
  String get user_settings_screen_change_price_list;

  /// No description provided for @user_settings_screen_change_voucher_date.
  ///
  /// In en, this message translates to:
  /// **'Change Voucher Date'**
  String get user_settings_screen_change_voucher_date;

  /// No description provided for @user_settings_screen_edit_party_details.
  ///
  /// In en, this message translates to:
  /// **'Edit Party Details'**
  String get user_settings_screen_edit_party_details;

  /// No description provided for @block_user_widget_block_user.
  ///
  /// In en, this message translates to:
  /// **'Block User'**
  String get block_user_widget_block_user;

  /// No description provided for @block_user_widget_are_you_sure.
  ///
  /// In en, this message translates to:
  /// **'Are you sure want to block this User?'**
  String get block_user_widget_are_you_sure;

  /// No description provided for @block_user_widget_you_have_blocked.
  ///
  /// In en, this message translates to:
  /// **'You have blocked this user.'**
  String get block_user_widget_you_have_blocked;

  /// No description provided for @block_user_widget_block.
  ///
  /// In en, this message translates to:
  /// **'Block'**
  String get block_user_widget_block;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @no_user_widget_no_user.
  ///
  /// In en, this message translates to:
  /// **'No user listing found! Kindly create one.'**
  String get no_user_widget_no_user;

  /// No description provided for @no_user_widget_no_user_found.
  ///
  /// In en, this message translates to:
  /// **'No user listing found!\n'**
  String get no_user_widget_no_user_found;

  /// No description provided for @no_user_widget_kindly_create_one.
  ///
  /// In en, this message translates to:
  /// **'Kindly create one.'**
  String get no_user_widget_kindly_create_one;

  /// No description provided for @no_user_widget_add_user.
  ///
  /// In en, this message translates to:
  /// **'Add User'**
  String get no_user_widget_add_user;

  /// No description provided for @unblock_user_widget_unblock_user.
  ///
  /// In en, this message translates to:
  /// **'Unblock User'**
  String get unblock_user_widget_unblock_user;

  /// No description provided for @unblock_user_widget_are_you_sure.
  ///
  /// In en, this message translates to:
  /// **'Are you sure want to unblock this User?'**
  String get unblock_user_widget_are_you_sure;

  /// No description provided for @unblock_user_widget_unblocked_this_user.
  ///
  /// In en, this message translates to:
  /// **'You have unblocked this user.'**
  String get unblock_user_widget_unblocked_this_user;

  /// No description provided for @unblock_user_widget_unblock.
  ///
  /// In en, this message translates to:
  /// **'Unblock'**
  String get unblock_user_widget_unblock;

  /// No description provided for @manage_user_screen_manage_user.
  ///
  /// In en, this message translates to:
  /// **'Manage Users'**
  String get manage_user_screen_manage_user;

  /// No description provided for @manage_user_screen_search_user.
  ///
  /// In en, this message translates to:
  /// **'Search User'**
  String get manage_user_screen_search_user;

  /// No description provided for @manage_user_screen_edit_user.
  ///
  /// In en, this message translates to:
  /// **'Edit User'**
  String get manage_user_screen_edit_user;

  /// No description provided for @manage_user_screen_reset_password.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get manage_user_screen_reset_password;

  /// No description provided for @manage_user_screen_block_user.
  ///
  /// In en, this message translates to:
  /// **'Block User'**
  String get manage_user_screen_block_user;

  /// No description provided for @manage_user_screen_user_settings.
  ///
  /// In en, this message translates to:
  /// **'User Settings'**
  String get manage_user_screen_user_settings;

  /// No description provided for @manage_user_screen_add_company.
  ///
  /// In en, this message translates to:
  /// **'Add Company'**
  String get manage_user_screen_add_company;

  /// No description provided for @activate_user_designation_widget_activate_user.
  ///
  /// In en, this message translates to:
  /// **'Activate User'**
  String get activate_user_designation_widget_activate_user;

  /// No description provided for @activate_user_designation_widget_are_you_sure.
  ///
  /// In en, this message translates to:
  /// **'Are you sure want to activate '**
  String get activate_user_designation_widget_are_you_sure;

  /// No description provided for @activate_user_designation_widget_user_activated.
  ///
  /// In en, this message translates to:
  /// **'The user have been Activated successfully!'**
  String get activate_user_designation_widget_user_activated;

  /// No description provided for @activate_user_designation_widget_activate.
  ///
  /// In en, this message translates to:
  /// **'Activate'**
  String get activate_user_designation_widget_activate;

  /// No description provided for @deactivate_user_designation_widget_deactivate_designation.
  ///
  /// In en, this message translates to:
  /// **'Deactivate Designation'**
  String get deactivate_user_designation_widget_deactivate_designation;

  /// No description provided for @deactivate_user_designation_widget_are_you_sure.
  ///
  /// In en, this message translates to:
  /// **'Are you sure want to deactivate '**
  String get deactivate_user_designation_widget_are_you_sure;

  /// No description provided for @deactivate_user_designation_widget_user_deactivated.
  ///
  /// In en, this message translates to:
  /// **'The user have been deactivated successfully!'**
  String get deactivate_user_designation_widget_user_deactivated;

  /// No description provided for @deactivate_user_designation_widget_deactivate.
  ///
  /// In en, this message translates to:
  /// **'Deactivate'**
  String get deactivate_user_designation_widget_deactivate;

  /// No description provided for @delete_user_designation_widget_delete_designation.
  ///
  /// In en, this message translates to:
  /// **'Delete Designation'**
  String get delete_user_designation_widget_delete_designation;

  /// No description provided for @delete_user_designation_widget_are_you_sure.
  ///
  /// In en, this message translates to:
  /// **'Are you sure want to delete '**
  String get delete_user_designation_widget_are_you_sure;

  /// No description provided for @delete_user_designation_widget_designation_removed.
  ///
  /// In en, this message translates to:
  /// **'The user have been removed successfully.'**
  String get delete_user_designation_widget_designation_removed;

  /// No description provided for @delete_user_designation_widget_delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete_user_designation_widget_delete;

  /// No description provided for @user_designation_screen_all_designation.
  ///
  /// In en, this message translates to:
  /// **'All Designations'**
  String get user_designation_screen_all_designation;

  /// No description provided for @user_designation_screen_no_designation_added.
  ///
  /// In en, this message translates to:
  /// **'No designations added yet'**
  String get user_designation_screen_no_designation_added;

  /// No description provided for @user_designation_screen_edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get user_designation_screen_edit;

  /// No description provided for @user_designation_screen_delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get user_designation_screen_delete;

  /// No description provided for @user_designation_screen_deactivate.
  ///
  /// In en, this message translates to:
  /// **'Deactivate'**
  String get user_designation_screen_deactivate;

  /// No description provided for @user_creation_screen_user_creation.
  ///
  /// In en, this message translates to:
  /// **'User Creation'**
  String get user_creation_screen_user_creation;

  /// No description provided for @user_creation_screen_name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get user_creation_screen_name;

  /// No description provided for @user_creation_screen_enter_name.
  ///
  /// In en, this message translates to:
  /// **'Enter Name'**
  String get user_creation_screen_enter_name;

  /// No description provided for @user_creation_screen_whatsapp_number.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp Number'**
  String get user_creation_screen_whatsapp_number;

  /// No description provided for @user_creation_screen_enter_whatsapp_number.
  ///
  /// In en, this message translates to:
  /// **'Enter WhatsApp Number'**
  String get user_creation_screen_enter_whatsapp_number;

  /// No description provided for @user_creation_screen_designation.
  ///
  /// In en, this message translates to:
  /// **'Designation'**
  String get user_creation_screen_designation;

  /// No description provided for @user_creation_screen_select_designation.
  ///
  /// In en, this message translates to:
  /// **'Select Designation'**
  String get user_creation_screen_select_designation;

  /// No description provided for @user_creation_screen_reporting_to.
  ///
  /// In en, this message translates to:
  /// **'Reporting to'**
  String get user_creation_screen_reporting_to;

  /// No description provided for @user_creation_screen_choose_reporting_person.
  ///
  /// In en, this message translates to:
  /// **'Choose Reporting person'**
  String get user_creation_screen_choose_reporting_person;

  /// No description provided for @help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @transaction_order_booking_screen_order_booking.
  ///
  /// In en, this message translates to:
  /// **'Order Booking'**
  String get transaction_order_booking_screen_order_booking;

  /// No description provided for @transaction_payment_screen_payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get transaction_payment_screen_payment;

  /// No description provided for @transaction_payment_screen_outstanding.
  ///
  /// In en, this message translates to:
  /// **'Outstanding'**
  String get transaction_payment_screen_outstanding;

  /// No description provided for @transaction_payment_screen_payment_entry.
  ///
  /// In en, this message translates to:
  /// **'Payment Entry'**
  String get transaction_payment_screen_payment_entry;

  /// No description provided for @transaction_payment_screen_payment_no.
  ///
  /// In en, this message translates to:
  /// **'Payment No. :'**
  String get transaction_payment_screen_payment_no;

  /// No description provided for @transaction_payment_screen_amount.
  ///
  /// In en, this message translates to:
  /// **'Amount :'**
  String get transaction_payment_screen_amount;

  /// No description provided for @transaction_payment_screen_r_mode.
  ///
  /// In en, this message translates to:
  /// **'R Mode : '**
  String get transaction_payment_screen_r_mode;

  /// No description provided for @transaction_payment_screen_account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get transaction_payment_screen_account;

  /// No description provided for @transaction_payment_screen_cheque_no.
  ///
  /// In en, this message translates to:
  /// **'Cheque Number :'**
  String get transaction_payment_screen_cheque_no;

  /// No description provided for @transaction_payment_screen_cheque_date.
  ///
  /// In en, this message translates to:
  /// **'Cheque Date :'**
  String get transaction_payment_screen_cheque_date;

  /// No description provided for @transaction_payment_screen_bank_name.
  ///
  /// In en, this message translates to:
  /// **'Bank Name :'**
  String get transaction_payment_screen_bank_name;

  /// No description provided for @transaction_payment_screen_branch_name.
  ///
  /// In en, this message translates to:
  /// **'Branch Name :'**
  String get transaction_payment_screen_branch_name;

  /// No description provided for @transaction_payment_screen_narration.
  ///
  /// In en, this message translates to:
  /// **'Narration :'**
  String get transaction_payment_screen_narration;

  /// No description provided for @transaction_payment_screen_add_bills.
  ///
  /// In en, this message translates to:
  /// **'+ Add Bills'**
  String get transaction_payment_screen_add_bills;

  /// No description provided for @transaction_payment_screen_advance.
  ///
  /// In en, this message translates to:
  /// **'Advance :'**
  String get transaction_payment_screen_advance;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @bill_type.
  ///
  /// In en, this message translates to:
  /// **'Bill Type'**
  String get bill_type;

  /// No description provided for @purchase_screen_purchase.
  ///
  /// In en, this message translates to:
  /// **'Purchase'**
  String get purchase_screen_purchase;

  /// No description provided for @billing_mode.
  ///
  /// In en, this message translates to:
  /// **'Billing Mode : '**
  String get billing_mode;

  /// No description provided for @b2b.
  ///
  /// In en, this message translates to:
  /// **'B2B'**
  String get b2b;

  /// No description provided for @b2c.
  ///
  /// In en, this message translates to:
  /// **'B2C'**
  String get b2c;

  /// No description provided for @product_name.
  ///
  /// In en, this message translates to:
  /// **'Product Name'**
  String get product_name;

  /// No description provided for @qty.
  ///
  /// In en, this message translates to:
  /// **'Qty'**
  String get qty;

  /// No description provided for @rate.
  ///
  /// In en, this message translates to:
  /// **'Rate'**
  String get rate;

  /// No description provided for @disc_percentage.
  ///
  /// In en, this message translates to:
  /// **'Disc. %'**
  String get disc_percentage;

  /// No description provided for @free_qty.
  ///
  /// In en, this message translates to:
  /// **'Free Qty:'**
  String get free_qty;

  /// No description provided for @cgst.
  ///
  /// In en, this message translates to:
  /// **'CGST'**
  String get cgst;

  /// No description provided for @sgst.
  ///
  /// In en, this message translates to:
  /// **'SGST'**
  String get sgst;

  /// No description provided for @grand_total.
  ///
  /// In en, this message translates to:
  /// **'Grand Total'**
  String get grand_total;

  /// No description provided for @discount_add_minus.
  ///
  /// In en, this message translates to:
  /// **'Discount (+/-)'**
  String get discount_add_minus;

  /// No description provided for @remarks.
  ///
  /// In en, this message translates to:
  /// **'Remarks:'**
  String get remarks;

  /// No description provided for @purchase_return_screen_purchase_return.
  ///
  /// In en, this message translates to:
  /// **'Purchase Return'**
  String get purchase_return_screen_purchase_return;

  /// No description provided for @receipt_screen_receipt.
  ///
  /// In en, this message translates to:
  /// **'Receipt'**
  String get receipt_screen_receipt;

  /// No description provided for @receipt_screen_receipt_entry.
  ///
  /// In en, this message translates to:
  /// **'Receipt Entry'**
  String get receipt_screen_receipt_entry;

  /// No description provided for @receipt_screen_receipt_no.
  ///
  /// In en, this message translates to:
  /// **'Receipt No. :'**
  String get receipt_screen_receipt_no;

  /// No description provided for @receipt_screen_Amount.
  ///
  /// In en, this message translates to:
  /// **'Amount :'**
  String get receipt_screen_Amount;

  /// No description provided for @replacement_screen_replacemant.
  ///
  /// In en, this message translates to:
  /// **'Replacement'**
  String get replacement_screen_replacemant;

  /// No description provided for @replacement_screen_inc_rate.
  ///
  /// In en, this message translates to:
  /// **'Incl. Rate'**
  String get replacement_screen_inc_rate;

  /// No description provided for @replacement_screen_return_products.
  ///
  /// In en, this message translates to:
  /// **'Return Products'**
  String get replacement_screen_return_products;

  /// No description provided for @add_item.
  ///
  /// In en, this message translates to:
  /// **'+ Add Item'**
  String get add_item;

  /// No description provided for @replacement_screen_save_replacement.
  ///
  /// In en, this message translates to:
  /// **'Save Replacement'**
  String get replacement_screen_save_replacement;

  /// No description provided for @sales_screen_sales.
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get sales_screen_sales;

  /// No description provided for @sales_screen_coupon_discount.
  ///
  /// In en, this message translates to:
  /// **'Coupon Discount (+/-)'**
  String get sales_screen_coupon_discount;

  /// No description provided for @sales_screen_auto_receipt_req.
  ///
  /// In en, this message translates to:
  /// **'Auto Receipt Required'**
  String get sales_screen_auto_receipt_req;

  /// No description provided for @discount_alert_discount_type.
  ///
  /// In en, this message translates to:
  /// **'Discount Type'**
  String get discount_alert_discount_type;

  /// No description provided for @percentage.
  ///
  /// In en, this message translates to:
  /// **'Percentage'**
  String get percentage;

  /// No description provided for @discount.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get discount;

  /// No description provided for @discount_alert_apply_discount.
  ///
  /// In en, this message translates to:
  /// **'Apply Discount'**
  String get discount_alert_apply_discount;

  /// No description provided for @cash_alert_mode_of_receipt.
  ///
  /// In en, this message translates to:
  /// **'Mode of Receipt :'**
  String get cash_alert_mode_of_receipt;

  /// No description provided for @cash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get cash;

  /// No description provided for @bank.
  ///
  /// In en, this message translates to:
  /// **'Bank'**
  String get bank;

  /// No description provided for @cheque_alert_instrument_no.
  ///
  /// In en, this message translates to:
  /// **'Instrument No.'**
  String get cheque_alert_instrument_no;

  /// No description provided for @cheque_alert_instrument_date.
  ///
  /// In en, this message translates to:
  /// **'Instrument Date'**
  String get cheque_alert_instrument_date;

  /// No description provided for @payment_mode_alert_select_payment_mode.
  ///
  /// In en, this message translates to:
  /// **'Select Payment Mode'**
  String get payment_mode_alert_select_payment_mode;

  /// No description provided for @upi.
  ///
  /// In en, this message translates to:
  /// **'UPI'**
  String get upi;

  /// No description provided for @cheque.
  ///
  /// In en, this message translates to:
  /// **'Cheque'**
  String get cheque;

  /// No description provided for @sales_return_screen_sales_return.
  ///
  /// In en, this message translates to:
  /// **'Sales Return'**
  String get sales_return_screen_sales_return;

  /// No description provided for @cess.
  ///
  /// In en, this message translates to:
  /// **'CESS'**
  String get cess;

  /// No description provided for @telephonic_order_screen_telephonic_order.
  ///
  /// In en, this message translates to:
  /// **'Telephonic Order'**
  String get telephonic_order_screen_telephonic_order;

  /// No description provided for @telephonic_order_screen_order_qty.
  ///
  /// In en, this message translates to:
  /// **'Order Qty'**
  String get telephonic_order_screen_order_qty;

  /// No description provided for @order_booking_voucher_no.
  ///
  /// In en, this message translates to:
  /// **'Voucher No.'**
  String get order_booking_voucher_no;

  /// No description provided for @order_booking_balance.
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get order_booking_balance;

  /// No description provided for @order_booking_price_list.
  ///
  /// In en, this message translates to:
  /// **'Price List'**
  String get order_booking_price_list;

  /// No description provided for @order_booking_quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get order_booking_quantity;

  /// No description provided for @order_booking_sub_total.
  ///
  /// In en, this message translates to:
  /// **'Sub Total'**
  String get order_booking_sub_total;

  /// No description provided for @order_booking_add_item_select_by_group.
  ///
  /// In en, this message translates to:
  /// **'Select by Group'**
  String get order_booking_add_item_select_by_group;

  /// No description provided for @order_booking_add_item_select_group.
  ///
  /// In en, this message translates to:
  /// **'Select Group'**
  String get order_booking_add_item_select_group;

  /// No description provided for @order_booking_add_item_select_by_category.
  ///
  /// In en, this message translates to:
  /// **'Select by Category'**
  String get order_booking_add_item_select_by_category;

  /// No description provided for @order_booking_add_item_select_category.
  ///
  /// In en, this message translates to:
  /// **'Select Category'**
  String get order_booking_add_item_select_category;

  /// No description provided for @stock_card_group.
  ///
  /// In en, this message translates to:
  /// **'Group :'**
  String get stock_card_group;

  /// No description provided for @stock_card_category_name.
  ///
  /// In en, this message translates to:
  /// **'Category Name'**
  String get stock_card_category_name;

  /// No description provided for @stock_card_sealable_stock.
  ///
  /// In en, this message translates to:
  /// **'Saleable Stock :'**
  String get stock_card_sealable_stock;

  /// No description provided for @stock_card_qls.
  ///
  /// In en, this message translates to:
  /// **'Qls'**
  String get stock_card_qls;

  /// No description provided for @stock_card_mrp.
  ///
  /// In en, this message translates to:
  /// **'MRP'**
  String get stock_card_mrp;

  /// No description provided for @stock_card_tax_percentage.
  ///
  /// In en, this message translates to:
  /// **'Tax %'**
  String get stock_card_tax_percentage;

  /// No description provided for @stock_card_inc_rate.
  ///
  /// In en, this message translates to:
  /// **'Incl. Rate'**
  String get stock_card_inc_rate;

  /// No description provided for @order_detail_widget_order_qty.
  ///
  /// In en, this message translates to:
  /// **'Order Qty'**
  String get order_detail_widget_order_qty;

  /// No description provided for @order_detail_widget_nos.
  ///
  /// In en, this message translates to:
  /// **'Nos'**
  String get order_detail_widget_nos;

  /// No description provided for @order_detail_widget_total.
  ///
  /// In en, this message translates to:
  /// **'Total: '**
  String get order_detail_widget_total;

  /// No description provided for @admin_dashboard_home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get admin_dashboard_home;

  /// No description provided for @admin_dashboard_address.
  ///
  /// In en, this message translates to:
  /// **'Address : '**
  String get admin_dashboard_address;

  /// No description provided for @admin_dashboard_summary.
  ///
  /// In en, this message translates to:
  /// **'Sales Summary'**
  String get admin_dashboard_summary;

  /// No description provided for @admin_dashboard_cash_sales.
  ///
  /// In en, this message translates to:
  /// **'Cash Sales'**
  String get admin_dashboard_cash_sales;

  /// No description provided for @admin_dashboard_credit_sales.
  ///
  /// In en, this message translates to:
  /// **'Credit Sales'**
  String get admin_dashboard_credit_sales;

  /// No description provided for @admin_dashboard_total_sites_visits.
  ///
  /// In en, this message translates to:
  /// **'Total Site Visits'**
  String get admin_dashboard_total_sites_visits;

  /// No description provided for @custom_drawer_mob.
  ///
  /// In en, this message translates to:
  /// **'Mob:'**
  String get custom_drawer_mob;

  /// No description provided for @custom_drawer_email.
  ///
  /// In en, this message translates to:
  /// **'Email:'**
  String get custom_drawer_email;

  /// No description provided for @custom_drawer_note.
  ///
  /// In en, this message translates to:
  /// **'You are currently using free version of MPOS app. Kindly upgrade to premium version to get access to settings.'**
  String get custom_drawer_note;

  /// No description provided for @custom_drawer_upgrade_To_premium.
  ///
  /// In en, this message translates to:
  /// **'Upgrade to Premium'**
  String get custom_drawer_upgrade_To_premium;

  /// No description provided for @custom_drawer_complete_company_profile.
  ///
  /// In en, this message translates to:
  /// **'Complete the steps for your company profile'**
  String get custom_drawer_complete_company_profile;

  /// No description provided for @custom_drawer_completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get custom_drawer_completed;

  /// No description provided for @custom_drawer_menu.
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get custom_drawer_menu;

  /// No description provided for @custom_drawer_settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get custom_drawer_settings;

  /// No description provided for @custom_drawer_logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get custom_drawer_logout;

  /// No description provided for @popover_body_godown_wise.
  ///
  /// In en, this message translates to:
  /// **'Godown Wise'**
  String get popover_body_godown_wise;

  /// No description provided for @popover_body_route_wise.
  ///
  /// In en, this message translates to:
  /// **'Route Wise'**
  String get popover_body_route_wise;

  /// No description provided for @company_creation.
  ///
  /// In en, this message translates to:
  /// **'Company Creation'**
  String get company_creation;

  /// No description provided for @company_creation_company_info.
  ///
  /// In en, this message translates to:
  /// **'Company Info'**
  String get company_creation_company_info;

  /// No description provided for @company_creation_voucher_type.
  ///
  /// In en, this message translates to:
  /// **'Voucher Type'**
  String get company_creation_voucher_type;

  /// No description provided for @company_creation_Integrastion_type.
  ///
  /// In en, this message translates to:
  /// **'Integration Type'**
  String get company_creation_Integrastion_type;

  /// No description provided for @company_info_widget_display_name.
  ///
  /// In en, this message translates to:
  /// **'Display Name'**
  String get company_info_widget_display_name;

  /// No description provided for @company_info_widget_enter_display_name.
  ///
  /// In en, this message translates to:
  /// **'Enter display name'**
  String get company_info_widget_enter_display_name;

  /// No description provided for @company_info_widget_address_1.
  ///
  /// In en, this message translates to:
  /// **'Address 1'**
  String get company_info_widget_address_1;

  /// No description provided for @company_info_widget_enter_address.
  ///
  /// In en, this message translates to:
  /// **'Enter address'**
  String get company_info_widget_enter_address;

  /// No description provided for @company_info_widget_address_2.
  ///
  /// In en, this message translates to:
  /// **'Address 2'**
  String get company_info_widget_address_2;

  /// No description provided for @company_info_widget_address_3.
  ///
  /// In en, this message translates to:
  /// **'Address 3'**
  String get company_info_widget_address_3;

  /// No description provided for @company_info_widget_pincode.
  ///
  /// In en, this message translates to:
  /// **'Pincode'**
  String get company_info_widget_pincode;

  /// No description provided for @company_info_widget_enter_pincode.
  ///
  /// In en, this message translates to:
  /// **'Enter Pin code'**
  String get company_info_widget_enter_pincode;

  /// No description provided for @company_info_widget_country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get company_info_widget_country;

  /// No description provided for @company_info_widget_enter_country.
  ///
  /// In en, this message translates to:
  /// **'Enter Country'**
  String get company_info_widget_enter_country;

  /// No description provided for @company_info_widget_state.
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get company_info_widget_state;

  /// No description provided for @company_info_widget_enter_state.
  ///
  /// In en, this message translates to:
  /// **'Enter State'**
  String get company_info_widget_enter_state;

  /// No description provided for @company_info_widget_registration_type.
  ///
  /// In en, this message translates to:
  /// **'Registration Type'**
  String get company_info_widget_registration_type;

  /// No description provided for @company_info_widget_enter_registration_type.
  ///
  /// In en, this message translates to:
  /// **'Enter registration type'**
  String get company_info_widget_enter_registration_type;

  /// No description provided for @company_info_widget_next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get company_info_widget_next;

  /// No description provided for @voucher_type_voucher_type_activation.
  ///
  /// In en, this message translates to:
  /// **'Voucher Type Activation'**
  String get voucher_type_voucher_type_activation;

  /// No description provided for @voucher_type_tile_prefix.
  ///
  /// In en, this message translates to:
  /// **'Prefix: '**
  String get voucher_type_tile_prefix;

  /// No description provided for @voucher_type_tile_sufix.
  ///
  /// In en, this message translates to:
  /// **'Sufix: '**
  String get voucher_type_tile_sufix;

  /// No description provided for @voucher_type_tile_width.
  ///
  /// In en, this message translates to:
  /// **'Width: '**
  String get voucher_type_tile_width;

  /// No description provided for @integration_type_statnd_alone.
  ///
  /// In en, this message translates to:
  /// **'Stand Alone'**
  String get integration_type_statnd_alone;

  /// No description provided for @integration_type_statnd_alone_description.
  ///
  /// In en, this message translates to:
  /// **'Lorem ipsum dolor sitamet, consectetur adipiscing elitrae sem laoret libereou luctus facilisis. Maecen tortorx.'**
  String get integration_type_statnd_alone_description;

  /// No description provided for @integration_type_tally.
  ///
  /// In en, this message translates to:
  /// **'Tally'**
  String get integration_type_tally;

  /// No description provided for @integration_type_mpos_retail.
  ///
  /// In en, this message translates to:
  /// **'MPOS Retail'**
  String get integration_type_mpos_retail;

  /// No description provided for @integration_type_finish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get integration_type_finish;

  /// No description provided for @voucher_card_tally_serial_no.
  ///
  /// In en, this message translates to:
  /// **'Tally Serial No.'**
  String get voucher_card_tally_serial_no;

  /// No description provided for @voucher_card_tally_enter_serial_no.
  ///
  /// In en, this message translates to:
  /// **'Enter Serial Number'**
  String get voucher_card_tally_enter_serial_no;

  /// No description provided for @voucher_card_tally_maintain_stocks.
  ///
  /// In en, this message translates to:
  /// **'Maintain Stock in Cloud'**
  String get voucher_card_tally_maintain_stocks;

  /// No description provided for @voucher_card_tally_help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get voucher_card_tally_help;

  /// No description provided for @voucher_card_activated.
  ///
  /// In en, this message translates to:
  /// **'Activated'**
  String get voucher_card_activated;

  /// No description provided for @voucher_card_activat.
  ///
  /// In en, this message translates to:
  /// **'Activate'**
  String get voucher_card_activat;

  /// No description provided for @voucher_card_yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get voucher_card_yes;

  /// No description provided for @voucher_card_no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get voucher_card_no;

  /// No description provided for @voucher_card_logo_here.
  ///
  /// In en, this message translates to:
  /// **'Logo Here'**
  String get voucher_card_logo_here;

  /// No description provided for @godown_route_voucher_route_name.
  ///
  /// In en, this message translates to:
  /// **'Route Name:'**
  String get godown_route_voucher_route_name;

  /// No description provided for @godown_route_voucher_godown_name.
  ///
  /// In en, this message translates to:
  /// **'Godown Name:'**
  String get godown_route_voucher_godown_name;

  /// No description provided for @godown_route_voucher_enter_route_name.
  ///
  /// In en, this message translates to:
  /// **'Enter Route Name'**
  String get godown_route_voucher_enter_route_name;

  /// No description provided for @godown_route_voucher_enter_godown_name.
  ///
  /// In en, this message translates to:
  /// **'Enter Godown Name'**
  String get godown_route_voucher_enter_godown_name;

  /// No description provided for @godown_route_voucher_series_settings.
  ///
  /// In en, this message translates to:
  /// **'Voucher Series Settings:'**
  String get godown_route_voucher_series_settings;

  /// No description provided for @godown_route_voucher_serires.
  ///
  /// In en, this message translates to:
  /// **'Voucher Series Settings:'**
  String get godown_route_voucher_serires;

  /// No description provided for @godown_wise_screen_vehicle.
  ///
  /// In en, this message translates to:
  /// **'Vehicle'**
  String get godown_wise_screen_vehicle;

  /// No description provided for @godown_wise_screen_no_vehicle.
  ///
  /// In en, this message translates to:
  /// **'No vehicles added yet'**
  String get godown_wise_screen_no_vehicle;

  /// No description provided for @add_vehicle_screen_edit_vehicle.
  ///
  /// In en, this message translates to:
  /// **'Edit Vehicle'**
  String get add_vehicle_screen_edit_vehicle;

  /// No description provided for @add_vehicle_screen_add_vehicle.
  ///
  /// In en, this message translates to:
  /// **'Add Vehicle'**
  String get add_vehicle_screen_add_vehicle;

  /// No description provided for @add_vehicle_screen_vehicle_name.
  ///
  /// In en, this message translates to:
  /// **'Vehicle Name'**
  String get add_vehicle_screen_vehicle_name;

  /// No description provided for @add_vehicle_screen_vehicle_code.
  ///
  /// In en, this message translates to:
  /// **'Vehicle Code'**
  String get add_vehicle_screen_vehicle_code;

  /// No description provided for @add_route_screen_edit_route.
  ///
  /// In en, this message translates to:
  /// **'Edit Route'**
  String get add_route_screen_edit_route;

  /// No description provided for @add_route_screen_add_route.
  ///
  /// In en, this message translates to:
  /// **'Add Route'**
  String get add_route_screen_add_route;

  /// No description provided for @add_route_screen_route_name.
  ///
  /// In en, this message translates to:
  /// **'Route Name'**
  String get add_route_screen_route_name;

  /// No description provided for @add_route_screen_route_code.
  ///
  /// In en, this message translates to:
  /// **'Route Code'**
  String get add_route_screen_route_code;

  /// No description provided for @route_wise_screen_voucher_type_settings.
  ///
  /// In en, this message translates to:
  /// **'Voucher Type Settings'**
  String get route_wise_screen_voucher_type_settings;

  /// No description provided for @activate_vehicle_widget_activate_vehicle.
  ///
  /// In en, this message translates to:
  /// **'Activate Vehicle'**
  String get activate_vehicle_widget_activate_vehicle;

  /// No description provided for @activate_vehicle_widget_are_you_sure.
  ///
  /// In en, this message translates to:
  /// **'Are you sure want to activate vehicle?'**
  String get activate_vehicle_widget_are_you_sure;

  /// No description provided for @activate_vehicle_widget_vehicle_activated.
  ///
  /// In en, this message translates to:
  /// **'The vehicle have been Activated successfully!'**
  String get activate_vehicle_widget_vehicle_activated;

  /// No description provided for @deactivate_vehicle_widget_deactivate_vehicle.
  ///
  /// In en, this message translates to:
  /// **'Deactivate Vehicle'**
  String get deactivate_vehicle_widget_deactivate_vehicle;

  /// No description provided for @deactivate_vehicle_widget_are_you_sure.
  ///
  /// In en, this message translates to:
  /// **'Are you sure want to deactivate Vehicle?'**
  String get deactivate_vehicle_widget_are_you_sure;

  /// No description provided for @deactivate_vehicle_widget_vehicle_deactivated.
  ///
  /// In en, this message translates to:
  /// **'The vehicle have been deactivated successfully!'**
  String get deactivate_vehicle_widget_vehicle_deactivated;

  /// No description provided for @delete_vehicle_widget_delete_vehicle.
  ///
  /// In en, this message translates to:
  /// **'Delete Vehicle'**
  String get delete_vehicle_widget_delete_vehicle;

  /// No description provided for @delete_vehicle_widget_are_you_sure.
  ///
  /// In en, this message translates to:
  /// **'Are you sure want to delete Vehicle?'**
  String get delete_vehicle_widget_are_you_sure;

  /// No description provided for @delete_vehicle_widget_vehicle_removed.
  ///
  /// In en, this message translates to:
  /// **'The vehicle have been removed successfully.'**
  String get delete_vehicle_widget_vehicle_removed;

  /// No description provided for @activate_route_widget_activate_route.
  ///
  /// In en, this message translates to:
  /// **'Activate Route'**
  String get activate_route_widget_activate_route;

  /// No description provided for @activate_route_widget_are_you_sure.
  ///
  /// In en, this message translates to:
  /// **'Are you sure want to activate route?'**
  String get activate_route_widget_are_you_sure;

  /// No description provided for @activate_route_widget_route_activated.
  ///
  /// In en, this message translates to:
  /// **'The route have been Activated successfully!'**
  String get activate_route_widget_route_activated;

  /// No description provided for @deactivate_route_widget_deactivate_route.
  ///
  /// In en, this message translates to:
  /// **'Deactivate Route'**
  String get deactivate_route_widget_deactivate_route;

  /// No description provided for @deactivate_route_widget_are_you_sure.
  ///
  /// In en, this message translates to:
  /// **'Are you sure want to deactivate Route?'**
  String get deactivate_route_widget_are_you_sure;

  /// No description provided for @deactivate_route_widget_route_deactivated.
  ///
  /// In en, this message translates to:
  /// **'The route have been deactivated successfully!'**
  String get deactivate_route_widget_route_deactivated;

  /// No description provided for @delete_route_widget_delete_route.
  ///
  /// In en, this message translates to:
  /// **'Delete Route'**
  String get delete_route_widget_delete_route;

  /// No description provided for @delete_route_widget_are_you_sure.
  ///
  /// In en, this message translates to:
  /// **'Are you sure want to delete Route?'**
  String get delete_route_widget_are_you_sure;

  /// No description provided for @delete_route_widget_route_removed.
  ///
  /// In en, this message translates to:
  /// **'The route have been removed successfully.'**
  String get delete_route_widget_route_removed;

  /// No description provided for @company_settings_screen_title.
  ///
  /// In en, this message translates to:
  /// **'Company Settings'**
  String get company_settings_screen_title;

  /// No description provided for @dashboard_edit_company.
  ///
  /// In en, this message translates to:
  /// **'Edit Company'**
  String get dashboard_edit_company;

  /// No description provided for @dashboard_integration_settings.
  ///
  /// In en, this message translates to:
  /// **'Integration Settings'**
  String get dashboard_integration_settings;

  /// No description provided for @dashboard_company_settings.
  ///
  /// In en, this message translates to:
  /// **'Company Settings'**
  String get dashboard_company_settings;

  /// No description provided for @dashboard_voucher_type.
  ///
  /// In en, this message translates to:
  /// **'Voucher Type'**
  String get dashboard_voucher_type;

  /// No description provided for @dashboard_godown_or_route_wise_voucher.
  ///
  /// In en, this message translates to:
  /// **'Godown / Route Wise Voucher'**
  String get dashboard_godown_or_route_wise_voucher;

  /// No description provided for @dashboard_add_users.
  ///
  /// In en, this message translates to:
  /// **'Add Users'**
  String get dashboard_add_users;

  /// No description provided for @dashboard_master.
  ///
  /// In en, this message translates to:
  /// **'Master'**
  String get dashboard_master;

  /// No description provided for @dashboard_total_sales.
  ///
  /// In en, this message translates to:
  /// **'Total Sales'**
  String get dashboard_total_sales;

  /// No description provided for @dashboard_expense_entry.
  ///
  /// In en, this message translates to:
  /// **'Expense Entry'**
  String get dashboard_expense_entry;

  /// No description provided for @drawer_all_users.
  ///
  /// In en, this message translates to:
  /// **'All Users'**
  String get drawer_all_users;

  /// No description provided for @drawer_user_designation.
  ///
  /// In en, this message translates to:
  /// **'User Designation'**
  String get drawer_user_designation;

  /// No description provided for @drawer_user_management.
  ///
  /// In en, this message translates to:
  /// **'User Management'**
  String get drawer_user_management;

  /// No description provided for @add_company_screen_add_company.
  ///
  /// In en, this message translates to:
  /// **'Add Company'**
  String get add_company_screen_add_company;

  /// No description provided for @add_company_search_company.
  ///
  /// In en, this message translates to:
  /// **'Search Company'**
  String get add_company_search_company;

  /// No description provided for @user_creation_please_select_reporting_person.
  ///
  /// In en, this message translates to:
  /// **'Please select reporting person'**
  String get user_creation_please_select_reporting_person;

  /// No description provided for @user_creation_please_select_designation.
  ///
  /// In en, this message translates to:
  /// **'Please select designation'**
  String get user_creation_please_select_designation;

  /// No description provided for @user_creation_enter_full_name.
  ///
  /// In en, this message translates to:
  /// **'Please enter full name'**
  String get user_creation_enter_full_name;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
