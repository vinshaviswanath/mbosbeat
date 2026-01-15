import 'package:mpos_beat/core/param/param_builder.dart';

class CheckoutParams extends ToMap {
  final int tripId;
  final int checkinId;
  final String time;
  final double latitude;
  final double longitude;
  final double accuracy;
  final String address;
  final String remarks;
  CheckoutParams({
    required this.tripId,
    required this.checkinId,
    required this.time,
    required this.latitude,
    required this.longitude,
    required this.accuracy,
    required this.address,
    required this.remarks,
  });

  factory CheckoutParams.fromJson(Map<String, dynamic> json) {
    return CheckoutParams(
      tripId: json['TripID'],
      checkinId: json['CheckInID'],
      time: json['Time'],
      latitude: json['Lattitude'],
      longitude: json['Longitude'],
      accuracy: json['Accuracy'],
      address: json['Address'],
      remarks: json['Remarks'],
    );
  }

  @override
  Map<String, dynamic> toMap() => {
    "TripID": tripId,
    "CheckInID": checkinId,
    "Time": time,
    "Lattitude": latitude,
    "Longitude": longitude,
    "Accuracy": accuracy,
    "Address": address,
    "Remarks": remarks,
  };
}
