import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class NetworkProvider extends ChangeNotifier {
  final Connectivity _connectivity = Connectivity();
  bool _isConnected = true;

  String? _lastRoute; // 👈 store last route

  bool get isConnected => _isConnected;
  String? get lastRoute => _lastRoute;

  late final StreamSubscription<List<ConnectivityResult>> _subscription;

  NetworkProvider() {
    _init();
  }

  Future<void> _init() async {
    final result = await _connectivity.checkConnectivity();
    _updateStatus(result);

    _subscription =
        _connectivity.onConnectivityChanged.listen(_updateStatus);
  }

  void _updateStatus(List<ConnectivityResult> results) {
    final hasInternet = results.any(
      (r) =>
          r == ConnectivityResult.mobile ||
          r == ConnectivityResult.wifi ||
          r == ConnectivityResult.ethernet,
    );

    if (_isConnected != hasInternet) {
      _isConnected = hasInternet;
      notifyListeners();
    }
  }

  void saveLastRoute(String route) {
    if (route != '/no-internet') {
      _lastRoute = route;
    }
  }

  Future<void> retryConnection() async {
    final result = await _connectivity.checkConnectivity();
    _updateStatus(result);
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

