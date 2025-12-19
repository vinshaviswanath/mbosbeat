import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/base/run_safely.dart';
import 'package:mpos_beat/core/exception/custom_exception.dart';
import 'package:mpos_beat/core/failures/failures.dart';
import 'package:mpos_beat/core/service/http_client.dart';
import 'package:mpos_beat/core/utils/extentions.dart';
import 'package:mpos_beat/core/utils/logger.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/core/utils/urls.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/models/user_settings_list_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class GetUserSettings {
  final HttpClient httpClient;
  final RunSafely runSafely;
  final SharedPreferences sharedPreferences;
  final AppDb appDb;

  GetUserSettings(
    this.httpClient,
    this.runSafely,
    this.sharedPreferences,
    this.appDb,
  );

  ResultFuture<UserSettingsResponse> call({required String userId}) {
    return runSafely(
      () async {
        final response = await httpClient.get('${Urls.getUserSettingsList}$userId');

        if (response.isOk) {
          final data = UserSettingsResponse.fromJson(response.data);
          Logger.logInfo("User Settings List : ${data.toJson()}");

          if (data.userSettingsList.isNotEmpty) {
            final id = int.parse(userId);

            /// 1. Clear old
            await appDb.userSettingsDao.clearAll();

            /// 2. Insert new settings
            await appDb.userSettingsDao.insertSettings(
              data.userSettingsList.map((e) => UserSettingsTableCompanion(
                id: Value(e.id),
                userId: Value(id),
                menuName: Value(e.menuName),
                buttonType: Value(e.buttonType),
                description: Value(e.description),
                orderNo: Value(e.orderNo),
                active: Value(e.active),
                value: Value(e.value),
              )).toList(),
            );

            /// 3. Print inserted data
            await appDb.userSettingsDao.printAllSettings();
          }

          return data;
        }

        throw CustomException(errMsg: response.message);
      },
      failure: (error) {
        if (error.toLowerCase() == 'invalid referrel code!'.toLowerCase()) {
          return InvalidReferralCode(errorMsg: error);
        }
        return MainFailure.genericError(errorMsg: error);
      },
    );
  }
}
