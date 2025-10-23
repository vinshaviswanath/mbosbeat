class Urls {
  static String baseURL = 'http://mposbeat.mnets.in';
  // static const String tokenRefresh = 'token-refresh';
  static const String companyRegistration = '/api/Registration/Create';
  static const String otpValidation = "/api/RegistrationOTP/Create";
  static const String resendOtp = "/api/RegistrationOTP/Generate";
  static const String resetPassword = "/api/Registration/ResetPassword";
  static const String login = "/auth/login";
  static const String companyCreation = '/api/Company/Create';
  static const String getCompanyvouchertypeList =
      '/api/CompanyVoucherTypes/GetAll?CompanyID=';

  static const String createCompanyVouchertype =
      '/api/CompanyVoucherTypes/Create';
  static const String countryList = '/api/Country/GetAll';
  static const String stateList = "/api/State/GetAll?CountryID=";
  static const String integrationType = "/api/CompanyIntegration/Create";
}
