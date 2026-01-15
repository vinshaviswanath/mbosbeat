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
import 'package:mpos_beat/data/models/data/get_all_company_settings_data.dart';
import 'package:mpos_beat/data/models/get_all_company_settings_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class GetAllCompanySettingsDatasource {
  final HttpClient httpClient;
  final RunSafely runSafely;
  final SharedPreferences sharedPreferences;
  final AppDb appDb;

  GetAllCompanySettingsDatasource(
    this.httpClient,
    this.runSafely,
    this.sharedPreferences,
    this.appDb,
  );

  ResultFuture<CompanysettingslistDtos> call(int companyId) {
    return runSafely(
      () async {
        final response = await httpClient.get(
          '${Urls.getAllCompanySettings}${companyId}',
        );
        if (response.isOk) {
          final data = CompanysettingslistDtos.fromJson(response.data);

          final companions = data.companySettingsList.map((e) {
            return CompanySettingsTableCompanion.insert(
              id: e.id,
              companyId: e.companyId,
              settingsMenuName: e.settingsMenuName,
              buttonType: buttonTypeValues.reverse[e.buttonType]!,
              description: e.description,
              parentId: e.parentId,
              orderNo: e.orderNo,
              menuType: menuTypeValues.reverse[e.menuType]!,
              settingsValue: e.settingsValue,
            );
          }).toList();

          await appDb.companySettingsDao.deleteAll();
          await appDb.companySettingsDao.insertAll(companions);
         // await appDb.companySettingsDao.printAll();
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
