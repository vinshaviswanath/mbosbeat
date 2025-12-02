import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/base/run_safely.dart';
import 'package:mpos_beat/core/exception/custom_exception.dart';
import 'package:mpos_beat/core/failures/failures.dart';
import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/service/http_client.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/core/utils/urls.dart';
import 'package:mpos_beat/data/models/integration_model.dart';
import 'package:mpos_beat/domain/request/integration_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class IntegrationDatasource {
  final HttpClient httpClient;
  final RunSafely runSafely;
  final SharedPreferences sharedPreferences;

  IntegrationDatasource(
    this.httpClient,
    this.runSafely,
    this.sharedPreferences,
  );

  ResultFuture<IntegrationDtos> call(BaseParams<IntegrationParams> param) {
    return runSafely(
      () async {
        final response = await httpClient.post(
          Urls.integrationType,
          data: param.toMap(),
        );

        if (response.isOk) {
          final data = IntegrationDtos.fromJson(response.data);
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
