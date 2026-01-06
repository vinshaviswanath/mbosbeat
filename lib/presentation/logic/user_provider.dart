import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  static const _kDayStarted = 'day_started';
  static const _kRouteStarted = 'route_started';
  static const _kLastRouteName = 'last_route_name';

  bool _dayStarted = false;
  bool _routeStarted = false;
  String? _routeName;

  bool get dayStarted => _dayStarted;
  bool get routeStarted => _routeStarted;
  String? get routeName => _routeName;

  /// ---------------- LOAD PERSISTED STATE ----------------
  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();

    _dayStarted = prefs.getBool(_kDayStarted) ?? false;
    _routeStarted = prefs.getBool(_kRouteStarted) ?? false;
    _routeName = prefs.getString(_kLastRouteName);

    notifyListeners();
  }

  /// ---------------- DAY START / END ----------------
  Future<void> toggleDay() async {
    final prefs = await SharedPreferences.getInstance();

    _dayStarted = !_dayStarted;
    await prefs.setBool(_kDayStarted, _dayStarted);

    notifyListeners();
  }

  /// ---------------- ROUTE START ----------------
  Future<void> startRoute(String routeName) async {
    final prefs = await SharedPreferences.getInstance();

    _routeStarted = true;
    _routeName = routeName;

    await prefs.setBool(_kRouteStarted, true);
    await prefs.setString(_kLastRouteName, routeName);

    notifyListeners();
  }

  /// ---------------- ROUTE END ----------------
  Future<void> endRoute() async {
    final prefs = await SharedPreferences.getInstance();

    _routeStarted = false;
    _routeName = null;

    await prefs.setBool(_kRouteStarted, false);
    await prefs.remove(_kLastRouteName);
    notifyListeners();
  }
}
