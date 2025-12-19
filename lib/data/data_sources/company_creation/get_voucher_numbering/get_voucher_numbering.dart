import 'package:drift/drift.dart';
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
import 'package:mpos_beat/data/models/voucher_numbering_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class GetVoucherNumbering {
  final HttpClient httpClient;
  final RunSafely runSafely;
  final SharedPreferences sharedPreferences;
  final AppDb appDb;
  GetVoucherNumbering(
    this.httpClient,
    this.runSafely,
    this.sharedPreferences,
    this.appDb,
  );

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
          if(voucherMode == "Godown"){

          await appDb.godownVoucherTypesDao.deleteAll();
          final vouchers = data.voucherNumberingModels.map((e) {
            return GodownVoucherTypesCompanion.insert(
              companyId: Value(e.companyId),
              voucherTypeId: Value(e.voucherTypeId),
              voucherMenuName: Value(e.voucherMenuName),
              voucherMode: Value(e.voucherMode),
              voucherModeId: Value(e.voucherModeId),
              voucherModeName: Value(e.voucherModeName),
              applicableFrom: Value(e.applicableFrom),

              hasB2B: Value(e.hasB2B),

              b2BPrefix: Value(e.b2BPrefix),
              b2BSuffix: Value(e.b2BSuffix),
              b2BWidth: Value(e.b2BWidth),
              b2BStartFrom: Value(e.b2BStartFrom),

              b2CPrefix: Value(e.b2CPrefix),
              b2CSuffix: Value(e.b2CSuffix),
              b2CWidth: Value(e.b2CWidth),
              b2CStartFrom: Value(e.b2CStartFrom),

              b2BDeclaration: Value(e.b2BDeclaration),
              b2CDeclaration: Value(e.b2CDeclaration),
            );
          }).toList();

          await appDb.godownVoucherTypesDao.insertAll(vouchers);
          await appDb.godownVoucherTypesDao.printAllGodownVoucherTypes();
          }else{
             await appDb.routeVoucherTypesDao.deleteAll();
          final vouchers = data.voucherNumberingModels.map((e) {
            return RouteVoucherTypesCompanion.insert(
              companyId: Value(e.companyId),
              voucherTypeId: Value(e.voucherTypeId),
              voucherMenuName: Value(e.voucherMenuName),
              voucherMode: Value(e.voucherMode),
              voucherModeId: Value(e.voucherModeId),
              voucherModeName: Value(e.voucherModeName),
              applicableFrom: Value(e.applicableFrom),

              hasB2B: Value(e.hasB2B),

              b2BPrefix: Value(e.b2BPrefix),
              b2BSuffix: Value(e.b2BSuffix),
              b2BWidth: Value(e.b2BWidth),
              b2BStartFrom: Value(e.b2BStartFrom),

              b2CPrefix: Value(e.b2CPrefix),
              b2CSuffix: Value(e.b2CSuffix),
              b2CWidth: Value(e.b2CWidth),
              b2CStartFrom: Value(e.b2CStartFrom),

              b2BDeclaration: Value(e.b2BDeclaration),
              b2CDeclaration: Value(e.b2CDeclaration),
            );
          }).toList();

          await appDb.routeVoucherTypesDao.insertAll(vouchers);
          await appDb.routeVoucherTypesDao.printAllRouteVoucherTypes();
          }

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
