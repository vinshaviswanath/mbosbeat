import 'package:mpos_beat/core/di/env.dart';

class Urls {
  static String baseURL = Env.instance.domainUrl;
  static String apiVersionUrl = '$baseURL/api/';

  static String isPhoneNoAvailableKey = 'isPhoneNoAvailable';

  static var apiUrl = '${Env.instance.domainUrl}';

  // static const String tokenRefresh = 'token-refresh';
  static const String companyRegistration = '/Registration/Create';
  static const String otpValidation = "/RegistrationOTP/Create";
  static const String resendOtp = "/RegistrationOTP/Generate";
  static const String resetPassword = "/Registration/ResetPassword";
}
