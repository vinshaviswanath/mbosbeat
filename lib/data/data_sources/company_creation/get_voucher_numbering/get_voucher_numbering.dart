import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/base/run_safely.dart';
import 'package:mpos_beat/core/exception/custom_exception.dart';
import 'package:mpos_beat/core/failures/failures.dart';
import 'package:mpos_beat/core/service/http_client.dart';
import 'package:mpos_beat/core/utils/extentions.dart';
import 'package:mpos_beat/core/utils/logger.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/core/utils/urls.dart';
import 'package:mpos_beat/data/models/voucher_numbering_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class GetVoucherNumbering {
  final HttpClient httpClient;
  final RunSafely runSafely;
  final SharedPreferences sharedPreferences;
  GetVoucherNumbering(this.httpClient, this.runSafely, this.sharedPreferences);

  ResultFuture<VoucherNumberingResponse> call({
    required String companyId,
    required String voucherMode,
    required int voucherModeId,
  }) {
    return runSafely(
      () async {
        final response = await httpClient.post(
          "${Urls.getVoucherNumbering1}${Urls.getVoucherNumbering2}$companyId${Urls.getVoucherNumbering3}$voucherMode${Urls.getVoucherNumbering4}$voucherModeId",
        );
        Logger.logInfo(
          "URL: ${Urls.getVoucherNumbering1}${Urls.getVoucherNumbering2}$companyId${Urls.getVoucherNumbering3}$voucherMode${Urls.getVoucherNumbering4}$voucherModeId",
        );
        
        if (response.isOk) {
          final data = VoucherNumberingResponse.fromJson(response.data);
          Logger.logInfo("Voucher Numbering Respons : ${data.toJson()}");
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
