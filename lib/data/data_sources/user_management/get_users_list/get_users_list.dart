import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/base/run_safely.dart';
import 'package:mpos_beat/core/exception/custom_exception.dart';
import 'package:mpos_beat/core/failures/failures.dart';
import 'package:mpos_beat/core/service/http_client.dart';
import 'package:mpos_beat/core/utils/extentions.dart';
import 'package:mpos_beat/core/utils/logger.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/core/utils/urls.dart';
import 'package:mpos_beat/data/models/users_list_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class GetAllUsers {
  final HttpClient httpClient;
  final RunSafely runSafely;
  final SharedPreferences sharedPreferences;
  GetAllUsers(this.httpClient, this.runSafely, this.sharedPreferences);

  ResultFuture<UsersListModel> call() {
    return runSafely(
      () async {
        final response = await httpClient.get(
          Urls.getAllUsers,
        );

        if (response.isOk) {
          final data = UsersListModel.fromJson(response.data);
          Logger.logInfo("Users List : ${data.toJson()}");
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
