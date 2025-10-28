import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/data/models/company_creation_response.dart';
import 'package:mpos_beat/data/models/country_list_response.dart';
import 'package:mpos_beat/data/models/create_companySettings_model.dart';
import 'package:mpos_beat/data/models/create_company_voucher_model.dart';
import 'package:mpos_beat/data/models/get_all_company_settings_model.dart';
import 'package:mpos_beat/data/models/get_company_voucher_model.dart';
import 'package:mpos_beat/data/models/integration_model.dart';
import 'package:mpos_beat/data/models/registration_type_model.dart';
import 'package:mpos_beat/data/models/state_list_response.dart';
import 'package:mpos_beat/domain/request/company_creation_params.dart';
import 'package:mpos_beat/domain/request/create_company_settings_request.dart';
import 'package:mpos_beat/domain/request/create_company_voucher_request.dart';
import 'package:mpos_beat/domain/request/integration_request.dart';

interface class ICompanyCreationFacad {
  ResultFuture<CompanyInfoDtos> companyInfo(
    BaseParams<CompanyInfoParams> params,
  ) {
    throw UnimplementedError();
  }

  ResultFuture<CountryListDtos> countryList() {
    throw UnimplementedError();
  }

  ResultFuture<StateListDtos> stateList(int countryId) {
    throw UnimplementedError();
  }

  ResultFuture<CompanyvouchertypeslistDtos> getVoucherType(int companyID) {
    throw UnimplementedError();
  }

  ResultFuture<CreateCompanyvochertypeDtos> createCompanyVoucher(
    BaseParams<CreateCompanyVocherParams> param,
  ) {
    throw UnimplementedError();
  }

  ResultFuture<IntegrationDtos> integartion(
    BaseParams<IntegrationParams> param,
  ) {
    throw UnimplementedError();
  }

  ResultFuture<RegistrationTypeDtos> getRegistrationType(int countryId) {
    throw UnimplementedError();
  }

  ResultFuture<CompanysettingslistDtos> getCompanySettings(int countryId) {
    throw UnimplementedError();
  }

  ResultFuture<CreateCompanySettingsDtos> createCompanySettings(
    BaseParams<CreateCompanysettingsParams> param,
  ) {
    throw UnimplementedError();
  }
}
