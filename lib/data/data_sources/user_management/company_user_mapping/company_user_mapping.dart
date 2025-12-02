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
import 'package:mpos_beat/data/models/company_creation_response.dart';
import 'package:mpos_beat/data/models/create_godown_response.dart';
import 'package:mpos_beat/domain/request/create_comany_user_mapping_params.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class CreateCompanyUserMapping {
  final HttpClient httpClient;
  final RunSafely runSafely;
  final SharedPreferences sharedPreferences;
  CreateCompanyUserMapping(this.httpClient, this.runSafely, this.sharedPreferences);

  ResultFuture<CompanyInfoDtos> call(BaseParams<CreateComanyUserMappingParams> param) {
    return runSafely(
      () async {
        final response = await httpClient.post(
          Urls.createCompanyUserMapping,
          data: param.toMap(),
        );

        if (response.isOk) {
          final data = CompanyInfoDtos.fromJson(response.data);
          Logger.logInfo("Company user mapping response : ${data.toJson()}");
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
