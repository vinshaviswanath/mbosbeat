import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/base/run_safely.dart';
import 'package:mpos_beat/core/exception/custom_exception.dart';
import 'package:mpos_beat/core/failures/failures.dart';
import 'package:mpos_beat/core/utils/extentions.dart';
import 'package:mpos_beat/core/utils/logger.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/core/utils/urls.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/models/data/company_voucher_data.dart';
import 'package:mpos_beat/data/models/get_company_voucher_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mpos_beat/core/service/http_client.dart';

@lazySingleton
class GetCompanyvoucherTypeListDatasource {
  final HttpClient httpClient;
  final RunSafely runSafely;
  final SharedPreferences sharedPreferences;
  final AppDb appDb;
  GetCompanyvoucherTypeListDatasource(
    this.httpClient,
    this.runSafely,
    this.sharedPreferences,
    this.appDb,
  );

  ResultFuture<CompanyvouchertypeslistDtos> call(int companyID) {
    return runSafely(
      () async {
        final url = '${Urls.getCompanyvouchertypeList}$companyID';

        Logger.logInfo('Fetching voucher types from URL: $url');

        final response = await httpClient.get(url);
        Logger.logInfo('HTTP GET completed for $url');

        Logger.logInfo('Status code: ${response.statusCode}');
        Logger.logInfo('Message: ${response.message}');

        if (response.isOk) {
          final data = CompanyvouchertypeslistDtos.fromJson(response.data);
          Logger.logInfo('Parsed voucher type list successfully.');
          final voucherTypeList = data.companyVoucherTypesList
              .map((e) => e.toDrift())
              .toList();
          await appDb.voucherTypesDao.deleteAll();
          await appDb.voucherTypesDao.deleteByCompany(companyID);
          await appDb.voucherTypesDao.deleteAll();
          await appDb.voucherTypesDao.insertVoucherTypes(voucherTypeList);
          return data;
        }

        throw CustomException(errMsg: response.message);
      },

      failure: (error) {
        Logger.logWarning('Failure captured in runSafely: $error');
        if (error.toLowerCase() == 'Invalid Referrel Code!'.toLowerCase()) {
          return InvalidReferralCode(errorMsg: error);
        }
        return MainFailure.genericError(errorMsg: error);
      },
    );
  }
}

extension VoucherTypeMapper on CompanyVoucherTypesListData {
  VoucherType toDrift() {
    return VoucherType(
      id: id,
      companyId: companyId,
      voucherMenuName: voucherMenuName,
      description: description,
      hasB2BB2C: hasB2BB2C,
      requireDeclaration: requireDeclaration,
      orderNo: orderNo,
      hasB2B: hasB2B,
      b2BPrefix: b2BPrefix,
      b2BSuffix: b2BSuffix,
      b2BWidth: b2BWidth,
      b2BStartFrom: b2BStartFrom,
      b2CPrefix: b2CPrefix,
      b2CSuffix: b2CSuffix,
      b2CWidth: b2CWidth,
      b2CStartFrom: b2CStartFrom,
      b2BDeclaration: b2BDeclaration,
      b2CDeclaration: b2CDeclaration,
      isEnabled: isEnabled,
    );
  }
}
