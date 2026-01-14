import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/utils/imports.dart';

class AttendanceParams extends ToMap{
  AttendanceParams({
    required this.attendanceType,
    required this.lattitude,
    required this.longitude,
    required this.accuracy,
    required this.address,
  });

  final AttendanceMark attendanceType;
  final double? lattitude;
  final double? longitude;
  final double? accuracy;
  final String? address;

  factory AttendanceParams.fromJson(Map<String, dynamic> json) {
    return AttendanceParams(
      attendanceType: json["attendanceType"],
      lattitude: json["lattitude"],
      longitude: json["longitude"],
      accuracy: json["accuracy"],
      address: json["address"],
    );
  }

@override
  Map<String, dynamic> toMap() => {
    "attendanceType": attendanceType.value,
    "lattitude": lattitude,
    "longitude": longitude,
    "accuracy": accuracy,
    "address": address?.trim().isNotEmpty == true ? address : "",
  };
}
