import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/base/run_safely.dart';
import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/data/data_sources/company_creation/company_creation.dart';
import 'package:mpos_beat/data/data_sources/company_creation/create_company_voucherType.dart';
import 'package:mpos_beat/data/data_sources/company_creation/get_company_voucherType.dart';
import 'package:mpos_beat/data/models/create_company_voucher_model.dart';
import 'package:mpos_beat/data/models/get_company_voucher_model.dart';
import 'package:mpos_beat/domain/repositories/i_companyCreation_facad.dart';
import 'package:mpos_beat/domain/request/create_company_voucher_request.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mpos_beat/core/serveice/http_client.dart';

@LazySingleton(as: ICompanyCreationFacad)
class ICompanyCreationImpl implements ICompanyCreationFacad {
  final CompanyCreation companyCreation;
  final GetCompanyvoucherTypeListDatasource getCompanyvoucherTypeList;
  final CreateCompanyVouchertypeDatasource createCompanyVouchertypeDatasource;
  final HttpClient httpClient;
  final RunSafely runSafely;
  final SharedPreferences sharedPreferences;
  ICompanyCreationImpl(
    this.companyCreation,
    this.getCompanyvoucherTypeList,
    this.createCompanyVouchertypeDatasource,
    this.httpClient,
    this.runSafely,
    this.sharedPreferences,
  );

  @override
  ResultFuture<CompanyvouchertypeslistDtos> getVoucherType(int companyID) {
    return getCompanyvoucherTypeList.call(companyID);
  }

  @override
  ResultFuture<CreateCompanyvochertypeDtos> createCompanyVoucher(
    BaseParams<CreateCompanyVocherParams> param,
  ) {
    return createCompanyVouchertypeDatasource.call(param);
  }
}
