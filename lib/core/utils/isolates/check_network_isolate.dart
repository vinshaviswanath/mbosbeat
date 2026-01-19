import 'dart:io';
import 'dart:isolate';

import 'package:mpos_beat/core/utils/enums.dart';

Future<NetworkQuality> checkNetworkInIsolate() async {
  final receivePort = ReceivePort();

  await Isolate.spawn(_isolateEntry, receivePort.sendPort);

  return await receivePort.first as NetworkQuality;
}

void _isolateEntry(SendPort sendPort) async {
  try {
    final stopwatch = Stopwatch()..start();
    await InternetAddress.lookup('google.com');
    stopwatch.stop();

    final latency = stopwatch.elapsedMilliseconds;

    if (latency < 100) {
      sendPort.send(NetworkQuality.excellent);
    } else if (latency < 250) {
      sendPort.send(NetworkQuality.good);
    } else if (latency < 500) {
      sendPort.send(NetworkQuality.fair);
    } else {
      sendPort.send(NetworkQuality.poor);
    }
  } catch (_) {
    sendPort.send(NetworkQuality.poor);
  }
}