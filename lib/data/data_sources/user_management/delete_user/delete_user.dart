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
import 'package:mpos_beat/data/models/designation_response.dart';
import 'package:mpos_beat/domain/request/delete_user_param.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class DeleteUser {
  final HttpClient httpClient;
  final RunSafely runSafely;
  final SharedPreferences sharedPreferences;
  DeleteUser(this.httpClient, this.runSafely, this.sharedPreferences);

  ResultFuture<DesignationResponse> call(BaseParams<DeleteUserParam> param) {
    return runSafely(
      () async {
        final response = await httpClient.postFormData(
        Urls.deleteUser,
        fields: param.toMap(),
      );

        if (response.isOk) {
          final data = DesignationResponse.fromJson(response.data);
          Logger.logInfo("User Delete response : ${data.toJson()}");
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