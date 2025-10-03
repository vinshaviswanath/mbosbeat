import 'package:flutter/material.dart';

class TooltipOverlayManager {
  static final TooltipOverlayManager _instance =
      TooltipOverlayManager._internal();

  factory TooltipOverlayManager() => _instance;

  TooltipOverlayManager._internal();

  OverlayEntry? _currentEntry;

  void showTooltip(BuildContext context, OverlayEntry entry) {
    _hideCurrent(); 
    _currentEntry = entry;
    Overlay.of(context).insert(_currentEntry!);
  }

  void _hideCurrent() {
    _currentEntry?.remove();
    _currentEntry = null;
  }

  void hideTooltip() {
    _hideCurrent();
  }
}
