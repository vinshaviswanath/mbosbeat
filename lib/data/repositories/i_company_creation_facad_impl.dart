import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/base/run_safely.dart';
import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/serveice/http_client.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/data/data_sources/company_creation/company_info.dart';
import 'package:mpos_beat/data/data_sources/company_creation/country_list.dart';
import 'package:mpos_beat/data/data_sources/company_creation/create_company_voucherType.dart';
import 'package:mpos_beat/data/data_sources/company_creation/get_company_voucherType.dart';
import 'package:mpos_beat/data/data_sources/company_creation/integration_type.dart';
import 'package:mpos_beat/data/data_sources/company_creation/state_list.dart';
import 'package:mpos_beat/data/data_sources/company_creation/company_info.dart';
import 'package:mpos_beat/data/data_sources/company_creation/country_list.dart';
import 'package:mpos_beat/data/data_sources/company_creation/create_company_voucherType.dart';
import 'package:mpos_beat/data/data_sources/company_creation/get_company_voucherType.dart';
import 'package:mpos_beat/data/data_sources/company_creation/state_list.dart';
import 'package:mpos_beat/data/models/company_creation_response.dart';
import 'package:mpos_beat/data/models/country_list_response.dart';
import 'package:mpos_beat/data/models/create_company_voucher_model.dart';
import 'package:mpos_beat/data/models/get_company_voucher_model.dart';
import 'package:mpos_beat/data/models/integration_model.dart';
import 'package:mpos_beat/data/models/state_list_response.dart';
import 'package:mpos_beat/domain/repositories/i_company_creation_facad.dart';
import 'package:mpos_beat/domain/request/company_creation_params.dart';
import 'package:mpos_beat/domain/request/create_company_voucher_request.dart';
import 'package:mpos_beat/domain/request/integration_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: ICompanyCreationFacad)
class ICompanyCreationFacadImpl implements ICompanyCreationFacad {
  final CompanyInfo companyCreation;
  final GetCompanyvoucherTypeListDatasource getCompanyvoucherTypeList;
  final CreateCompanyVouchertypeDatasource createCompanyVouchertypeDatasource;
  final IntegrationDatasource integrationDatasource;
  final CountryList fecthcountryList;
  final StateList fetchstateList;
  final HttpClient httpClient;
  final RunSafely runSafely;
  final SharedPreferences sharedPreferences;

  ICompanyCreationFacadImpl(
    this.companyCreation,
    this.fecthcountryList,
    this.fetchstateList,
    this.runSafely,
    this.httpClient,
    this.sharedPreferences,
    this.getCompanyvoucherTypeList,
    this.createCompanyVouchertypeDatasource,
    this.integrationDatasource,
  );

  @override
  ResultFuture<CompanyInfoDtos> companyInfo(
    BaseParams<CompanyInfoParams> params,
  ) {
    return companyCreation(params);
  }

  @override
  ResultFuture<CountryListDtos> countryList() {
    return fecthcountryList();
  }

  @override
  ResultFuture<StateListDtos> stateList(int countryId) {
    return fetchstateList(countryId);
  }

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

  @override
  ResultFuture<IntegrationDtos> integartion(
    BaseParams<IntegrationParams> param,
  ) {
    return integrationDatasource.call(param);
  }
}
