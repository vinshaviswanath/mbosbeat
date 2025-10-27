import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/base/run_safely.dart';
import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/serveice/http_client.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/data/data_sources/authentication/company_registeration/company_registeration.dart';
import 'package:mpos_beat/data/data_sources/authentication/login/login_impl.dart';
import 'package:mpos_beat/data/data_sources/authentication/login_by_token/login_by_token.dart';
import 'package:mpos_beat/data/data_sources/authentication/otp_validation/otp_validation.dart';
import 'package:mpos_beat/data/data_sources/authentication/resend_otp/resend_otp.dart';
import 'package:mpos_beat/data/data_sources/authentication/reset_password/reset_password.dart';
import 'package:mpos_beat/data/models/company_registration_response.dart';
import 'package:mpos_beat/data/models/login_response.dart';
import 'package:mpos_beat/data/models/otp_response.dart';
import 'package:mpos_beat/data/models/response_data.dart';
import 'package:mpos_beat/domain/repositories/i_authentication_facad.dart';
import 'package:mpos_beat/domain/request/company_registration_params.dart';
import 'package:mpos_beat/domain/request/login_by_token_param.dart';
import 'package:mpos_beat/domain/request/login_params.dart';
import 'package:mpos_beat/domain/request/otp_validation_params.dart';
import 'package:mpos_beat/domain/request/resend_otp_params.dart';
import 'package:mpos_beat/domain/request/reset_password_params.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: IAuthenticationFacad)
class IAuthenticationImpl implements IAuthenticationFacad {
  final CompanyRegisteration companyRegisteration;
  final OtpValidation otpValidate;
  final ResendOtp resendOTP;
  final LoginImpl loginImpl;
  final LoginByToken loginToken;
  final ResetPassword resetPass;
  final HttpClient httpClient;
  final RunSafely runSafely;
  final SharedPreferences sharedPreferences;
  IAuthenticationImpl(
    this.companyRegisteration,
    this.otpValidate,
    this.resendOTP,
    this.loginImpl,
    this.resetPass,
    this.httpClient,
    this.runSafely,
    this.sharedPreferences, this.loginToken,
  );

  @override
  ResultFuture<CompanyRegistrationResponse> companyRegistration(
    BaseParams<CompanyRegistrationParams> params,
  ) {
    return companyRegisteration(params);
  }

  @override
  ResultFuture<OtpResponse> otpValidation(BaseParams<OtpParams> params) {
    return otpValidate(params);
  }

  @override
  ResultFuture<OtpResponse> resendOtp(BaseParams<ResendOtpParams> params) {
    return resendOTP(params);
  }

  @override
  ResultFuture<ResponseData> resetPassword(
    BaseParams<ResetPasswordParam> params,
  ) {
    return resetPass(params);
  }

  @override
  ResultFuture<LoginResponse> login(BaseParams<LoginParams> params) {
    return loginImpl(params);
  }

    @override
  ResultFuture<LoginResponse> loginByToken(
    BaseParams<LoginByTokenParam> params
  ) {
    return loginToken(params);
  }
}
