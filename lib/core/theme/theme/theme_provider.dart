import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mpos_beat/core/utils/enums.dart';

class ThemeProvider with ChangeNotifier {
  AppThemeMode _themeMode = AppThemeMode.light;
  int _index = 0;
  bool _visible = false;
  bool _showNewWidget = false;
  double _bottomPosition = -200;

  AppThemeMode get themeMode => _themeMode;
  int get index => _index;
  bool get visible => _visible;
  bool get showNewWidget => _showNewWidget;
  double get bottomPosition => _bottomPosition;

  void changeTheme(AppThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  void setIndex(int index) {
    _index = index;
    notifyListeners();
  }

  void showNewWidgets() {
    _bottomPosition = 0;
    _showNewWidget = true;
    _visible = true;
    notifyListeners();
  }

  void hideNewWidget() {
    _bottomPosition = -200;
    _showNewWidget = false;
    notifyListeners();

    Timer(const Duration(milliseconds: 400), () {
      _visible = false;
      notifyListeners();
    });
  }
}
