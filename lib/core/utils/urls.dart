import 'package:mpos_beat/core/di/env.dart';

class Urls {
  static String baseURL = Env.instance.domainUrl;
  static String apiVersionUrl = '$baseURL';

  static String isPhoneNoAvailableKey = 'isPhoneNoAvailable';

  static var apiUrl = '${Env.instance.domainUrl}';

  // static const String tokenRefresh = 'token-refresh';
  static const String companyRegistration = '/api/Registration/Create';
  static const String otpValidation = "/api/RegistrationOTP/Create";
  static const String resendOtp = "/api/RegistrationOTP/Generate";
  static const String resetPassword = "/api/Registration/ResetPassword";
  static const String login = "/auth/login";
}
