
import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/base/run_safely.dart';
import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/service/http_client.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/data/data_sources/user/attendanceMarking.dart';
import 'package:mpos_beat/data/models/response.dart';
import 'package:mpos_beat/domain/repositories/i_user_facad.dart';
import 'package:mpos_beat/domain/request/attendance_params.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: IUserFacad)
class IUserFacadImp implements IUserFacad {
  final AttendanceMarking attendanceMarking;
  final HttpClient httpClient;
  final RunSafely runSafely;
  final SharedPreferences sharedPreferences;
  IUserFacadImp(
    this.httpClient,
    this.runSafely,
    this.sharedPreferences,
    this.attendanceMarking,
  );

  @override
  ResultFuture<DefaultResponse> markAttendance(
    BaseParams<AttendanceParams> params,
  ) {
    return attendanceMarking.call(params); 
  }
}
