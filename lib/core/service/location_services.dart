import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  LocationSettings _locationSettings() {
    if (Platform.isAndroid) {
      return AndroidSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 0,
        forceLocationManager: false,
      );
    } else if (Platform.isIOS) {
      return AppleSettings(
        accuracy: LocationAccuracy.best,
        activityType: ActivityType.other,
        pauseLocationUpdatesAutomatically: true,
      );
    } else {
      return const LocationSettings(accuracy: LocationAccuracy.high);
    }
  }

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permission denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permission permanently denied');
    }

    // ✅ HERE is where it is used
    return Geolocator.getCurrentPosition(locationSettings: _locationSettings());
  }

Future<String> getNormalAddress(double lat, double lng) async {
  final placemarks = await placemarkFromCoordinates(lat, lng);

  if (placemarks.isEmpty) return '';

  final p = placemarks.first;

  final parts = <String>[
    p.name ?? "",
    p.street ?? "",
    p.subLocality ?? "",
    p.locality ?? "",
    p.administrativeArea ?? "",
    // p.postalCode?.isNotEmpty == true ? p.postalCode : "",
    p.country ?? "",
  ];

  final address = parts
      .whereType<String>()
      .where((e) => e.trim().isNotEmpty)
      .join(', ');

  debugPrint("Address: $address");
  return address;
}

}

// for real time updates use this in function

// Geolocator.getPositionStream(
//   locationSettings: const LocationSettings(
//     accuracy: LocationAccuracy.high,
//     distanceFilter: 10, // meters
//   ),
// ).listen((Position position) {
//   print(position.latitude);
//   print(position.longitude);
//   print(position.accuracy);
// });
