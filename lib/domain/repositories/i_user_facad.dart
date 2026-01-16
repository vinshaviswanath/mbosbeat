import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/data/models/response.dart';
import 'package:mpos_beat/domain/request/attendance_params.dart';
import 'package:mpos_beat/domain/request/trip_end_params.dart';
import 'package:mpos_beat/domain/request/trip_start_params.dart';

interface class IUserFacad {
  ResultFuture<DefaultResponse> markAttendance(
    BaseParams<AttendanceParams> params,
  ) {
    throw UnimplementedError();
  }

   ResultFuture<DefaultResponse> markTripStart(
    BaseParams<TripStartParams> params,
  ) {
    throw UnimplementedError();
  }

     ResultFuture<DefaultResponse> markTripEnd(
    BaseParams<TripEndParams> params,
  ) {
    throw UnimplementedError();
  }
}

