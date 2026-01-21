
import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/base/run_safely.dart';
import 'package:mpos_beat/core/exception/custom_exception.dart';
import 'package:mpos_beat/core/failures/failures.dart';
import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/service/http_client.dart';
import 'package:mpos_beat/core/utils/extentions.dart';
import 'package:mpos_beat/core/utils/logger.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/core/utils/urls.dart';
import 'package:mpos_beat/data/models/response.dart';
import 'package:mpos_beat/domain/request/update_registraion_params.dart';

@lazySingleton
class UpdateRegistrationDetails{ 
 final HttpClient httpClient;
  final RunSafely runSafely;
  UpdateRegistrationDetails(this.httpClient, this.runSafely);
  ResultFuture<DefaultResponse> call(BaseParams<UpdateRegistrationParams> param) {
    return runSafely(
      () async {
    
        final response = await httpClient.post(
          Urls.updateRegistrationDetails,
          data: param.data.toMap(),
        );

        if (response.isOk) {
          Logger.logInfo(response.message);
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