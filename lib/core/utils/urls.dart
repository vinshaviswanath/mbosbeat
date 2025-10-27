class Urls {
  static String baseURL = 'http://mposbeat.mnets.in';

  // static const String tokenRefresh = 'token-refresh';
  static const String companyRegistration = '/api/Registration/Create';
  static const String otpValidation = "/api/RegistrationOTP/Create";
  static const String resendOtp = "/api/RegistrationOTP/Generate";
  static const String resetPassword = "/api/Registration/ResetPassword";
  static const String login = "/auth/login";
  static const String addDesignation = "/api/UserDesignation/Create";
  static const String getUserDesignationList = "/api/UserDesignation/GetAll";
  static const String activateDesignation1 =
      "/api/UserDesignation/Active?DesignationID=";
  static const String activateDesignation2 = "&Active=1";
  static const String deactivateDesignation1 =
      "/api/UserDesignation/Active?DesignationID=";
  static const String deactivateDesignation2 = "&Active=0";
  static const String deleteDesignation =
      "/api/UserDesignation/Delete?DesignationID=";
  static const String createUser = "/api/UserMaster/Create";
  static const String getAllUsers = "/api/UserMaster/GetAll";
  static const String deleteUser = "/api/UserMaster/Delete";
  static const String blockUser = "/api/UserMaster/Block";
  static const String resetUserPassword = "/api/UserMaster/ResetPassword";
  static const String getUserSettingsList = "/api/User/UserSettings?UserID=";
  static const String createUserSettings = "/api/User/CreateSettings";
  static const String getAllCompanies = "/api/Company/GetAll";
  static const String createUserCompanyMapping = "/api/User/CreateMapping";
  static const String createGodown = "/api/Vehicle/Create";
  static const String getAllGodows = "/api/Vehicle/GetAll?CompanyID=";
  static const String activateGodown1 = "/api/Vehicle/Active?MID=";
  static const String activateGodown2 = "&Active=1";
  static const String deactivateGodown1 = "/api/Vehicle/Active?MID=";
  static const String deactivateGodown2 = "&Active=0";
  static const String deleteGodown = "/api/Vehicle/Delete?MID=";
  static const String createRoute = "/api/Route/Create";
  static const String getAllroutes = "/api/Route/GetAll?CompanyID=";
  static const String activateRoute1 = "/api/Route/Active?RouteID=";
  static const String activateRoute2 = "&Active=1";
  static const String deactivateRoute1 = "/api/Route/Active?RouteID=";
  static const String deactivateRoute2 = "&Active=0";
  static const String deleteRoute ="/api/Route/Delete?RouteID=";
}
