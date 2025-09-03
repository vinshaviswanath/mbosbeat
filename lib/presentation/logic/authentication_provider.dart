import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:go_router/go_router.dart';
import 'package:mpos_beat/core/failures/value_object/value_failure.dart';
import 'package:mpos_beat/core/failures/value_object/value_object.dart';
import 'package:mpos_beat/core/utils/alert_dialog.dart';
import 'package:mpos_beat/core/utils/enums.dart';
import 'package:mpos_beat/core/utils/logger.dart';
import 'package:mpos_beat/data/models/user_model.dart';
import 'package:mpos_beat/domain/entities/local_auth_storage.dart';
import 'package:mpos_beat/presentation/dialogs/registration_dialogs.dart';
import 'package:mpos_beat/route/app_router_const.dart';

/// Provider class that manages authentication-related state and logic.
/// Handles Login, Signup, OTP verification, masked fields, form validation,
/// and state updates for UI using [ChangeNotifier].
class AuthFormProvider with ChangeNotifier {
  //============================================================================
  //                                VARIABLES
  //============================================================================

  /// Login form fields.
  EmailOrPhone _emailOrPhone = EmailOrPhone('');
  Password _password = Password('');

  /// Signup form fields
  CompanyName _companyName = CompanyName('');
  PhoneNumber _phone = PhoneNumber('');
  EmailAddress _email = EmailAddress('');
  ConfirmPassword _confirmPassword = ConfirmPassword('', '');

  /// OTP fields
  String _otp = '';
  String? _otpError;
  int _remainingSeconds = 0;
  Timer? _timer;
  bool _alreadyNavigatedToInvalidOtp = false;

  /// UI state
  bool _isVisible = false;

  /// Form keys & controllers
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  /// Validation modes for different fields
  AutovalidateMode _emailOrPhoneValidationMode = AutovalidateMode.disabled;
  AutovalidateMode _passwordValidationMode = AutovalidateMode.disabled;
  AutovalidateMode _companyValidationMode = AutovalidateMode.disabled;
  AutovalidateMode _phoneValidationMode = AutovalidateMode.disabled;
  AutovalidateMode _emailValidationMode = AutovalidateMode.disabled;
  AutovalidateMode _confirmPasswordValidationMode = AutovalidateMode.disabled;

  //============================================================================
  //                              GETTERS
  //============================================================================

  EmailOrPhone get emailOrPhone => _emailOrPhone;
  Password get password => _password;
  CompanyName get companyName => _companyName;
  PhoneNumber get phone => _phone;
  EmailAddress get email => _email;
  ConfirmPassword get confirmPassword => _confirmPassword;

  ValueFailure? get emailOrPhoneFailure => _emailOrPhone.getFailure;
  ValueFailure? get passwordFailure => _password.getFailure;
  ValueFailure? get companyFailure => _companyName.getFailure;
  ValueFailure? get phoneFailure => _phone.getFailure;
  ValueFailure? get emailFailure => _email.getFailure;
  ValueFailure? get confirmPasswordFailure => _confirmPassword.getFailure;

  bool get isVisible => _isVisible;

  AutovalidateMode get emailOrPhoneValidationMode =>
      _emailOrPhoneValidationMode;
  AutovalidateMode get passwordValidationMode => _passwordValidationMode;
  AutovalidateMode get companyValidationMode => _companyValidationMode;
  AutovalidateMode get phoneValidationMode => _phoneValidationMode;
  AutovalidateMode get emailValidationMode => _emailValidationMode;
  AutovalidateMode get confirmPasswordValidationMode =>
      _confirmPasswordValidationMode;

  //============================================================================
  //                              SETTERS
  //============================================================================

  void updateEmailOrPhone(String input) {
    _emailOrPhone = EmailOrPhone(input);
    _emailOrPhoneValidationMode =
        input.isNotEmpty ? AutovalidateMode.always : AutovalidateMode.disabled;
    notifyListeners();
  }

  void updatePassword(String input) {
    _password = Password(input);
    _passwordValidationMode =
        input.isNotEmpty ? AutovalidateMode.always : AutovalidateMode.disabled;

    _confirmPassword = ConfirmPassword(
        _confirmPassword.getValue ?? '', _password.getValue ?? '');
    notifyListeners();
  }

  void updateConfirmPassword(String input) {
    _confirmPassword = ConfirmPassword(input, _password.getValue ?? '');
    _confirmPasswordValidationMode =
        input.isNotEmpty ? AutovalidateMode.always : AutovalidateMode.disabled;
    notifyListeners();
  }

  void updateCompanyName(String input) {
    _companyName = CompanyName(input);
    _companyValidationMode =
        input.isNotEmpty ? AutovalidateMode.always : AutovalidateMode.disabled;
    notifyListeners();
  }

  void updatePhone(String input) {
    _phone = PhoneNumber(input);
    _phoneValidationMode =
        input.isNotEmpty ? AutovalidateMode.always : AutovalidateMode.disabled;
    notifyListeners();
  }

  void updateEmail(String input) {
    _email = EmailAddress(input);
    _emailValidationMode =
        input.isNotEmpty ? AutovalidateMode.always : AutovalidateMode.disabled;
    notifyListeners();
  }

  //============================================================================
  //                              MASKED FIELDS
  //============================================================================

  /// Returns a masked version of the phone number, keeping only the last 4 digits.
  String get maskedPhone {
    final value = _phone.getValue;
    if (value == null || value.isEmpty) return "";
    if (value.length < 4) return value;

    final last4 = value.substring(value.length - 4);
    return "******$last4";
  }

  /// Returns a masked version of the email.
  /// Example: `j***@g***.com`
  String get maskedEmail {
    final value = emailController.text.trim();
    if (value.isEmpty) return "";

    final parts = value.split('@');
    if (parts.length != 2) return value;

    final username = parts[0];
    final domainFull = parts[1];
    final domainParts = domainFull.split('.');

    if (domainParts.isEmpty) return value;

    final domainName = domainParts.first;
    final domainExtension =
        domainParts.length > 1 ? ".${domainParts.sublist(1).join(".")}" : "";

    final maskedUsername =
        username.isNotEmpty ? username[0] + "*" * (username.length - 1) : "";
    final maskedDomain = domainName.isNotEmpty
        ? domainName[0] + "*" * (domainName.length - 1)
        : "";

    return "$maskedUsername@$maskedDomain$domainExtension";
  }

  //============================================================================
  //                           EMAIL VALIDATION
  //============================================================================

  /// Validates email input.
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return "Enter a valid email";
    }
    return null;
  }

  /// Submits email form and navigates to mailed screen.
  void submitEmail(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.pushNamed(AppRouterConst.mailedScreen);
    }
  }

  //============================================================================
  //                           OTP MANAGEMENT
  //============================================================================

  /// Remaining OTP time in seconds.
  int get remainingSeconds => _remainingSeconds;

  /// Current OTP value.
  String get otp => _otp;

  /// Current OTP error message.
  String? get otpError => _otpError;

  /// Formats remaining OTP time into `MM:SS`.
  String formatTime() {
    final minutes = (remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final secs = (remainingSeconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }

  /// Updates OTP value and clears error.
  void updateOtp(String value) {
    _otp = value;
    _otpError = null;
    notifyListeners();
  }

  /// Resets invalid OTP flag and timer.
  void resetInvalidOtpFlag(bool value) {
    _alreadyNavigatedToInvalidOtp = value;
    resetOtpTimer();
    _otpError = null;
  }

  /// Submits OTP verification process.
  Future<void> submitOtp(BuildContext context, LocalUser user) async {
    if (_remainingSeconds == 0) {
      _otpError = "OTP has expired. Please request a new one.";
      notifyListeners();
      CustomAlertDialog.showCustomDialog(
        title: _otpError!,
        typeAlert: TypeAlert.error,
      );
      return;
    }

    if (_otp == "1111") {
      _otpError = null;
      _alreadyNavigatedToInvalidOtp = false;

      final verifiedUser = user.copyWith(isOtpVerified: true);
      await UserStorage.updateUser(verifiedUser);

      resetSignUpForm();
      resetLoginForm();

      final users = await UserStorage.getUsers();
      for (var u in users) {
        Logger.logSuccess("User :: ${u.toJson()}");
      }

      notifyListeners();

      context.pushNamed(AppRouterConst.customRouteScreen,
          extra: NavigationType.success);

      CustomAlertDialog.showCustomDialog(
        title: "OTP Verified Successfully",
        typeAlert: TypeAlert.success,
      );
    } else {
      _otpError = "Please enter valid OTP";
      if (!_alreadyNavigatedToInvalidOtp && _otp.isNotEmpty) {
        _alreadyNavigatedToInvalidOtp = true;
        resetOtpTimer();
        context.pushNamed(AppRouterConst.invalidOtp, extra: user);
      } else {
        CustomAlertDialog.showCustomDialog(
          title: _otpError!,
          typeAlert: TypeAlert.error,
        );
      }
      notifyListeners();
    }
  }

  /// Starts OTP countdown timer.
  void startOtpTimer() {
    _remainingSeconds = 60;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        _remainingSeconds--;
        notifyListeners();
      } else {
        _timer?.cancel();
      }
    });
  }

  /// Resets OTP timer.
  void resetOtpTimer() {
    _timer?.cancel();
    _remainingSeconds = 0;
    notifyListeners();
  }

  //============================================================================
  //                           LOGIN & SIGNUP
  //============================================================================

  /// Validates login form fields.
  bool validateLoginForm() {
    return _emailOrPhone.isValid() && _password.isValid();
  }

  /// Validates signup form fields.
  bool validateSignUpForm() {
    return _companyName.isValid() &&
        _phone.isValid() &&
        _email.isValid() &&
        _password.isValid() &&
        _confirmPassword.isValid();
  }

  /// Resets login form state.
  void resetLoginForm() {
    _emailOrPhone = EmailOrPhone('');
    _password = Password('');
    _emailOrPhoneValidationMode = AutovalidateMode.disabled;
    _passwordValidationMode = AutovalidateMode.disabled;
    notifyListeners();
  }

  /// Resets signup form state.
  void resetSignUpForm() {
    _companyName = CompanyName('');
    _phone = PhoneNumber('');
    _email = EmailAddress('');
    _confirmPassword = ConfirmPassword('', '');
    _password = Password('');
    _companyValidationMode = AutovalidateMode.disabled;
    _phoneValidationMode = AutovalidateMode.disabled;
    _emailValidationMode = AutovalidateMode.disabled;
    _confirmPasswordValidationMode = AutovalidateMode.disabled;
    _passwordValidationMode = AutovalidateMode.disabled;
    notifyListeners();
  }

  /// Handles login submission and navigation.
  Future<void> submitLogin(BuildContext context) async {
    final isValid = validateLoginForm();

    if (!isValid) {
      _emailOrPhoneValidationMode = AutovalidateMode.always;
      _passwordValidationMode = AutovalidateMode.always;
      notifyListeners();
      return;
    }

    final users = await UserStorage.getUsers();
    LocalUser? enteredUser;

    for (final u in users) {
      if ((u.phone == _emailOrPhone.getValue?.trim() ||
              u.email == _emailOrPhone.getValue?.trim()) &&
          u.password == _password.getValue?.trim()) {
        enteredUser = u;
        break;
      }
    }

    if (enteredUser == null) {
      CustomAlertDialog.showCustomDialog(
        title: "User not found!",
        typeAlert: TypeAlert.error,
      );
      return;
    }

    if (enteredUser.isOtpVerified == true) {
      context.pushNamed(AppRouterConst.adminHome);
    } else {
      RegistrationDialogs.pendingRegisteredDialog(context, enteredUser)
          .then((_) => resetSignUpForm());
    }
  }

  /// Handles signup submission and navigation.
  Future<void> submitSignUp(BuildContext context) async {
    final isValid = validateSignUpForm();

    if (!isValid) {
      _companyValidationMode = AutovalidateMode.always;
      _phoneValidationMode = AutovalidateMode.always;
      _emailValidationMode = AutovalidateMode.always;
      _passwordValidationMode = AutovalidateMode.always;
      _confirmPasswordValidationMode = AutovalidateMode.always;
      notifyListeners();
      return;
    }

    final existingUser =
        await UserStorage.getUserByPhone(_phone.getValue ?? "");
    final users = await UserStorage.getUsers();

    for (var user in users) {
      Logger.logSuccess("User :: ${user.toJson()}");
    }

    if (existingUser != null) {
      if (existingUser.isOtpVerified) {
        RegistrationDialogs.completedRegisteredDialog(context, existingUser)
            .then((_) {
          resetSignUpForm();
          context.pushNamed(AppRouterConst.login);
        });
      } else {
        RegistrationDialogs.pendingRegisteredDialog(context, existingUser)
            .then((_) => resetSignUpForm());
      }
    } else {
      final newUser = LocalUser(
        name: _companyName.getValue ?? "",
        email: _email.getValue ?? "",
        phone: _phone.getValue ?? "",
        password: _password.getValue ?? "",
      );
      await UserStorage.saveUser(newUser);

      startOtpTimer();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.pushNamed(AppRouterConst.otpAuth, extra: newUser);
      });
    }
  }

  //============================================================================
  //                             TOGGLING
  //============================================================================

  /// Toggles password visibility.
  void toggleVisibility() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  //============================================================================
  //                             LIFECYCLE
  //============================================================================

  @override
  void dispose() {
    _timer?.cancel();
    emailController.dispose();
    super.dispose();
  }
}
