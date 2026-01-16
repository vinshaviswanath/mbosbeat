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
import 'package:mpos_beat/data/models/response.dart';
import 'package:mpos_beat/domain/request/trip_end_params.dart';
import 'package:mpos_beat/domain/request/trip_start_params.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class TripEnd {
  final HttpClient httpClient;
  final RunSafely runSafely;
  final SharedPreferences sharedPreferences;
  TripEnd(this.httpClient, this.runSafely, this.sharedPreferences);

  ResultFuture<DefaultResponse> call(BaseParams<TripEndParams> param) {
    return runSafely(
      () async {
        final response = await httpClient.post(
        Urls.endTrip,
        data: param.data.toMap()
      );

        if (response.isOk) {
          final data = DefaultResponse.fromJson(response.data);
          Logger.logInfo("User end trip marked : ${data.toJson()}");
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