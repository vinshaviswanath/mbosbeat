import 'package:mpos_beat/core/base/run_safely.dart';
import 'package:mpos_beat/core/exception/custom_exception.dart';
import 'package:mpos_beat/core/failures/failures.dart';
import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/utils/extentions.dart';
import 'package:mpos_beat/core/utils/logger.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/core/utils/urls.dart';
import 'package:mpos_beat/data/models/company_creation_response.dart';
import 'package:mpos_beat/domain/request/company_creation_params.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mpos_beat/core/serveice/http_client.dart';

class CompanyCreation {
  final HttpClient httpClient;
  final RunSafely runSafely;
  final SharedPreferences sharedPreferences;

  CompanyCreation(this.httpClient, this.runSafely, this.sharedPreferences);

  ResultFuture<CompanyCreationResponse> companyInfo(
    BaseParams<CompanyCreationParams> param,
  ) {
    return runSafely(
      () async {
        final response = await httpClient.post(
          Urls.companyCreation,
          data: param.toMap(),
        );

        if (response.isOk) {
          final data = CompanyCreationResponse.fromJson(response.data);
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
