import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/base/run_safely.dart';
import 'package:mpos_beat/core/exception/custom_exception.dart';
import 'package:mpos_beat/core/failures/failures.dart';
import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/service/http_client.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/core/utils/urls.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/mappers/party_master_sync_mapper.dart';
import 'package:mpos_beat/data/models/party_MasterSync_model.dart';
import 'package:mpos_beat/domain/request/party_MasterSync_params.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class PartyMasterSync {
  final HttpClient httpClient;
  final RunSafely runSafely;
  final SharedPreferences sharedPreferences;
  final AppDb appDb;

  PartyMasterSync(
    this.httpClient,
    this.runSafely,
    this.sharedPreferences, {
    required this.appDb,
  });

  ResultFuture<PartyMasterSyncModel> call(
    BaseParams<PartyMasterSyncParams> params,
  ) {
    return runSafely(() async {
      int page = 1;
      bool hasMore = true;
      PartyMasterSyncModel? lastResponse;

      await appDb.partyMasterDao.clearParties();

      while (hasMore) {
        final body = {
          "CompanyID": params.data.companyId,
          "PageNumber": page,
          "LastSyncDateTime": params.data.lastSyncDateTime
              .toUtc()
              .toIso8601String(),
        };
        Logger.logInfo("📡 PartyMaster Page $page request: $body");

        final response = await httpClient.getWithBody(
          Urls.partyMasterSync,
          body: body,
        );

        //  Logger.logInfo("PartyMasterSync Raw Response: ${response.body}");
   if (!response.isOk) {
      throw CustomException(errMsg: response.message);
    }

          final data = PartyMasterSyncModel.fromJson(response.data);
          lastResponse = data;

          Logger.logInfo("🧮 Page $page API rows: ${data.partyList.length}");

          // Stop when backend sends empty page
          if (data.partyList.isEmpty) {
            hasMore = false;
            break;
          }

          final companions = data.partyList
              .map((e) => e.toCompanion())
              .toList();

          Logger.logInfo("📦 Companion count: ${companions.length}");

          if (companions.isEmpty) {
            Logger.logInfo("❌ Mapper produced empty list");
          }
          //await appDb.partyMasterDao.clearParties();
          await appDb.partyMasterDao.insertOrUpdateParties(companions);
      //    await appDb.partyMasterDao.printAllPartyMasters();
          page++;
        }

        final rows = await appDb.partyMasterDao.getAllParties();

        Logger.logInfo("📥 After insert rows in DB: ${rows.length}");
        return lastResponse!;
      },

      failure:
      (error) {
        if (error.toLowerCase() == 'invalid referrel code!') {
          return InvalidReferralCode(errorMsg: error);
        }
        return MainFailure.genericError(errorMsg: error);
      }
    );
  }
}
