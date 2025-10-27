import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/base/run_safely.dart';
import 'package:mpos_beat/core/exception/custom_exception.dart';
import 'package:mpos_beat/core/failures/failures.dart';
import 'package:mpos_beat/core/serveice/http_client.dart';
import 'package:mpos_beat/core/utils/extentions.dart';
import 'package:mpos_beat/core/utils/logger.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/core/utils/urls.dart';
import 'package:mpos_beat/data/models/user_designation_list_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class GetUserDesignationList {
  final HttpClient httpClient;
  final RunSafely runSafely;
  final SharedPreferences sharedPreferences;
  GetUserDesignationList(this.httpClient, this.runSafely, this.sharedPreferences);

  ResultFuture<UserDesignationListModel> call() {
    return runSafely(
      () async {
        final response = await httpClient.get(
          Urls.getUserDesignationList,
        );

        if (response.isOk) {
          final data = UserDesignationListModel.fromJson(response.data);
          Logger.logInfo("Designation List : ${data.toJson()}");
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
