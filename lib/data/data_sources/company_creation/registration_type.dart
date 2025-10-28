import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/base/run_safely.dart';
import 'package:mpos_beat/core/exception/custom_exception.dart';
import 'package:mpos_beat/core/failures/failures.dart';
import 'package:mpos_beat/core/serveice/http_client.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/core/utils/urls.dart';
import 'package:mpos_beat/data/models/registration_type_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class RegistrationTypeDatasource {
  final HttpClient httpClient;
  final RunSafely runSafely;
  final SharedPreferences sharedPreferences;

  RegistrationTypeDatasource(
    this.httpClient,
    this.runSafely,
    this.sharedPreferences,
  );

  ResultFuture<RegistrationTypeDtos> call(int countryId) {
    return runSafely(
      () async {
        final response = await httpClient.get(
          '${Urls.registrationType}$countryId',
        );

        if (response.isOk) {
          final data = RegistrationTypeDtos.fromJson(response.data);
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
