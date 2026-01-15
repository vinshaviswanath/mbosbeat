import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/base/run_safely.dart';
import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/service/http_client.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/data/data_sources/user/attendanceMarking.dart';
import 'package:mpos_beat/data/data_sources/user_management/checkin_Checkout/checkin_datasource.dart';
import 'package:mpos_beat/data/data_sources/user_management/checkin_Checkout/checkout_datasource.dart';
import 'package:mpos_beat/data/data_sources/user_management/party_MasterSync/party_MasterSync.dart';
import 'package:mpos_beat/data/models/party_MasterSync_model.dart';
import 'package:mpos_beat/data/models/response.dart';
import 'package:mpos_beat/domain/repositories/i_user_facad.dart';
import 'package:mpos_beat/domain/request/attendance_params.dart';
import 'package:mpos_beat/domain/request/checkin_params.dart';
import 'package:mpos_beat/domain/request/checkout_params.dart';
import 'package:mpos_beat/domain/request/party_MasterSync_params.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: IUserFacad)
class IUserFacadImp implements IUserFacad {
  final AttendanceMarking attendanceMarking;
  final HttpClient httpClient;
  final RunSafely runSafely;
  final SharedPreferences sharedPreferences;
  final PartyMasterSync partyMastersync;
  final CheckinDatasource checkinDatasource;
  final CheckoutDatasource checkoutDatasource;
  IUserFacadImp(
    this.httpClient,
    this.runSafely,
    this.sharedPreferences,
    this.attendanceMarking,
    this.partyMastersync,
    this.checkinDatasource,
    this.checkoutDatasource,
  );

  @override
  ResultFuture<DefaultResponse> markAttendance(
    BaseParams<AttendanceParams> params,
  ) {
    return attendanceMarking.call(params);
  }

  @override
  ResultFuture<PartyMasterSyncModel> partyMasterSync(
    BaseParams<PartyMasterSyncParams> params,
  ) {
    return partyMastersync(params);
  }

  @override
  ResultFuture<DefaultResponse> checkin(BaseParams<CheckinParams> params) {
    return checkinDatasource.call(params);
  }

  @override
  ResultFuture<DefaultResponse> checkout(BaseParams<CheckoutParams> params) {
    return checkoutDatasource.call(params);
  }
}
