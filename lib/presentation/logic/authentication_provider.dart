import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/failures/failures.dart';
import 'package:mpos_beat/core/failures/value_object/value_object.dart';
import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/models/company_list_model.dart';
import 'package:mpos_beat/data/models/company_registration_response.dart';
import 'package:mpos_beat/data/models/data/country_list_data.dart';
import 'package:mpos_beat/data/models/data/otp_response_data.dart';
import 'package:mpos_beat/data/models/data/registration_type_data.dart';
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
  final AppDb db;
  AuthFormProvider(this.iAuthenticationFacad, {required this.db});

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  EmailOrPhone _emailOrPhone = EmailOrPhone('');
  Password _password = Password('');
  ConfirmPassword _confirmPassword = ConfirmPassword('', '');

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

  Otp _otp = Otp('');
  String? _otpError;
  int _remainingSeconds = 0;
  Timer? _timer;
  // bool _alreadyNavigatedToInvalidOtp = false;

  bool _isVisible = false;
  bool _isUserPasswordVisible = false;
  bool _isVisibleSignupPassword = false;
  bool _isVisibleSignupConfirmPassword = false;

  // final formKey = GlobalKey<FormState>();
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
  bool get isUserPasswordVisible => _isUserPasswordVisible;
  bool get isVisibleSignupPassword => _isVisibleSignupPassword;
  bool get isVisibleSignupConfirmPassword => _isVisibleSignupConfirmPassword;

  final prefs = sl<SharedPreferences>();

  bool _showOtpValidation = false;
  bool get showOtpValidation => _showOtpValidation;

  //============================================================================
  //                              SETTERS
  //============================================================================

  void updateEmailOrPhone(String input) {
    _emailOrPhone = EmailOrPhone(input);
    // _emailOrPhoneValidationMode =
    //     input.isNotEmpty ? AutovalidateMode.always : AutovalidateMode.disabled;
    notifyListeners();
  }

  void updatePassword(String input, String? confirmInput) {
    _password = Password(input);

    _confirmPassword = ConfirmPassword(confirmInput ?? '', input);

    notifyListeners();
  }

  void updateConfirmPassword(String input) {
    _confirmPassword = ConfirmPassword(input, _password.getValue ?? '');
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
  void submitEmail(
    BuildContext context, {
    required GlobalKey<FormState> formKey,
  }) {
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
  // void resetInvalidOtpFlag(bool value) {
  //   _alreadyNavigatedToInvalidOtp = value;
  //   resetOtpTimer();
  //   _otpError = null;
  // }

  void clearOtpValidation() {
    _otp = Otp('');
    _otpError = null;
    otpAutovalidateMode = AutovalidateMode.disabled;
    notifyListeners();
  }

  Future<LoginResponse?> submitOtp(
    BuildContext context, {
    required void Function(LoginResponse) onResponse,
    required void Function(MainFailure) onError,
  }) async {
    otpAutovalidateMode = AutovalidateMode.always;
    notifyListeners();

    if (!_otp.isValid()) return null;

    if (_remainingSeconds == 0) {
      _otpError = "OTP has expired. Please request a new one.";
      notifyListeners();

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(_otpError!)));
      return null;
    }

    final result = await iAuthenticationFacad.otpValidation(
      BaseParams(
        data: OtpParams(id: _cusomerId, otp: _otp.getValue),
      ),
    );

    result.fold(
      (failure) {
        _otpError = failure.errorMsg;

        // ❌ DO NOT restart timer here

        notifyListeners();
      },
      (response) {
        _loginResponse = response;

        if (response.status == 0) {
          _otpError = response.message;
          notifyListeners();
          return;
        }

        // ✅ SUCCESS
        _otpError = null;
        resetSignUpForm();
        resetLoginForm();
        notifyListeners();

        onResponse.call(response);
      },
    );

    return _loginResponse;
  }

  //============================================================================
  //                           RESEND OTP
  //============================================================================

  Future<LoginResponse?> resendOtp(BuildContext context, {int? id}) async {
    final result = await iAuthenticationFacad.resendOtp(
      BaseParams(data: ResendOtpParams(userId: id ?? _cusomerId ?? 0)),
    );

    result.fold(
      (failure) {
        _errorMessage = failure.errorMsg.toString();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(_errorMessage!)));
        notifyListeners();
      },
      (response) {
        _loginResponse = response;
        _otpValue = response.message;
        _cusomerId = response.id;

        clearOtpValidation();
        startOtpTimer(); // ✅ Restart ONLY here

        notifyListeners();
      },
    );

    return _loginResponse;
  }

  // void clearOtpValidation() {
  //   _otp = Otp("");
  //   _otpError = null;
  //   _otpResponse = null;
  //   _showOtpValidation = false;
  //   otpAutovalidateMode = AutovalidateMode.disabled;
  //   notifyListeners();
  // }

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

    final result = await iAuthenticationFacad.login(BaseParams(data: params));

    await result.fold(
      (failure) async {
        _errorMessage = failure.errorMsg.toString();
        final safeMsg = _errorMessage?.isNotEmpty == true
            ? _errorMessage!
            : "Login failed. Please try again.";

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(safeMsg)));

        Logger.logError("Login failed : $safeMsg");

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

        if (response.status == 0 || response.loginData == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                response.message?.isNotEmpty == true
                    ? response.message!
                    : "Invalid credentials",
              ),
              behavior: SnackBarBehavior.floating,
            ),
          );
          return;
        }

        /// Save token
        final prefs = sl<SharedPreferences>();
        final newToken = response.loginData?.token ?? '';
        await prefs.setString("token", newToken);
        Logger.logInfo("Token saved after login: $newToken");

        _cusomerId = response.loginData?.customerId;

        /// -------- FETCH COMPANY DATA ----------
        final companyProvider = context.read<CompanyCreationProvider>();
        List<CompanyViewList> companyList = [];
        CompanyViewList? companyData;
        bool hasCompany = false;

        try {
          await companyProvider.getAllCompanies(context);

          companyList = companyProvider.companiesList?.companyViewList ?? [];
          hasCompany = companyList.isNotEmpty;
          companyData = hasCompany ? companyList.first : null;

          await companyProvider.fetchCountryList(context);

          final selectedCountry = companyProvider.countries.firstWhere(
            (c) => c.id.toString() == companyData!.country.toString(),
            orElse: () => CountryListData(
              id: 0,
              countryName: "Unknown",
              stateTitle: '',
              pinTitle: '',
              currency: '',
              altCurrency: 0,
              currencyNod: 0,
              currencySymbol: 0,
              taxApplicable: 0,
              taxType: 0,
              taxRegNoTitle: '',
              cessApplicable: 0,
              exciseApplicable: 0,
            ),
          );

          if (selectedCountry.id == 0) {
            debugPrint("Country not matched with company");
          }

          companyProvider.selectCountry(context, selectedCountry);

          await companyProvider.getRegistrationType(
            context,
            selectedCountry.id,
          );

          final selectedRegType = companyProvider.registrationlists.firstWhere(
            (r) => r.id.toString() == companyData!.regType.toString(),
            orElse: () =>
                RegistrationTypeData(id: 0, countryId: 0, registrationType: ''),
          );

          if (selectedRegType.id != 0) {
            companyProvider.selectRegistrationType(selectedRegType);
            debugPrint(
              "RegType found in login: ${selectedRegType.registrationType}",
            );
          }

          Logger.logSuccess(
            "Initial RegType in login: ${companyProvider.selectedregistrationtype?.registrationType}",
          );
        } catch (e) {
          Logger.logError("Error fetching companies after login: $e");
        }

        Logger.logInfo(
          "hasCompany: $hasCompany, companyData: ${companyData?.companyName}",
        );

        /// -------- USER LOGIN ----------
        if (!params.isAdmin) {
          context.pushNamed(AppRouterConst.userCompanySelectionScreen);
          return;
        }

        /// -------- ADMIN STATUS HANDLING ----------
        if (params.isAdmin) {
          Logger.logInfo("Admin login detected. Status: ${response.status}");

          switch (response.status) {
            case 1:
              context.pushNamed(
                response.loginData?.designation?.toLowerCase() == "admin"
                    ? AppRouterConst.adminDashboard
                    : AppRouterConst.userCompanySelectionScreen,
              );
              break;

            case 10:
              WidgetsBinding.instance.addPostFrameCallback((_) {
                RegistrationDialogs.customDialog(
                  margin: const EdgeInsets.symmetric(horizontal: 70),
                  context: context,
                  heading: "OTP not Varified",
                  subTitle:
                      "You have successfully completed Login. Kindly\nverify with OTP to continue.",
                  onTap: () async {
                    final customerId = response.loginData?.customerId;
                    await resendOtp(context, id: customerId);
                    context.pushNamed(AppRouterConst.otpAuth);
                  },
                  buttonText: "Varify OTP",
                );
              });
              break;

            case 20:
              WidgetsBinding.instance.addPostFrameCallback((_) {
                RegistrationDialogs.customDialog(
                  margin: const EdgeInsets.symmetric(horizontal: 70),
                  context: context,
                  heading: "Registration Completed!",
                  subTitle:
                      "You have successfully completed the\nregistration on last login. Kindly go to company\ncreation page to continue.",
                  onTap: () {
                    context.goNamed(
                      AppRouterConst.companyCreationScreen,
                      extra: {
                        'tabIndex': 0,
                        'companyData': companyData,
                        'isPop': true,
                      },
                    );
                  },
                  buttonText: "Go to Company Creation",
                );
              });
              break;

            case 30:
              Logger.logInfo("CASE 30 TRIGGERED");
              WidgetsBinding.instance.addPostFrameCallback((_) {
                RegistrationDialogs.customDialog(
                  margin: const EdgeInsets.symmetric(horizontal: 103),
                  context: context,
                  heading: "Company Creation Completed!",
                  subTitle:
                      "You have successfully created company details on last login. Kindly start the voucher type configuration to continue.",
                  onTap: () {
                    context.goNamed(
                      AppRouterConst.companyCreationScreen,
                      extra: {
                        'tabIndex': 1,
                        'companyData': companyData,
                        'isPop': true,
                      },
                    );
                  },
                  buttonText: "Continue",
                );
              });
              break;

            case 40:
              WidgetsBinding.instance.addPostFrameCallback((_) {
                RegistrationDialogs.customDialog(
                  margin: const EdgeInsets.symmetric(horizontal: 103),
                  context: context,
                  heading: "Company Creation Completed!",
                  subTitle:
                      "You have successfully completed voucher type configuration on last login. Kindly start the integration settings to continue.",
                  onTap: () {
                    context.goNamed(
                      AppRouterConst.companyCreationScreen,
                      extra: {
                        'tabIndex': 2,
                        'companyData': companyData,
                        'isPop': true,
                      },
                    );
                  },
                  buttonText: "Continue",
                );
              });
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
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                ),
              );
          }
        }
      },
    );

    return _loginResponse;
  }

  Future<CompanyRegistrationResponse?> submitSignUp(
    BuildContext context,
  ) async {
    final isValid = validateSignUpForm();

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
          );
        }

        _setLoading(false);
        notifyListeners();
      },
    );

    return _companyRegistrationResponse;
  }

  Future<ResponseData?> resetPassword(
    BuildContext context, {
    required GlobalKey<FormState> formKey,
  }) async {
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
          submitEmail(context, formKey: formKey);
        } else {
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

  void resetVisibility() {
    _isVisible = false;
    notifyListeners();
  }

  void userToggleVisibility() {
    _isUserPasswordVisible = !_isUserPasswordVisible;
    notifyListeners();
  }

  void resetUserPasswordVisibility() {
    _isUserPasswordVisible = false;
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

  void resetVisibilitySignUp() {
    _isVisibleSignupPassword = false;
    _isVisibleSignupConfirmPassword = false;
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
