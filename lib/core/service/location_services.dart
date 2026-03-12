import 'dart:io';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mpos_beat/core/exception/location_exception.dart';
import 'package:mpos_beat/core/utils/imports.dart';

// class LocationService {
//   LocationSettings _locationSettings() {
//     if (Platform.isAndroid) {
//       return AndroidSettings(
//         accuracy: LocationAccuracy.high,
//         distanceFilter: 0,
//       );
//     } else if (Platform.isIOS) {
//       return AppleSettings(accuracy: LocationAccuracy.best);
//     } else {
//       return const LocationSettings(accuracy: LocationAccuracy.high);
//     }
//   }

//   Future<Position> getCurrentLocation() async {
//     final serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       throw AppLocationServiceDisabledException();
//     }

//     var permission = await Geolocator.checkPermission();

//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         throw AppLocationPermissionDeniedException();
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       throw AppLocationPermissionForeverDeniedException();
//     }

//     return Geolocator.getCurrentPosition(locationSettings: _locationSettings());
//   }

//   Future<String> getNormalAddress(double lat, double lng) async {
//   final placemarks = await placemarkFromCoordinates(lat, lng);
//   if (placemarks.isEmpty) return '';

//   final p = placemarks.first;

//   return [
//     p.name,
//     p.street,
//     p.subLocality,
//     p.locality,
//     p.administrativeArea,
//     p.country,
//   ].whereType<String>().where((e) => e.isNotEmpty).join(', ');
// }
// }

class LocationService {
  LocationSettings _locationSettings() {
    if (Platform.isAndroid) {
      return AndroidSettings(
        accuracy: LocationAccuracy.medium, // faster than high
        distanceFilter: 0,
      );
    } else if (Platform.isIOS) {
      return AppleSettings(accuracy: LocationAccuracy.bestForNavigation);
    } else {
      return const LocationSettings(accuracy: LocationAccuracy.medium);
    }
  }

  Future<Position> getCurrentLocation() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw AppLocationServiceDisabledException();
    }

    var permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw AppLocationPermissionDeniedException();
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw AppLocationPermissionForeverDeniedException();
    }

    /// 🚀 Try last known location first (very fast)
    final lastKnown = await Geolocator.getLastKnownPosition();
    if (lastKnown != null) {
      return lastKnown;
    }

    /// fallback to current GPS location
    return Geolocator.getCurrentPosition(
      locationSettings: _locationSettings(),
      timeLimit: const Duration(seconds: 5), // prevents long waiting
    );
  }

  Future<String> getNormalAddress(double lat, double lng) async {
    try {
      final placemarks = await placemarkFromCoordinates(lat, lng);

      if (placemarks.isEmpty) return '';

      final p = placemarks.first;

      return [
        p.name,
        p.street,
        p.subLocality,
        p.locality,
        p.administrativeArea,
        p.country,
      ].whereType<String>().where((e) => e.isNotEmpty).join(', ');
    } catch (_) {
      /// Reverse geocoding sometimes fails due to network
      return '';
    }
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
