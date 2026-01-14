import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/base/run_safely.dart';
import 'package:mpos_beat/core/exception/custom_exception.dart';
import 'package:mpos_beat/core/failures/failures.dart';
import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/service/http_client.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/core/utils/urls.dart';
import 'package:mpos_beat/data/models/party_MasterSync_model.dart';
import 'package:mpos_beat/domain/request/party_MasterSync_params.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
@lazySingleton
class PartyMasterSync {
  final HttpClient httpClient;
  final RunSafely runSafely;
  final SharedPreferences sharedPreferences;

  PartyMasterSync(this.httpClient, this.runSafely, this.sharedPreferences);

  ResultFuture<PartyMasterSyncModel> call(
    BaseParams<PartyMasterSyncParams> params,
  ) {
    return runSafely(
      () async {
        final body = {
          "CompanyID": params.data.companyId,
          "PageNumber": params.data.pageNumber,
          "LastSyncDateTime": params.data.lastSyncDateTime
              .toUtc()
              .toIso8601String(),
        };

        Logger.logInfo("PartyMasterSync Body: $body");

        final response = await httpClient.getWithBody(
          Urls.partyMasterSync,
          body: {
            "CompanyID": params.data.companyId,
            "PageNumber": params.data.pageNumber,
            "LastSyncDateTime": params.data.lastSyncDateTime
                .toUtc()
                .toIso8601String(),
          },
        );

        Logger.logInfo("PartyMasterSync Raw Response: ${response.body}");

        if (response.isOk) {
          return PartyMasterSyncModel.fromJson(response.data);
        }

        throw CustomException(errMsg: response.message);
      },
      failure: (error) {
        if (error.toLowerCase() == 'invalid referrel code!') {
          return InvalidReferralCode(errorMsg: error);
        }
        return MainFailure.genericError(errorMsg: error);
      },
    );
  }
}
