import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/base/run_safely.dart';
import 'package:mpos_beat/core/exception/custom_exception.dart';
import 'package:mpos_beat/core/failures/failures.dart';
import 'package:mpos_beat/core/serveice/http_client.dart';
import 'package:mpos_beat/core/utils/extentions.dart';
import 'package:mpos_beat/core/utils/logger.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/core/utils/urls.dart';
import 'package:mpos_beat/data/models/create_voucher_numbering_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class SetVoucherNumberingMethod {
  final HttpClient httpClient;
  final RunSafely runSafely;
  final SharedPreferences sharedPreferences;
  SetVoucherNumberingMethod(
    this.httpClient,
    this.runSafely,
    this.sharedPreferences,
  );

  ResultFuture<ResponseModel> call({
    required String voucherMode,
    required String companyId,
  }) {
    return runSafely(
      () async {
        final response = await httpClient.post(
          "${Urls.setVoucherNumberingMethod1}$companyId${Urls.setVoucherNumberingMethod2}$voucherMode",
        );

        if (response.isOk) {
          final data = ResponseModel.fromJson(response.data);
          Logger.logInfo("Set voucher numbering method : ${data.toJson()}");
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
