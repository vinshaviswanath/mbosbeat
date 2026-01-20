import 'package:mpos_beat/core/service/http_client.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/base/run_safely.dart';
import 'package:mpos_beat/core/exception/custom_exception.dart';
import 'package:mpos_beat/core/failures/failures.dart';
import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/utils/extentions.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/core/utils/urls.dart';
import 'package:mpos_beat/data/models/response.dart';
import 'package:mpos_beat/domain/request/bank_details_params.dart';

@lazySingleton
class UpdateBankDetails {
  final HttpClient httpClient;
  final RunSafely runSafely;

  UpdateBankDetails(this.httpClient, this.runSafely);

  ResultFuture<DefaultResponse> call(BaseParams<BankDetailsParams> param) {
    return runSafely(
      () async {
        

        final response = await httpClient.post(
          Urls.updateBankDetails,
          data: param.toMap()
        );

        if (response.isOk) {
          Logger.logInfo("Updated bank details successfull");
          return DefaultResponse.fromJson(response.data);
        }

        throw CustomException(errMsg: response.message);
      },
      failure: (error) {
        return MainFailure.genericError(errorMsg: error);
      },
    );
  }
}
