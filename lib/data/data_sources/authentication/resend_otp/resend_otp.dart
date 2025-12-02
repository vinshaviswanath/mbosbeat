import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/base/run_safely.dart';
import 'package:mpos_beat/core/exception/custom_exception.dart';
import 'package:mpos_beat/core/failures/failures.dart';
import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/service/http_client.dart';
import 'package:mpos_beat/core/utils/extentions.dart';
import 'package:mpos_beat/core/utils/logger.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/core/utils/urls.dart';
import 'package:mpos_beat/data/models/login_response.dart';
import 'package:mpos_beat/data/models/otp_response.dart';
import 'package:mpos_beat/domain/request/resend_otp_params.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class ResendOtp {
  final HttpClient httpClient;
  final RunSafely runSafely;
  final SharedPreferences sharedPreferences;
  ResendOtp(this.httpClient, this.runSafely, this.sharedPreferences);

  ResultFuture<LoginResponse> call(BaseParams<ResendOtpParams> param) {
    return runSafely(
      () async {
        final response = await httpClient.post(
          Urls.resendOtp,
          data: param.toMap(),
        );

        if (response.isOk) {
          final data = LoginResponse.fromJson(response.data);
          return data;
        }

        throw CustomException(errMsg: response.message);
      },
      failure: (error) {
        Logger.logWarning("Errroooorrrrrr $error");
        if (error.toLowerCase() == 'Invalid Referrel Code!'.toLowerCase()) {
          return InvalidReferralCode(errorMsg: error);
        }
        return MainFailure.genericError(errorMsg: error);
      },
    );
  }
}
