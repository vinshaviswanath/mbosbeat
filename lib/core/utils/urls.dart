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
  static const String loginByToken = "/auth/loginToken";
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
  static const String deleteRoute = "/api/Route/Delete?RouteID=";
  static const String registrationType =
      "/api/RegistrationType/GetAll?CountryID=";
  static const String getAllCompanySettings =
      "/api/CompanySettings/GetAll?CompanyID=";
  static const String createCompanySettings = "/api/CompanySettings/Create";
  static const String getAllCompany = "/api/Company/GetAll";
  static const String createCompanyUserMapping = "/api/Company/CreateMapping";
  static const String getVoucherNumbering1 =
      "/api/Company/GetVoucherNumbering?";
  static const String getVoucherNumbering2 = "CompanyID=";
  static const String getVoucherNumbering3 = "&VoucherMode=";
  static const String getVoucherNumbering4 = "&VoucherModeID=";
  static const String createVoucherNumbering =
      "/api/Company/CreateVoucherNumbering";
  static const String completeVoucherSettings =
      "/api/Company/CompleteSettings?CompanyID=";
  static const String setVoucherNumberingMethod1 =
      "/api/Company/SetVoucherNumberingMethod?CompanyID=";
  static const String setVoucherNumberingMethod2 = "&VoucherMode=";
  static const String partyMasterSync = "/API/Party/GetAll";
  static const String attendanceMarking = "/UserModule/MarkAttendance";
  static const String checkin = "/UserModule/CustomerCheckIN";
  static const String checkout = "/UserModule/CustomerCheckOut";
  static const String startTrip = "/UserModule/TripStart";
  static const String endTrip = "/UserModule/TripEnd";
  static const String skipReason = "/UserModule/GetSkipReasons";
  static const String updateCompanyProfile = "/api/Company/Profile";
  static const String updateBankDetails = "/api/Company/UpdateBankDetails";
  static const String updateRegistrationDetails =
      "/api/Company/UpdateRegDetails";
  // static const String updateCompanyProfile = "/api/Company/UpdateBankDetails";
}
