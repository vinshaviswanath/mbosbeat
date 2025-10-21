import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/data/models/create_company_voucher_model.dart';
import 'package:mpos_beat/data/models/get_company_voucher_model.dart';
import 'package:mpos_beat/domain/request/create_company_voucher_request.dart';

interface class ICompanyCreationFacad {
  ResultFuture<CompanyvouchertypeslistDtos> getVoucherType(int companyID) {
    throw UnimplementedError();
  }

  ResultFuture<CreateCompanyvochertypeDtos> createCompanyVoucher(
    BaseParams<CreateCompanyVocherParams> param,
  ) {
    throw UnimplementedError();
  }
}
