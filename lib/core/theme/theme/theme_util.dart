import 'package:flutter/material.dart';

class ThemeUtils {
  static Color getTitleColor(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.light
        ? Colors.blue.withValues(alpha: 0.7)
        : Colors.red.withValues(alpha: 0.7);
  }
}
