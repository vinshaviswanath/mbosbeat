import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/base/run_safely.dart';
import 'package:mpos_beat/core/exception/custom_exception.dart';
import 'package:mpos_beat/core/failures/failures.dart';
import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/serveice/http_client.dart';
import 'package:mpos_beat/core/utils/extentions.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/core/utils/urls.dart';
import 'package:mpos_beat/data/models/response_data.dart';
import 'package:mpos_beat/domain/request/reset_password_params.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class ResetPassword {
  final HttpClient httpClient;
  final RunSafely runSafely;
  final SharedPreferences sharedPreferences;
  ResetPassword(this.httpClient, this.runSafely, this.sharedPreferences);

  ResultFuture<ResponseData> call(BaseParams<ResetPasswordParam> param) {
    return runSafely(
      () async {
        final response = await httpClient.post(
          Urls.resetPassword,
          data: param.toMap(),
        );

        if (response.isOk) {
          final data = ResponseData.fromJson(response.data);
          return data;
        }

        throw CustomException(errMsg: response.message);
      },
      failure: (error) {
        if (error.toLowerCase() == 'Invalid Referrel Code!'.toLowerCase()) {
          return InvalidReferralCode(errorMsg: error);
        }
        return MainFailure.genericError(errorMsg: error);
      },
    );
  }
}
