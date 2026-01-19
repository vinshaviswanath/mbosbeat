import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/base/run_safely.dart';
import 'package:mpos_beat/core/exception/custom_exception.dart';
import 'package:mpos_beat/core/failures/failures.dart';
import 'package:mpos_beat/core/service/http_client.dart';
import 'package:mpos_beat/core/utils/extentions.dart';
import 'package:mpos_beat/core/utils/logger.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/core/utils/urls.dart';
import 'package:mpos_beat/data/models/skip_reason_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class SkipReason {
  final HttpClient httpClient;
  final RunSafely runSafely;
  final SharedPreferences sharedPreferences;
  SkipReason(this.httpClient, this.runSafely, this.sharedPreferences);

  ResultFuture<SkipReasonResponse> call() {
    return runSafely(
      () async {
        final response = await httpClient.get(
          Urls.skipReason,
        );

        if (response.isOk) {
          final data = SkipReasonResponse.fromJson(response.data);
          Logger.logInfo("Skip Reason List : ${data.toJson()}");
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
