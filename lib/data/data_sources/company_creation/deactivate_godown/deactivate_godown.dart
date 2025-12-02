import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/base/run_safely.dart';
import 'package:mpos_beat/core/exception/custom_exception.dart';
import 'package:mpos_beat/core/failures/failures.dart';
import 'package:mpos_beat/core/service/http_client.dart';
import 'package:mpos_beat/core/utils/extentions.dart';
import 'package:mpos_beat/core/utils/logger.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/core/utils/urls.dart';
import 'package:mpos_beat/data/models/create_godown_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class DeactivateGodown {
  final HttpClient httpClient;
  final RunSafely runSafely;
  final SharedPreferences sharedPreferences;
  DeactivateGodown(this.httpClient, this.runSafely, this.sharedPreferences);

  ResultFuture<GodownResponse> call({required String mid,}) {
    return runSafely(
      () async {
        final response = await httpClient.post(
          "${Urls.deactivateGodown1}$mid${Urls.deactivateGodown2}",
        );

        if (response.isOk) {
          final data = GodownResponse.fromJson(response.data);
          Logger.logInfo("Godown Dectivation response : ${data.toJson()}");
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