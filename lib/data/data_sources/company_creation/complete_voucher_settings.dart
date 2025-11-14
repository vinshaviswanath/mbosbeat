import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/base/run_safely.dart';
import 'package:mpos_beat/core/exception/custom_exception.dart';
import 'package:mpos_beat/core/failures/failures.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/core/utils/urls.dart';
import 'package:mpos_beat/data/models/complete_voucher_settings_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mpos_beat/core/serveice/http_client.dart';

@lazySingleton
class CompleteVoucherSettings {
  final HttpClient httpClient;
  final RunSafely runSafely;
  final SharedPreferences sharedPreferences;

  CompleteVoucherSettings(
    this.httpClient,
    this.runSafely,
    this.sharedPreferences,
  );

  ResultFuture<CompleteVoucherSettingsDtos> call(int companyId) {
    return runSafely(
      () async {
        final response = await httpClient.post(
          "${Urls.completeVoucherSettings}${companyId}",
        );

        if (response.isOk) {
          final data = CompleteVoucherSettingsDtos.fromJson(response.data);
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
