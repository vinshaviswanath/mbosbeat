// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:http/http.dart' as _i519;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../data/data_sources/authentication/company_registeration/company_registeration.dart'
    as _i70;
import '../../data/data_sources/authentication/login/login_impl.dart' as _i526;
import '../../data/data_sources/authentication/login_by_token/login_by_token.dart'
    as _i492;
import '../../data/data_sources/authentication/otp_validation/otp_validation.dart'
    as _i42;
import '../../data/data_sources/authentication/resend_otp/resend_otp.dart'
    as _i13;
import '../../data/data_sources/authentication/reset_password/reset_password.dart'
    as _i244;
import '../../data/data_sources/company_creation/activate_godown/activate_godown.dart'
    as _i123;
import '../../data/data_sources/company_creation/activate_route/activate_route.dart'
    as _i260;
import '../../data/data_sources/company_creation/company_info.dart' as _i665;
import '../../data/data_sources/company_creation/complete_voucher_settings.dart'
    as _i915;
import '../../data/data_sources/company_creation/country_list.dart' as _i79;
import '../../data/data_sources/company_creation/create_company_settings.dart'
    as _i640;
import '../../data/data_sources/company_creation/create_company_voucherType.dart'
    as _i1051;
import '../../data/data_sources/company_creation/create_godown/create_godown.dart'
    as _i719;
import '../../data/data_sources/company_creation/create_route/create_route.dart'
    as _i891;
import '../../data/data_sources/company_creation/create_voucher_numbering/create_voucher_numbering.dart'
    as _i220;
import '../../data/data_sources/company_creation/deactivate_godown/deactivate_godown.dart'
    as _i440;
import '../../data/data_sources/company_creation/deactivate_route/deactivate_route.dart'
    as _i6;
import '../../data/data_sources/company_creation/delete_godown/delete_godown.dart'
    as _i323;
import '../../data/data_sources/company_creation/delete_route/delete_route.dart'
    as _i112;
import '../../data/data_sources/company_creation/get_all_companies.dart'
    as _i284;
import '../../data/data_sources/company_creation/get_all_company_settings.dart'
    as _i252;
import '../../data/data_sources/company_creation/get_company_voucherType.dart'
    as _i1001;
import '../../data/data_sources/company_creation/get_godown_list/get_godown_list.dart'
    as _i1064;
import '../../data/data_sources/company_creation/get_route_list/get_route_list.dart'
    as _i504;
import '../../data/data_sources/company_creation/get_voucher_numbering/get_voucher_numbering.dart'
    as _i853;
import '../../data/data_sources/company_creation/integration_type.dart'
    as _i189;
import '../../data/data_sources/company_creation/registration_type.dart'
    as _i34;
import '../../data/data_sources/company_creation/set_voucher_numbering_method/set_voucher_numbering_method.dart'
    as _i931;
import '../../data/data_sources/company_creation/state_list.dart' as _i374;
import '../../data/data_sources/user/attendance_marking/attendanceMarking.dart'
    as _i891;
import '../../data/data_sources/user/trip_end/trip_end.dart' as _i271;
import '../../data/data_sources/user/trip_start/trip_start.dart' as _i796;
import '../../data/data_sources/user_management/activate_designation/activate_designation.dart'
    as _i185;
import '../../data/data_sources/user_management/add_designation/add_designation.dart'
    as _i749;
import '../../data/data_sources/user_management/block_user/block_user.dart'
    as _i183;
import '../../data/data_sources/user_management/checkin_Checkout/checkin_datasource.dart'
    as _i1053;
import '../../data/data_sources/user_management/checkin_Checkout/checkout_datasource.dart'
    as _i435;
import '../../data/data_sources/user_management/company_user_mapping/company_user_mapping.dart'
    as _i148;
import '../../data/data_sources/user_management/create_user/create_user.dart'
    as _i420;
import '../../data/data_sources/user_management/create_user_company_mapping/create_user_company_mapping.dart'
    as _i400;
import '../../data/data_sources/user_management/create_user_settings/create_user_settings.dart'
    as _i466;
import '../../data/data_sources/user_management/deactivate_designation/deactivate_designation.dart'
    as _i797;
import '../../data/data_sources/user_management/delete_designation/delete_designation.dart'
    as _i179;
import '../../data/data_sources/user_management/delete_user/delete_user.dart'
    as _i803;
import '../../data/data_sources/user_management/get_companies/get_compamies.dart'
    as _i213;
import '../../data/data_sources/user_management/get_users_list/get_users_list.dart'
    as _i165;
import '../../data/data_sources/user_management/party_MasterSync/party_MasterSync.dart'
    as _i860;
import '../../data/data_sources/user_management/reset_user_password/reset_user_password.dart'
    as _i762;
import '../../data/data_sources/user_management/user_designation_list/user_designation_list.dart'
    as _i308;
import '../../data/data_sources/user_management/user_settings/user_settings_list.dart'
    as _i829;
import '../../data/local_db/app_db.dart' as _i264;
import '../../data/repositories/i_authentication_facad_impl.dart' as _i823;
import '../../data/repositories/i_company_creation_facad_impl.dart' as _i322;
import '../../data/repositories/i_user_facad_impl.dart' as _i30;
import '../../data/repositories/i_user_management_facad_impl.dart' as _i168;
import '../../domain/repositories/i_authentication_facad.dart' as _i590;
import '../../domain/repositories/i_company_creation_facad.dart' as _i483;
import '../../domain/repositories/i_user_facad.dart' as _i9;
import '../../domain/repositories/i_user_management_facad.dart' as _i172;
import '../../presentation/views/home_screen/controller/home_init_controller.dart'
    as _i342;
import '../base/run_safely.dart' as _i530;
import '../event/event_manager.dart' as _i275;
import '../network/network_provider.dart' as _i335;
import '../service/http_client.dart' as _i976;
import '../service/location_services.dart' as _i547;
import 'app_injection_module.dart' as _i975;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final appInjectionModule = _$AppInjectionModule();
  await gh.factoryAsync<_i460.SharedPreferences>(
    () => appInjectionModule.pref(),
    preResolve: true,
  );
  gh.singleton<_i275.EventManager>(
    () => _i275.EventManager(),
    dispose: (i) => i.dispose(),
  );
  gh.lazySingleton<_i530.RunSafely>(() => _i530.RunSafely());
  gh.lazySingleton<_i519.Client>(() => appInjectionModule.clent);
  gh.lazySingleton<_i264.AppDb>(() => appInjectionModule.appDb);
  gh.lazySingleton<_i335.NetworkProvider>(
    () => appInjectionModule.networkProvider,
  );
  gh.lazySingleton<_i547.LocationService>(
    () => appInjectionModule.locationService,
  );
  gh.lazySingleton<_i342.HomeInitController>(
    () => _i342.HomeInitController(appDb: gh<_i264.AppDb>()),
  );
  gh.lazySingleton<_i976.HttpClient>(
    () => _i976.HttpClient(gh<_i519.Client>()),
  );
  gh.lazySingleton<_i526.LoginImpl>(
    () => _i526.LoginImpl(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
      gh<_i264.AppDb>(),
    ),
  );
  gh.lazySingleton<_i492.LoginByToken>(
    () => _i492.LoginByToken(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
      gh<_i264.AppDb>(),
    ),
  );
  gh.lazySingleton<_i252.GetAllCompanySettingsDatasource>(
    () => _i252.GetAllCompanySettingsDatasource(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
      gh<_i264.AppDb>(),
    ),
  );
  gh.lazySingleton<_i1001.GetCompanyvoucherTypeListDatasource>(
    () => _i1001.GetCompanyvoucherTypeListDatasource(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
      gh<_i264.AppDb>(),
    ),
  );
  gh.lazySingleton<_i1064.GetAllGodowns>(
    () => _i1064.GetAllGodowns(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
      gh<_i264.AppDb>(),
    ),
  );
  gh.lazySingleton<_i504.GetAllRoutes>(
    () => _i504.GetAllRoutes(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
      gh<_i264.AppDb>(),
    ),
  );
  gh.lazySingleton<_i853.GetVoucherNumbering>(
    () => _i853.GetVoucherNumbering(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
      gh<_i264.AppDb>(),
    ),
  );
  gh.lazySingleton<_i829.GetUserSettings>(
    () => _i829.GetUserSettings(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
      gh<_i264.AppDb>(),
    ),
  );
  gh.lazySingleton<_i42.OtpValidation>(
    () => _i42.OtpValidation(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
      appDb: gh<_i264.AppDb>(),
    ),
  );
  gh.lazySingleton<_i284.GetCompanyList>(
    () => _i284.GetCompanyList(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
      appDb: gh<_i264.AppDb>(),
    ),
  );
  gh.lazySingleton<_i860.PartyMasterSync>(
    () => _i860.PartyMasterSync(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
      appDb: gh<_i264.AppDb>(),
    ),
  );
  gh.lazySingleton<_i70.RegistrationEventBinder>(
    () => _i70.RegistrationEventBinder(
      gh<_i275.EventManager>(),
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
    ),
  );
  gh.lazySingleton<_i13.ResendOtp>(
    () => _i13.ResendOtp(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i244.ResetPassword>(
    () => _i244.ResetPassword(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i123.ActivateGodown>(
    () => _i123.ActivateGodown(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i260.ActivateRoute>(
    () => _i260.ActivateRoute(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i665.CompanyInfo>(
    () => _i665.CompanyInfo(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i915.CompleteVoucherSettings>(
    () => _i915.CompleteVoucherSettings(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i79.CountryList>(
    () => _i79.CountryList(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i640.CreateCompanySettingsDatasource>(
    () => _i640.CreateCompanySettingsDatasource(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i1051.CreateCompanyVouchertypeDatasource>(
    () => _i1051.CreateCompanyVouchertypeDatasource(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i719.CreateGodownOrVehicle>(
    () => _i719.CreateGodownOrVehicle(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i891.CreateRoute>(
    () => _i891.CreateRoute(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i220.CreateVoucherNumbering>(
    () => _i220.CreateVoucherNumbering(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i440.DeactivateGodown>(
    () => _i440.DeactivateGodown(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i6.DeactivateRoute>(
    () => _i6.DeactivateRoute(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i323.DeleteGodown>(
    () => _i323.DeleteGodown(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i112.DeleteRoute>(
    () => _i112.DeleteRoute(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i189.IntegrationDatasource>(
    () => _i189.IntegrationDatasource(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i34.RegistrationTypeDatasource>(
    () => _i34.RegistrationTypeDatasource(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i931.SetVoucherNumberingMethod>(
    () => _i931.SetVoucherNumberingMethod(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i374.StateList>(
    () => _i374.StateList(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i891.AttendanceMarking>(
    () => _i891.AttendanceMarking(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i271.TripEnd>(
    () => _i271.TripEnd(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i796.TripStart>(
    () => _i796.TripStart(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i185.ActivateDesignation>(
    () => _i185.ActivateDesignation(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i749.AddDesignation>(
    () => _i749.AddDesignation(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i183.BlockUser>(
    () => _i183.BlockUser(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i1053.CheckinDatasource>(
    () => _i1053.CheckinDatasource(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i435.CheckoutDatasource>(
    () => _i435.CheckoutDatasource(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i148.CreateCompanyUserMapping>(
    () => _i148.CreateCompanyUserMapping(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i420.CreateUser>(
    () => _i420.CreateUser(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i400.CreateUserCompanyMapping>(
    () => _i400.CreateUserCompanyMapping(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i466.CreateUserSettings>(
    () => _i466.CreateUserSettings(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i797.DeactivateDesignation>(
    () => _i797.DeactivateDesignation(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i179.DeleteDesignation>(
    () => _i179.DeleteDesignation(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i803.DeleteUser>(
    () => _i803.DeleteUser(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i213.GetCompanies>(
    () => _i213.GetCompanies(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i165.GetAllUsers>(
    () => _i165.GetAllUsers(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i762.ResetUserPassword>(
    () => _i762.ResetUserPassword(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i308.GetUserDesignationList>(
    () => _i308.GetUserDesignationList(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i9.IUserFacad>(
    () => _i30.IUserFacadImp(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
      gh<_i891.AttendanceMarking>(),
      gh<_i860.PartyMasterSync>(),
      gh<_i1053.CheckinDatasource>(),
      gh<_i435.CheckoutDatasource>(),
      gh<_i796.TripStart>(),
      gh<_i271.TripEnd>(),
    ),
  );
  gh.lazySingleton<_i172.IUserManagementFacad>(
    () => _i168.IUserManagementFacadImpl(
      gh<_i797.DeactivateDesignation>(),
      gh<_i749.AddDesignation>(),
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
      gh<_i308.GetUserDesignationList>(),
      gh<_i185.ActivateDesignation>(),
      gh<_i179.DeleteDesignation>(),
      gh<_i420.CreateUser>(),
      gh<_i165.GetAllUsers>(),
      gh<_i803.DeleteUser>(),
      gh<_i183.BlockUser>(),
      gh<_i762.ResetUserPassword>(),
      gh<_i829.GetUserSettings>(),
      gh<_i466.CreateUserSettings>(),
      gh<_i213.GetCompanies>(),
      gh<_i400.CreateUserCompanyMapping>(),
      gh<_i148.CreateCompanyUserMapping>(),
    ),
  );
  gh.lazySingleton<_i70.CompanyRegisteration>(
    () => appInjectionModule.companyRegisteration(
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
      gh<_i264.AppDb>(),
      gh<_i275.EventManager>(),
      gh<_i70.RegistrationEventBinder>(),
    ),
  );
  gh.lazySingleton<_i483.ICompanyCreationFacad>(
    () => _i322.ICompanyCreationFacadImpl(
      gh<_i665.CompanyInfo>(),
      gh<_i79.CountryList>(),
      gh<_i374.StateList>(),
      gh<_i34.RegistrationTypeDatasource>(),
      gh<_i530.RunSafely>(),
      gh<_i976.HttpClient>(),
      gh<_i460.SharedPreferences>(),
      gh<_i1001.GetCompanyvoucherTypeListDatasource>(),
      gh<_i1051.CreateCompanyVouchertypeDatasource>(),
      gh<_i189.IntegrationDatasource>(),
      gh<_i252.GetAllCompanySettingsDatasource>(),
      gh<_i640.CreateCompanySettingsDatasource>(),
      gh<_i284.GetCompanyList>(),
      gh<_i719.CreateGodownOrVehicle>(),
      gh<_i891.CreateRoute>(),
      gh<_i1064.GetAllGodowns>(),
      gh<_i504.GetAllRoutes>(),
      gh<_i123.ActivateGodown>(),
      gh<_i260.ActivateRoute>(),
      gh<_i6.DeactivateRoute>(),
      gh<_i440.DeactivateGodown>(),
      gh<_i323.DeleteGodown>(),
      gh<_i112.DeleteRoute>(),
      gh<_i853.GetVoucherNumbering>(),
      gh<_i220.CreateVoucherNumbering>(),
      gh<_i915.CompleteVoucherSettings>(),
      gh<_i931.SetVoucherNumberingMethod>(),
    ),
  );
  gh.lazySingleton<_i590.IAuthenticationFacad>(
    () => _i823.IAuthenticationImpl(
      gh<_i70.CompanyRegisteration>(),
      gh<_i42.OtpValidation>(),
      gh<_i13.ResendOtp>(),
      gh<_i526.LoginImpl>(),
      gh<_i244.ResetPassword>(),
      gh<_i976.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
      gh<_i492.LoginByToken>(),
    ),
  );
  return getIt;
}

class _$AppInjectionModule extends _i975.AppInjectionModule {}
