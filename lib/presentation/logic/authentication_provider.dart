import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/failures/failures.dart';
import 'package:mpos_beat/core/failures/value_object/value_object.dart';
import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/company_list_model.dart';
import 'package:mpos_beat/data/models/company_registration_response.dart';
import 'package:mpos_beat/data/models/data/otp_response_data.dart';
import 'package:mpos_beat/data/models/login_response.dart';
import 'package:mpos_beat/data/models/otp_response.dart';
import 'package:mpos_beat/data/models/response_data.dart';
import 'package:mpos_beat/data/models/user_model.dart';
import 'package:mpos_beat/domain/repositories/i_authentication_facad.dart';
import 'package:mpos_beat/domain/request/company_registration_params.dart';
import 'package:mpos_beat/domain/request/login_by_token_param.dart';
import 'package:mpos_beat/domain/request/login_params.dart';
import 'package:mpos_beat/domain/request/otp_validation_params.dart';
import 'package:mpos_beat/domain/request/resend_otp_params.dart';
import 'package:mpos_beat/domain/request/reset_password_params.dart';
import 'package:mpos_beat/presentation/dialogs/registration_dialogs.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthFormProvider with ChangeNotifier {
  final IAuthenticationFacad iAuthenticationFacad;
  AuthFormProvider(this.iAuthenticationFacad);

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  EmailOrPhone _emailOrPhone = EmailOrPhone('');
  Password _password = Password('');

  CompanyRegistrationResponse? _companyRegistrationResponse;
  CompanyRegistrationResponse? get companyRegistrationResponse =>
      _companyRegistrationResponse;
  OtpResponse? _otpResponse;
  OtpResponse? get otpResponse => _otpResponse;
  OtpResponseData? _otpResponseData;
  OtpResponseData? get otpResponsData => _otpResponseData;
  ResponseData? _responseData;
  ResponseData? get responseData => _responseData;
  LoginResponse? _loginResponse;
  LoginResponse? get loginResponse => _loginResponse;
  String? _otpValue;
  String? get otpValue => _otpValue;
  int? _cusomerId;
  int? get customerId => _cusomerId;

  CompanyName _companyName = CompanyName('');
  PhoneNumber _phone = PhoneNumber('');
  EmailAddress _email = EmailAddress('');
  ConfirmPassword _confirmPassword = ConfirmPassword('', '');

  Otp _otp = Otp('');
  String? _otpError;
  int _remainingSeconds = 0;
  Timer? _timer;
  bool _alreadyNavigatedToInvalidOtp = false;

  bool _isVisible = false;
  bool _isVisibleSignupPassword = false;
  bool _isVisibleSignupConfirmPassword = false;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  AutovalidateMode loginAutovalidateMode = AutovalidateMode.disabled;
  AutovalidateMode registerAutovalidateMode = AutovalidateMode.disabled;
  AutovalidateMode otpAutovalidateMode = AutovalidateMode.disabled;

  EmailOrPhone get emailOrPhone => _emailOrPhone;
  Password get password => _password;
  CompanyName get companyName => _companyName;
  PhoneNumber get phone => _phone;
  EmailAddress get email => _email;
  ConfirmPassword get confirmPassword => _confirmPassword;

  bool get isVisible => _isVisible;
  bool get isVisibleSignupPassword => _isVisibleSignupPassword;
  bool get isVisibleSignupConfirmPassword => _isVisibleSignupConfirmPassword;

  final prefs = sl<SharedPreferences>();

  //============================================================================
  //                              SETTERS
  //============================================================================

  void updateEmailOrPhone(String input) {
    _emailOrPhone = EmailOrPhone(input);
    // _emailOrPhoneValidationMode =
    //     input.isNotEmpty ? AutovalidateMode.always : AutovalidateMode.disabled;
    notifyListeners();
  }

  void updatePassword(String input) {
    _password = Password(input);
    // _passwordValidationMode =
    //     input.isNotEmpty ? AutovalidateMode.always : AutovalidateMode.disabled;

    _confirmPassword = ConfirmPassword(
      _confirmPassword.getValue ?? '',
      _password.getValue ?? '',
    );
    notifyListeners();
  }

  void updateConfirmPassword(String input) {
    _confirmPassword = ConfirmPassword(input, _password.getValue ?? '');
    // _confirmPasswordValidationMode =
    //     input.isNotEmpty ? AutovalidateMode.always : AutovalidateMode.disabled;
    notifyListeners();
  }

  void updateCompanyName(String input) {
    _companyName = CompanyName(input);
    // _companyValidationMode =
    //     input.isNotEmpty ? AutovalidateMode.always : AutovalidateMode.disabled;
    notifyListeners();
  }

  void updatePhone(String input) {
    _phone = PhoneNumber(input);
    // _phoneValidationMode =
    //     input.isNotEmpty ? AutovalidateMode.always : AutovalidateMode.disabled;
    notifyListeners();
  }

  void updateEmail(String input) {
    _email = EmailAddress(input);
    // _emailValidationMode =
    //     input.isNotEmpty ? AutovalidateMode.always : AutovalidateMode.disabled;
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
    final domainExtension = domainParts.length > 1
        ? ".${domainParts.sublist(1).join(".")}"
        : "";

    final maskedUsername = username.isNotEmpty
        ? username[0] + "*" * (username.length - 1)
        : "";
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
      return "Email is required!";
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
  Otp get otp => _otp;

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
    _otp = Otp(value);
    Logger.logSuccess(otp);
    _otpError = null;
    notifyListeners();
  }

  /// Resets invalid OTP flag and timer.
  void resetInvalidOtpFlag(bool value) {
    _alreadyNavigatedToInvalidOtp = value;
    resetOtpTimer();
    _otpError = null;
  }

  Future<OtpResponse?> submitOtp(
    BuildContext context, {
    required void Function(OtpResponse) onResponse,
    required void Function(MainFailure) onError,
  }) async {
    otpAutovalidateMode = AutovalidateMode.always;
    notifyListeners();
    if (!_otp.isValid()) {
      return null;
    }

    if (_remainingSeconds == 0) {
      _otpError = "OTP has expired. Please request a new one.";
      notifyListeners();
      // CustomAlertDialog.showCustomDialog(
      //   title: _otpError!,
      //   typeAlert: TypeAlert.error,
      // );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_otpError!, textAlign: TextAlign.center),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      );
      return null;
    }

    context.pushNamed(AppRouterConst.loadingScreen);
    Logger.logSuccess("Customer ID : $_cusomerId");
    final result = await iAuthenticationFacad.otpValidation(
      BaseParams(
        data: OtpParams(id: _cusomerId, otp: _otp.getValue),
      ),
    );

    result.fold(
      (failure) {
        _otpError = failure.errorMsg;
        Logger.logError(failure.errorMsg);

        // _otpError = "Please enter valid OTP";
        if (!_alreadyNavigatedToInvalidOtp && _otp.isValid()) {
          _alreadyNavigatedToInvalidOtp = true;
          startOtpTimer();
          GoRouter.of(context).pushNamed(AppRouterConst.invalidOtp);
        } else {
          // CustomAlertDialog.showCustomDialog(
          //   title: _otpError!,
          //   typeAlert: TypeAlert.error,
          // );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(_otpError!, textAlign: TextAlign.center),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
          );
        }

        notifyListeners();
      },
      (response) async {
        _otpResponse = response;

        if (response.loginData == null || response.status == 1) {
          _otpError = response.message;
        } else {
          _otpError = null;
        }

        Logger.logSuccess("OTP verification success : ${response.toJson()}");

        _alreadyNavigatedToInvalidOtp = false;

        // await UserStorage.updateUser(verifiedUser);

        resetSignUpForm();
        resetLoginForm();

        notifyListeners();

        onResponse.call(response);
      },
    );

    return _otpResponse;
  }

  //============================================================================
  //                           RESEND OTP
  //============================================================================

  Future<OtpResponse?> resendOtp(BuildContext context, {int? id}) async {
    final result = await iAuthenticationFacad.resendOtp(
      BaseParams(data: ResendOtpParams(userId: id ?? _cusomerId ?? 0)),
    );

    result.fold(
      (failure) {
        _errorMessage = failure.errorMsg.toString();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(_errorMessage!)));
        Logger.logError("Resend OTP failed : $_errorMessage");
        // _setLoading(false);
        resetOtpTimer();
        notifyListeners();
      },
      (response) {
        _otpResponse = response;
        _otpValue = response.message;
        _cusomerId = response.id;
        Logger.logSuccess("Resend OTP success : ${response.toJson()}");
        Logger.logSuccess("Resend OTP ID : $_cusomerId");

        // Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                   builder: (context) =>
        //                       OtpAuthentication(user: existingUser),
        //                 ),
        //               );
      },
    );

    return _otpResponse;
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
    Logger.logInfo(
      "Validation :${_emailOrPhone.isValid()}, ${_password.isValid()}",
    );
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
    loginAutovalidateMode = AutovalidateMode.disabled;
    registerAutovalidateMode = AutovalidateMode.disabled;
    otpAutovalidateMode = AutovalidateMode.disabled;
    notifyListeners();
  }

  /// Resets signup form state.
  void resetSignUpForm() {
    _companyName = CompanyName('');
    _phone = PhoneNumber('');
    _email = EmailAddress('');
    _confirmPassword = ConfirmPassword('', '');
    _password = Password('');
    loginAutovalidateMode = AutovalidateMode.disabled;
    registerAutovalidateMode = AutovalidateMode.disabled;
    otpAutovalidateMode = AutovalidateMode.disabled;
    notifyListeners();
  }

  /// Handles login submission and navigation.
  Future<LoginResponse?> submitLogin(
    BuildContext context, {
    required LoginParams params,
  }) async {
    final isValid = validateLoginForm();
    if (!isValid) {
      loginAutovalidateMode = AutovalidateMode.always;
      notifyListeners();
      return null;
    }

    // Start login
    final result = await iAuthenticationFacad.login(BaseParams(data: params));

    await result.fold(
      (failure) async {
        _errorMessage = failure.errorMsg.toString();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(_errorMessage!)));
        Logger.logError("Login failed : $_errorMessage");
        _setLoading(false);
        notifyListeners();
      },
      (response) async {
        Logger.logSuccess("Login response : ${response.toJson()}");
        Logger.logSuccess(
          "Customer ID : ${response.loginData?.customerId}, Status : ${response.status}",
        );

        _loginResponse = response;
        _setLoading(false);
        notifyListeners();

        //Stop immediately if invalid credentials or no login data
        if (response.status == 0 || response.loginData == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.message ?? ""),
              behavior: SnackBarBehavior.floating,
            ),
          );
          Logger.logError("Login failed: Invalid credentials or no data");
          return;
        }

        //Save token
        final prefs = sl<SharedPreferences>();
        final newToken = response.loginData?.token ?? '';
        await prefs.setString("token", newToken);
        Logger.logInfo("Token saved after login: $newToken");

        //Fetch company list using valid token
        final companyProvider = context.read<CompanyCreationProvider>();
        List<CompanyViewList> companyList = [];
        CompanyViewList? companyData;
        bool hasCompany = false;

        try {
          await companyProvider.getAllCompanies(context);
          companyList = companyProvider.companiesList?.companyViewList ?? [];
          hasCompany = companyList.isNotEmpty;
          companyData = hasCompany ? companyList.first : null;
        } catch (e) {
          Logger.logError("Error fetching companies after login: $e");
        }

        Logger.logInfo(
          "hasCompany: $hasCompany, companyData: ${companyData?.companyName}",
        );

        // Handle navigation or dialogs based on status
        switch (response.status) {
          case 1: //Login successful → Go to Admin Home
            _cusomerId = response.loginData?.customerId;
            context.pushNamed(AppRouterConst.adminDashboard);
            break;

          case 10: //Pending registration approval
            RegistrationDialogs.pendingRegisteredDialog(
              context,
              response.loginData?.companyName ?? '',
              id: response.loginData?.customerId,
            );
            break;

          case 20: //Company creation pending
            RegistrationDialogs.customDialog(
              context: context,
              heading: "Pending",
              subTitle: "Please complete company creation",
              onTap: () {
                context.pushNamed(
                  AppRouterConst.companyCreationScreen,
                  extra: {'tabIndex': 0, 'companyData': companyData},
                );
              },
              buttonText: "Redirect",
            );
            break;

          case 30: //Integration settings pending
            RegistrationDialogs.customDialog(
              context: context,
              heading: "Pending",
              subTitle: "Please complete Company Integration Settings",
              onTap: () {
                context.pushNamed(
                  AppRouterConst.companyCreationScreen,
                  extra: {'tabIndex': 2, 'companyData': companyData},
                );
              },
              buttonText: "Redirect",
            );
            break;

          case 40: //Voucher type configuration pending
            RegistrationDialogs.customDialog(
              context: context,
              heading: "Pending",
              subTitle: "Please complete Company VoucherType Configuration",
              onTap: () {
                context.pushNamed(
                  AppRouterConst.companyCreationScreen,
                  extra: {'tabIndex': 1, 'companyData': companyData},
                );
              },
              buttonText: "Redirect",
            );
            break;

          default:
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  response.message ?? "Unknown error occurred",
                  textAlign: TextAlign.center,
                ),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
            );
            break;
        }
      },
    );

    return _loginResponse;
  }

  Future<CompanyRegistrationResponse?> submitSignUp(
    BuildContext context,
  ) async {
    final isValid = validateSignUpForm();

    // CompanyRegistrationResponse? companyRegResponse;

    if (!isValid) {
      registerAutovalidateMode = AutovalidateMode.always;

      notifyListeners();
      return null;
    }

    // Prepare request params
    final newUser = LocalUser(
      name: _companyName.getValue ?? "",
      email: _email.getValue ?? "",
      phone: _phone.getValue ?? "",
      password: _password.getValue ?? "",
    );

    _setLoading(true);

    final result = await iAuthenticationFacad.companyRegistration(
      BaseParams(
        data: CompanyRegistrationParams(
          companyName: companyName.getValue,
          mobile: phone.getValue,
          email: email.getValue,
          adminUsername: email.getValue,
          password: password.getValue,
        ),
      ),
    );

    result.fold(
      (failure) {
        _errorMessage = failure.errorMsg.toString();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(_errorMessage!)));
        Logger.logError("Registration failed : $_errorMessage");
        _setLoading(false);
        notifyListeners();
      },
      (response) {
        _companyRegistrationResponse = response;
        _cusomerId = response.id;
        Logger.logSuccess("Registration success : ${response.toJson()}");

        /// CASE 1: New user → OTP generated → status == 1
        if (response.status == 1) {
          startOtpTimer();
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.pushNamed(AppRouterConst.otpAuth, extra: newUser);
          });
        }

        /// CASE 2: Already registered → pending OTP verification → status == 20
        if (response.status == 20) {
          RegistrationDialogs.pendingRegisteredDialog(
            context,
            companyName.getValue ?? '',
            id: response.id,
          ).then((_) => resetSignUpForm());
        }

        /// CASE 3: Already registered and OTP verified → completed registration
        if (response.status == 10) {
          RegistrationDialogs.completedRegisteredDialog(
            context,
            companyName.getValue ?? '',
          ).then((_) {
            resetSignUpForm();
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.pushNamed(AppRouterConst.login);
            });
          });
        }

        _setLoading(false);
        notifyListeners();
      },
    );

    return _companyRegistrationResponse;
  }

  Future<ResponseData?> resetPassword(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      loginAutovalidateMode = AutovalidateMode.onUserInteraction;
      notifyListeners();
      return null;
    }

    _setLoading(true);
    _errorMessage = null;
    Logger.logSuccess("Email : ${emailController.text}");

    final result = await iAuthenticationFacad.resetPassword(
      BaseParams(
        data: ResetPasswordParam(username: emailController.text.trim()),
      ),
    );

    result.fold(
      (failure) {
        _errorMessage = failure.errorMsg.toString();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(_errorMessage!)));
        Logger.logError("Reset Password failed : $_errorMessage");
      },
      (response) {
        _responseData = response;
        Logger.logSuccess("Reset Password success : ${response.toJson()}");
        if (response.status != 0) {
          submitEmail(context);

          // emailController.clear();
        } else {
          // CustomAlertDialog.showCustomDialog(
          //   title: response.message!,
          //   typeAlert: TypeAlert.error,
          // );
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(response.message!)));
        }
      },
    );

    _setLoading(false);
    notifyListeners();
    return _responseData;
  }

  //===========================Login By Token========================

  Future<LoginResponse?> loginByToken({
    required LoginByTokenParam params,
  }) async {
    LoginResponse? _loginResponse;

    final result = await iAuthenticationFacad.loginByToken(
      BaseParams(data: params),
    );

    await result.fold(
      (failure) async {
        _errorMessage = failure.errorMsg.toString();
        Logger.logError("Login by token failed : $_errorMessage");
        _setLoading(false);
        notifyListeners();
        _loginResponse = null;
      },
      (response) async {
        Logger.logSuccess("Login by token success : ${response.toJson()}");
        _loginResponse = response;
        _cusomerId = response.status == 1
            ? response.loginData?.customerId
            : null;
        notifyListeners();
      },
    );

    return _loginResponse;
  }

  //============================================================================
  //                             TOGGLING
  //============================================================================

  /// Toggles password visibility.
  void toggleVisibility() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  void toggleVisibilitySignUpPassword() {
    _isVisibleSignupPassword = !_isVisibleSignupPassword;
    notifyListeners();
  }

  void toggleVisibilitySignUpConfirmPassword() {
    _isVisibleSignupConfirmPassword = !_isVisibleSignupConfirmPassword;
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

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
