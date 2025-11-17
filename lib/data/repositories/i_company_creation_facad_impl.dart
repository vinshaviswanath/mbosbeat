import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/base/run_safely.dart';
import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/serveice/http_client.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/data/data_sources/company_creation/activate_godown/activate_godown.dart';
import 'package:mpos_beat/data/data_sources/company_creation/activate_route/activate_route.dart';
import 'package:mpos_beat/data/data_sources/company_creation/company_info.dart';
import 'package:mpos_beat/data/data_sources/company_creation/create_voucher_numbering/create_voucher_numbering.dart';
import 'package:mpos_beat/data/data_sources/company_creation/get_voucher_numbering/get_voucher_numbering.dart';
import 'package:mpos_beat/data/data_sources/company_creation/set_voucher_numbering_method/set_voucher_numbering_method.dart';
import 'package:mpos_beat/data/data_sources/company_creation/country_list.dart';
import 'package:mpos_beat/data/data_sources/company_creation/create_company_settings.dart';
import 'package:mpos_beat/data/data_sources/company_creation/create_company_voucherType.dart';
import 'package:mpos_beat/data/data_sources/company_creation/get_all_company_settings.dart';
import 'package:mpos_beat/data/data_sources/company_creation/get_company_voucherType.dart';
import 'package:mpos_beat/data/data_sources/company_creation/integration_type.dart';
import 'package:mpos_beat/data/data_sources/company_creation/registration_type.dart';
import 'package:mpos_beat/data/data_sources/company_creation/create_godown/create_godown.dart';
import 'package:mpos_beat/data/data_sources/company_creation/create_route/create_route.dart';
import 'package:mpos_beat/data/data_sources/company_creation/deactivate_godown/deactivate_godown.dart';
import 'package:mpos_beat/data/data_sources/company_creation/deactivate_route/deactivate_route.dart';
import 'package:mpos_beat/data/data_sources/company_creation/delete_godown/delete_godown.dart';
import 'package:mpos_beat/data/data_sources/company_creation/delete_route/delete_route.dart';
import 'package:mpos_beat/data/data_sources/company_creation/get_all_companies.dart';
import 'package:mpos_beat/data/data_sources/company_creation/get_godown_list/get_godown_list.dart';
import 'package:mpos_beat/data/data_sources/company_creation/get_route_list/get_route_list.dart';
import 'package:mpos_beat/data/data_sources/company_creation/state_list.dart';
import 'package:mpos_beat/data/models/company_creation_response.dart';
import 'package:mpos_beat/data/models/company_list_model.dart';
import 'package:mpos_beat/data/models/country_list_response.dart';
import 'package:mpos_beat/data/models/create_companySettings_model.dart';
import 'package:mpos_beat/data/models/create_company_voucher_model.dart';
import 'package:mpos_beat/data/models/get_all_company_settings_model.dart';
import 'package:mpos_beat/data/models/get_company_voucher_model.dart';
import 'package:mpos_beat/data/models/integration_model.dart';
import 'package:mpos_beat/data/models/registration_type_model.dart';
import 'package:mpos_beat/data/models/create_godown_response.dart';
import 'package:mpos_beat/data/models/create_route_response.dart';
import 'package:mpos_beat/data/models/create_voucher_numbering_response.dart';
import 'package:mpos_beat/data/models/godown_list_model.dart';
import 'package:mpos_beat/data/models/route_list_model.dart';
import 'package:mpos_beat/data/models/state_list_response.dart';
import 'package:mpos_beat/data/models/voucher_numbering_response.dart';
import 'package:mpos_beat/domain/repositories/i_company_creation_facad.dart';
import 'package:mpos_beat/domain/request/company_creation_params.dart';
import 'package:mpos_beat/domain/request/create_company_settings_request.dart';
import 'package:mpos_beat/domain/request/create_company_voucher_request.dart';
import 'package:mpos_beat/domain/request/create_godown_params.dart';
import 'package:mpos_beat/domain/request/create_route_params.dart';
import 'package:mpos_beat/domain/request/create_voucher_numbering_params.dart';
import 'package:mpos_beat/domain/request/integration_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: ICompanyCreationFacad)
class ICompanyCreationFacadImpl implements ICompanyCreationFacad {
  final CompanyInfo companyCreation;
  final GetCompanyvoucherTypeListDatasource getCompanyvoucherTypeList;
  final CreateCompanyVouchertypeDatasource createCompanyVouchertypeDatasource;
  final IntegrationDatasource integrationDatasource;
  final CreateCompanySettingsDatasource createCompanySettingsDatasource;
  final CountryList fecthcountryList;
  final StateList fetchstateList;
  final RegistrationTypeDatasource registrationTypeDatasource;
  final GetAllCompanySettingsDatasource getAllCompanySettingsDatasource;
  final GetCompanyList getAllCompanies;
  final CreateGodownOrVehicle createGodowns;
  final CreateRoute createRoutes;
  final GetAllGodowns allGodownList;
  final GetAllRoutes allRouteList;
  final ActivateGodown activatingGodown;
  final ActivateRoute activatingRoute;
  final DeactivateRoute deactivatingRoute;
  final DeactivateGodown deactivatingGodown;
  final DeleteGodown godownDelete;
  final DeleteRoute routeDelete;
  final HttpClient httpClient;
  final GetVoucherNumbering voucherNumbering;
  final CreateVoucherNumbering createVoucherNumbers;
  final SetVoucherNumberingMethod setVoucherNumberMode;
  final RunSafely runSafely;
  final SharedPreferences sharedPreferences;

  ICompanyCreationFacadImpl(
    this.companyCreation,
    this.fecthcountryList,
    this.fetchstateList,
    this.registrationTypeDatasource,
    this.runSafely,
    this.httpClient,
    this.sharedPreferences,
    this.getCompanyvoucherTypeList,
    this.createCompanyVouchertypeDatasource,
    this.integrationDatasource,
   this.getAllCompanySettingsDatasource,
   this.createCompanySettingsDatasource,
    this.getAllCompanies,
    this.createGodowns,
    this.createRoutes,
    this.allGodownList,
    this.allRouteList,
    this.activatingGodown,
    this.activatingRoute,
    this.deactivatingRoute,
    this.deactivatingGodown,
    this.godownDelete,
    this.routeDelete,
    this.voucherNumbering,
    this.createVoucherNumbers, this.setVoucherNumberMode  ,
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
  ResultFuture<RegistrationTypeDtos> getRegistrationType(int countryId) {
    return registrationTypeDatasource.call(countryId);
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

  @override
  ResultFuture<CompanysettingslistDtos> getCompanySettings(int companyId) {
    return getAllCompanySettingsDatasource.call(companyId);
  }

  @override
  ResultFuture<CreateCompanySettingsDtos> createCompanySettings(
    BaseParams<CreateCompanysettingsParams> param,
  ) {
    return createCompanySettingsDatasource.call(param);
  }
  @override
  ResultFuture<CompaniesListResponse> getAllCompany() {
    return getAllCompanies();
  }

  @override
  ResultFuture<GodownResponse> createGodown(
    BaseParams<CreateGodownParams> params,
  ) {
    return createGodowns(params);
  }

  @override
  ResultFuture<GodownListModel> getAllGodowns({required String companyId}) {
    return allGodownList(companyId: companyId);
  }

  @override
  ResultFuture<GodownResponse> activateGodown({required String mid}) {
    return activatingGodown(mid: mid);
  }

  @override
  ResultFuture<GodownResponse> deactivateGodown({required String mid}) {
    return deactivatingGodown(mid: mid);
  }

  @override
  ResultFuture<GodownResponse> deleteGodown({required String mid}) {
    return godownDelete(mid: mid);
  }

  @override
  ResultFuture<RouteResponse> createRoute(
    BaseParams<CreateRouteParams> params,
  ) {
    return createRoutes(params);
  }

  @override
  ResultFuture<RouteListModel> getRouteList({required String companyId}) {
    return allRouteList(companyId: companyId);
  }

  @override
  ResultFuture<RouteResponse> activateRoute({required String routeId}) {
    return activatingRoute(routeId: routeId);
  }

  @override
  ResultFuture<RouteResponse> deactivateRoute({required String routeId}) {
    return deactivatingRoute(routeId: routeId);
  }

  @override
  ResultFuture<RouteResponse> deleteRoute({required String routeId}) {
    return routeDelete(routeId: routeId);
  }

  @override
  ResultFuture<VoucherNumberingResponse> getVoucherNumbering({
    required String companyId,
    required String voucherMode,
    required int voucherModeId,

  }) {
    return voucherNumbering(companyId: companyId, voucherMode: voucherMode,voucherModeId: voucherModeId );
  }

  @override
  ResultFuture<ResponseModel> createVoucherNumber(
    BaseParams<CreateVoucherNumberingParams> params,
  ) {
    return createVoucherNumbers(params);
  }

 @override
   ResultFuture<ResponseModel> setVoucherNumberMethod({required String voucherMode, required String companyId,}) {
    return setVoucherNumberMode(companyId: companyId,voucherMode: voucherMode);
  }
}
