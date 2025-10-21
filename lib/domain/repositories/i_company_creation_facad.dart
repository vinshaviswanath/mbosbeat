import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/data/models/company_creation_response.dart';
import 'package:mpos_beat/data/models/country_list_response.dart';
import 'package:mpos_beat/data/models/state_list_response.dart';
import 'package:mpos_beat/domain/request/company_creation_params.dart';

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
}
