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
import 'package:mpos_beat/data/mappers/price_level_mapper/price_level_mapper.dart';
import 'package:mpos_beat/data/models/price_level_model.dart';

@lazySingleton
class GetPriceLevel {
  final HttpClient httpClient;
  final RunSafely runSafely;
  final AppDb appDb;
  GetPriceLevel(this.httpClient, this.runSafely, this.appDb);

  ResultFuture<PriceLevelModel> call({required int companyId}) {
    return runSafely(
      () async {
        final response = await httpClient.get(
          Urls.priceLevel,
          queryParameters: {"CompanyID": companyId.toString()},
        );

        if (response.isOk) {
          final data = PriceLevelModel.fromJson(response.data);
          //  Logger.logInfo("Route List : ${data.toJson()}");
          final companions = data.priceLevels
              .map((e) => e.toCompanion())
              .toList();
          if (companions.isNotEmpty) {
            await appDb.priceLevelDao.clear();
            await appDb.priceLevelDao.upsertPriceLevels(companions);
          }

          final count = await appDb.priceLevelDao.getCount();
          Logger.logInfo("Price levels synced: $count");

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
