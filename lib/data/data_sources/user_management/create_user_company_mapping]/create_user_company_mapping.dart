import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/base/run_safely.dart';
import 'package:mpos_beat/core/exception/custom_exception.dart';
import 'package:mpos_beat/core/failures/failures.dart';
import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/serveice/http_client.dart';
import 'package:mpos_beat/core/utils/extentions.dart';
import 'package:mpos_beat/core/utils/logger.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/core/utils/urls.dart';
import 'package:mpos_beat/data/models/user_master_response.dart';
import 'package:mpos_beat/domain/request/create_user_company_mapping_params.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class CreateUserCompanyMapping {
  final HttpClient httpClient;
  final RunSafely runSafely;
  final SharedPreferences sharedPreferences;
  CreateUserCompanyMapping(this.httpClient, this.runSafely, this.sharedPreferences);

  ResultFuture<UserMasterResponse> call(BaseParams<CreateUserCompanyMappingParams> param) {
    return runSafely(
      () async {
        final response = await httpClient.post(
          Urls.createUserCompanyMapping,
          data: param.toMap(),
        );

        if (response.isOk) {
          final data = UserMasterResponse.fromJson(response.data);
          Logger.logInfo("User Company mapping response : ${data.toJson()}");
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