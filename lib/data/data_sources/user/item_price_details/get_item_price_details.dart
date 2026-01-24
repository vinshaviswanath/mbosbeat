import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/base/run_safely.dart';
import 'package:mpos_beat/core/exception/custom_exception.dart';
import 'package:mpos_beat/core/failures/failures.dart';
import 'package:mpos_beat/core/service/http_client.dart';
import 'package:mpos_beat/core/utils/extentions.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/core/utils/urls.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/mappers/item_price_details_mapper/item_price_details_mapper.dart';
import 'package:mpos_beat/data/models/item_price_details_model.dart';

@lazySingleton
class GetItemPriceDetails {
  final HttpClient httpClient;
  final RunSafely runSafely;
  final AppDb appDb;

  GetItemPriceDetails(this.httpClient, this.runSafely, this.appDb);

  ResultFuture<ItemPriceDetailsModel> call({required int companyId}) {
    return runSafely(
      () async {
        final response = await httpClient.get(
          Urls.itemPriceDetails,
          queryParameters: {"CompanyID": companyId.toString()},
        );

        if (!response.isOk) {
          throw CustomException(errMsg: response.message);
        }

        final data = ItemPriceDetailsModel.fromJson(response.data);

        final companions =
            data.priceListDetailModels.map((e) => e.toCompanion()).toList();

        if (companions.isNotEmpty) {
          await appDb.transaction(() async {
            await appDb.priceListDetailsDao.clearAll();
            await appDb.priceListDetailsDao.insertPriceListDetails(companions);
          });
        }

        return data;
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

