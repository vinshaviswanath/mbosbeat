import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/data/models/response.dart';
import 'package:mpos_beat/domain/request/attendance_params.dart';

interface class IUserFacad {
  ResultFuture<DefaultResponse> markAttendance(
    BaseParams<AttendanceParams> params,
  ) {
    throw UnimplementedError();
  }
}
