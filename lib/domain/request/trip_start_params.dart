import 'package:mpos_beat/core/param/param_builder.dart';

class TripStartParams extends ToMap {
  TripStartParams({
    required this.date,
    required this.startTime,
    required this.routeId,
    required this.godownId,
    required this.latitude,
    required this.longitude,
    required this.accuracy,
    required this.address,
  });

  final DateTime? date;
  final String? startTime;
  final int? routeId;
  final int? godownId;
  final double? latitude;
  final double? longitude;
  final double? accuracy;
  final String? address;

  factory TripStartParams.fromJson(Map<String, dynamic> json) {
    return TripStartParams(
      date: json["date"] != null ? DateTime.tryParse(json["date"]) : null,
      startTime: json["startTime"],
      routeId: json["routeID"],
      godownId: json["godownID"],
      latitude: (json["latitude"] as num?)?.toDouble(),
      longitude: (json["longitude"] as num?)?.toDouble(),
      accuracy: (json["accuracy"] as num?)?.toDouble(),
      address: json["address"],
    );
  }

  @override
  Map<String, dynamic> toMap() => {
        "date": date == null
            ? null
            : "${date!.year.toString().padLeft(4, '0')}-"
              "${date!.month.toString().padLeft(2, '0')}-"
              "${date!.day.toString().padLeft(2, '0')}",
        "startTime": startTime,
        "routeID": routeId,
        "godownID": godownId,
        "latitude": latitude,
        "longitude": longitude,
        "accuracy": accuracy,
        "address": address,
      };
}
