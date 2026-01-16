import 'package:mpos_beat/core/param/param_builder.dart';

class TripEndParams extends ToMap {
  TripEndParams({
    required this.tripId,
    required this.endTime,
    required this.routeId,
    required this.godownId,
    required this.latitude,
    required this.longitude,
    required this.accuracy,
    required this.address,
  });

  final int tripId;
  final DateTime endTime;
  final int routeId;
  final int godownId;
  final double latitude;
  final double longitude;
  final double accuracy;
  final String address;

  @override
  Map<String, dynamic> toMap() => {
        "tripID": tripId,
        "endTime": endTime.toIso8601String().split('.').first,
        "routeID": routeId,
        "godownID": godownId,
        "latitude": latitude,
        "longitude": longitude,
        "accuracy": accuracy,
        "address": address,
      };
}

