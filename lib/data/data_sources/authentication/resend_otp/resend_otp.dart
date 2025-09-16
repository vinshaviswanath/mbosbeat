import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/base/run_safely.dart';
import 'package:mpos_beat/core/exception/custom_exception.dart';
import 'package:mpos_beat/core/failures/failures.dart';
import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/serveice/dio_client.dart';
import 'package:mpos_beat/core/utils/extentions.dart';
import 'package:mpos_beat/core/utils/logger.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/core/utils/urls.dart';
import 'package:mpos_beat/data/models/otp_response.dart';
import 'package:mpos_beat/domain/request/resend_otp_params.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class ResendOtp {
  final DioClient dioClient;
  final RunSafely runSafely;
  final SharedPreferences sharedPreferences;
  ResendOtp(this.dioClient, this.runSafely, this.sharedPreferences);

  ResultFuture<OtpResponse> call(BaseParams<ResendOtpParams> param) {
    return runSafely(
      () async {
        final response = await dioClient.post(
          Urls.resendOtp,
          data: param.toMap(),
        );

        if (response.isOk) {
          final data = OtpResponse.fromJson(response.data);
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
