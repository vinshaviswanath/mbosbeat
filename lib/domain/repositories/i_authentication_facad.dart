import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/data/models/company_registration_response.dart';
import 'package:mpos_beat/data/models/otp_response.dart';
import 'package:mpos_beat/data/models/response_data.dart';
import 'package:mpos_beat/domain/request/company_registration_params.dart';
import 'package:mpos_beat/domain/request/otp_validation_params.dart';
import 'package:mpos_beat/domain/request/resend_otp_params.dart';
import 'package:mpos_beat/domain/request/reset_password_params.dart';

interface class IAuthenticationFacad {
  ResultFuture<CompanyRegistrationResponse> companyRegistration(BaseParams<CompanyRegistrationParams> params) {
    throw UnimplementedError();
  }

   ResultFuture<OtpResponse> otpValidation(BaseParams<OtpParams> params) {
    throw UnimplementedError();
  }

     ResultFuture<OtpResponse> resendOtp(BaseParams<ResendOtpParams> params) {
    throw UnimplementedError();
  }

       ResultFuture<ResponseData> resetPassword(BaseParams<ResetPasswordParam> params) {
    throw UnimplementedError();
  }
}