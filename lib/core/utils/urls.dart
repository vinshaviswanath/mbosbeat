import 'package:mpos_beat/core/di/env.dart';

class Urls {
  static String baseURL = Env.instance.domainUrl;
  static String apiVersionUrl = '$baseURL/api/';

  static String isPhoneNoAvailableKey = 'isPhoneNoAvailable';

  static var apiUrl = '${Env.instance.domainUrl}/api/';

  static const String tokenRefresh = 'token-refresh';
}
