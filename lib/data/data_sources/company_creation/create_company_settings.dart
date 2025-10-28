import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/base/run_safely.dart';
import 'package:mpos_beat/core/exception/custom_exception.dart';
import 'package:mpos_beat/core/failures/failures.dart';
import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/serveice/http_client.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/core/utils/urls.dart';
import 'package:mpos_beat/data/models/create_companySettings_model.dart';
import 'package:mpos_beat/domain/request/create_company_settings_request.dart';
import 'package:shared_preferences/shared_preferences.dart';
@lazySingleton
class CreateCompanySettingsDatasource {
  final HttpClient httpClient;
  final RunSafely runSafely;
  final SharedPreferences sharedPreferences;
  CreateCompanySettingsDatasource(
    this.httpClient,
    this.runSafely,
    this.sharedPreferences,
  );
  ResultFuture<CreateCompanySettingsDtos> call(
    BaseParams<CreateCompanysettingsParams> param,
  ) {
    return runSafely(
      () async {
        final response = await httpClient.post(
          Urls.createCompanySettings,
          data: param.toMap(),
        );
        if (response.isOk) {
          final data = CreateCompanySettingsDtos.fromJson(response.data);
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
