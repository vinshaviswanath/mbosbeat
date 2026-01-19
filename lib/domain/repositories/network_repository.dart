import 'package:mpos_beat/core/utils/enums.dart';

abstract class NetworkRepository {
  Future<NetworkQuality> checkNetworkQuality();
}
