import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mpos_beat/core/utils/enums.dart';
import 'package:mpos_beat/domain/repositories/network_repository.dart';


class NetworkProvider extends ChangeNotifier {
  final NetworkRepository networkRepository;
  final Connectivity _connectivity = Connectivity();

  bool _isConnected = true;
  NetworkQuality _quality = NetworkQuality.poor;
  String? _lastRoute;

  Timer? _qualityTimer;
  static const _refreshInterval = Duration(seconds: 10);

  bool get isConnected => _isConnected;
  NetworkQuality get quality => _quality;
  String? get lastRoute => _lastRoute;

  late final StreamSubscription<List<ConnectivityResult>> _subscription;

  NetworkProvider({required this.networkRepository}) {
    _init();
  }

  // ─────────────────────────────────────────────
  Future<void> _init() async {
    final result = await _connectivity.checkConnectivity();
    _handleConnectivity(result);

    _subscription =
        _connectivity.onConnectivityChanged.listen(_handleConnectivity);

    _startQualityRefresh();
  }

  // ─────────────────────────────────────────────
  void _handleConnectivity(List<ConnectivityResult> results) {
    final hasInternet = results.any(
      (r) =>
          r == ConnectivityResult.mobile ||
          r == ConnectivityResult.wifi ||
          r == ConnectivityResult.ethernet,
    );

    if (_isConnected == hasInternet) return;

    _isConnected = hasInternet;

    if (!hasInternet) {
      _quality = NetworkQuality.poor;
      _stopQualityRefresh();
    } else {
      _startQualityRefresh();
    }

    notifyListeners();
  }

  // ─────────────────────────────────────────────
  void _startQualityRefresh() {
    _qualityTimer?.cancel();

    _qualityTimer = Timer.periodic(_refreshInterval, (_) {
      _refreshQuality();
    });

    _refreshQuality();
  }

  void _stopQualityRefresh() {
    _qualityTimer?.cancel();
    _qualityTimer = null;
  }

  Future<void> _refreshQuality() async {
    if (!_isConnected) return;

    final newQuality = await networkRepository.checkNetworkQuality();

    if (_quality != newQuality) {
      _quality = newQuality;
      notifyListeners();
    }
  }

  // ─────────────────────────────────────────────
  void saveLastRoute(String route) {
    if (route != '/no-internet') {
      _lastRoute = route;
    }
  }

  Future<void> retryConnection() async {
    final result = await _connectivity.checkConnectivity();
    _handleConnectivity(result);
  }

  // ─────────────────────────────────────────────
  @override
  void dispose() {
    _subscription.cancel();
    _qualityTimer?.cancel();
    super.dispose();
  }
}