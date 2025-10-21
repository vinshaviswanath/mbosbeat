// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

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

import '../../data/data_sources/authentication/company_creation/company_info.dart'
    as _i158;
import '../../data/data_sources/authentication/company_creation/country_list.dart'
    as _i821;
import '../../data/data_sources/authentication/company_creation/state_list.dart'
    as _i94;
import '../../data/data_sources/authentication/company_registeration/company_registeration.dart'
    as _i70;
import '../../data/data_sources/authentication/login/login_impl.dart' as _i526;
import '../../data/data_sources/authentication/otp_validation/otp_validation.dart'
    as _i42;
import '../../data/data_sources/authentication/resend_otp/resend_otp.dart'
    as _i13;
import '../../data/data_sources/authentication/reset_password/reset_password.dart'
    as _i244;
import '../../data/data_sources/company_creation/company_creation.dart'
    as _i587;
import '../../data/local_db/app_db.dart' as _i264;
import '../../data/repositories/i_authentication_facad_impl.dart' as _i823;
import '../../data/repositories/i_companycreation_facad_impl.dart' as _i872;
import '../../domain/repositories/i_authentication_facad.dart' as _i590;
import '../../domain/repositories/i_companyCreation_facad.dart' as _i170;
import '../../data/repositories/i_company_creation_facad_impl.dart' as _i322;
import '../../domain/repositories/i_authentication_facad.dart' as _i590;
import '../../domain/repositories/i_company_creation_facad.dart' as _i483;
import '../base/run_safely.dart' as _i530;
import '../serveice/http_client.dart' as _i816;
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
  gh.singleton<_i264.AppDb>(() => _i264.AppDb());
  gh.lazySingleton<_i530.RunSafely>(() => _i530.RunSafely());
  gh.lazySingleton<_i519.Client>(() => appInjectionModule.clent);
  gh.lazySingleton<_i816.HttpClient>(
    () => _i816.HttpClient(gh<_i519.Client>()),
  );
  gh.lazySingleton<_i526.LoginImpl>(
    () => _i526.LoginImpl(
      gh<_i816.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
      gh<_i264.AppDb>(),
    ),
  );
  gh.lazySingleton<_i70.CompanyRegisteration>(
    () => _i70.CompanyRegisteration(
      gh<_i816.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i42.OtpValidation>(
    () => _i42.OtpValidation(
      gh<_i816.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i13.ResendOtp>(
    () => _i13.ResendOtp(
      gh<_i816.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i244.ResetPassword>(
    () => _i244.ResetPassword(
      gh<_i816.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i158.CompanyInfo>(
    () => _i158.CompanyInfo(
      gh<_i816.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
 gh.lazySingleton<_i587.CompanyCreation>(
    () => _i587.CompanyCreation(
      gh<_i816.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
gh.lazySingleton<_i821.CountryList>(
    () => _i821.CountryList(
      gh<_i816.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i94.StateList>(
    () => _i94.StateList(
      gh<_i816.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i483.ICompanyCreationFacad>(
    () => _i322.ICompanyCreationFacadImpl(
      gh<_i158.CompanyInfo>(),
      gh<_i821.CountryList>(),
      gh<_i94.StateList>(),
      gh<_i530.RunSafely>(),
      gh<_i816.HttpClient>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
gh.lazySingleton<_i590.IAuthenticationFacad>(
    () => _i823.IAuthenticationImpl(
      gh<_i70.CompanyRegisteration>(),
      gh<_i42.OtpValidation>(),
      gh<_i13.ResendOtp>(),
      gh<_i526.LoginImpl>(),
      gh<_i244.ResetPassword>(),
      gh<_i816.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i170.ICompanyCreationFacad>(
    () => _i872.ICompanyCreationImpl(
      gh<_i587.CompanyCreation>(),
      gh<_i816.HttpClient>(),
      gh<_i530.RunSafely>(),
      gh<_i460.SharedPreferences>(),
    ),
  );
  return getIt;
}

class _$AppInjectionModule extends _i975.AppInjectionModule {}
