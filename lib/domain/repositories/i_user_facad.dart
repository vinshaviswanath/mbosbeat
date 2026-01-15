import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/data/models/party_MasterSync_model.dart';
import 'package:mpos_beat/data/models/response.dart';
import 'package:mpos_beat/domain/request/attendance_params.dart';
import 'package:mpos_beat/domain/request/checkin_params.dart';
import 'package:mpos_beat/domain/request/checkout_params.dart';
import 'package:mpos_beat/domain/request/party_MasterSync_params.dart';

interface class IUserFacad {
  ResultFuture<DefaultResponse> markAttendance(
    BaseParams<AttendanceParams> params,
  ) {
    throw UnimplementedError();
  }

  ResultFuture<PartyMasterSyncModel> partyMasterSync(
    BaseParams<PartyMasterSyncParams> params,
  ) {
    throw UnimplementedError();
  }

  ResultFuture<DefaultResponse> checkin(BaseParams<CheckinParams> params) {
    throw UnimplementedError();
  }

  ResultFuture<DefaultResponse> checkout(BaseParams<CheckoutParams> params) {
    throw UnimplementedError();
  }
}
