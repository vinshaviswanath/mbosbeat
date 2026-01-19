import 'dart:io';

import 'package:mpos_beat/core/utils/enums.dart';
import 'package:mpos_beat/domain/repositories/network_repository.dart';


class NetworkService implements NetworkRepository {
  @override
  Future<NetworkQuality> checkNetworkQuality() async {
    try {
      final stopwatch = Stopwatch()..start();

      final result = await InternetAddress.lookup('google.com')
          .timeout(const Duration(seconds: 3));

      stopwatch.stop();
      final latency = stopwatch.elapsedMilliseconds;

      if (result.isEmpty) return NetworkQuality.poor;

      if (latency < 100) return NetworkQuality.excellent;
      if (latency < 250) return NetworkQuality.good;
      if (latency < 500) return NetworkQuality.fair;

      return NetworkQuality.poor;
    } catch (_) {
      return NetworkQuality.poor;
    }
  }
}
