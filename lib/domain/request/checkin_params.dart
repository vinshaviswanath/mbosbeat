import 'package:mpos_beat/core/param/param_builder.dart';

class CheckinParams extends ToMap {
  final int tripId;
  final String vistType;
  final int visitSequence;
  final int partyId;
  final String partyName;
  final String date;
  final String time;
  final double latitude;
  final double longitude;
  final double accuracy;
  final String address;
  CheckinParams({
    required this.tripId,
    required this.vistType,
    required this.visitSequence,
    required this.partyId,
    required this.partyName,
    required this.date,
    required this.time,
    required this.latitude,
    required this.longitude,
    required this.accuracy,
    required this.address,
  });

  factory CheckinParams.fromJson(Map<String, dynamic> json) {
    return CheckinParams(
      tripId: json['TripID'],
      vistType: json['VisitType'],
      visitSequence: json['VisitSequence'],
      partyId: json['PartyID'],
      partyName: json['PartyName'],
      date: json['Date'],
      time: json['Time'],
      latitude: json['Lattitude'],
      longitude: json['Longitude'],
      accuracy: json['Accuracy'],
      address: json['Address'],
    );
  }

  @override
  Map<String, dynamic> toMap() => {
    "TripID": tripId,
    "VisitType": vistType,
    "VisitSequence": visitSequence,
    "PartyID": partyId,
    "PartyName": partyName,
    "Date": date,
    "Time": time,
    "Lattitude": latitude,
    "Longitude": longitude,
    "Accuracy": accuracy,
    "Address": address,
  };
}
