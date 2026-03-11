import 'dart:ui';

import 'package:flutter/material.dart';

enum AppThemeMode { light, dark }

enum APIAction {
  none('mone'),
  email('email');

  const APIAction(this.name);
  final String name;
}

enum ActionType {
  // playStore('play_store'),
  profileInteraction('profile_interaction');

  const ActionType(this.name);
  final String name;
}

enum NavigationType { success, failed }

enum TransitionDirection { leftToRight, rightToLeft, topToBottom, bottomToTop }

enum ImageType { svg, png }

enum UserAction {
  block,
  unblock;

  int get value {
    switch (this) {
      case UserAction.block:
        return 0;
      case UserAction.unblock:
        return 1;
    }
  }
}

enum AttendanceMark {
  start,
  end;

  String get value {
    switch (this) {
      case AttendanceMark.start:
        return 'Start';
      case AttendanceMark.end:
        return 'End';
    }
  }
}

enum NetworkQuality {
  poor,
  fair,
  good,
  excellent;

  String get value {
    switch (this) {
      case NetworkQuality.poor:
        return 'Poor';
      case NetworkQuality.fair:
        return 'Fair';
      case NetworkQuality.good:
        return 'Good';
      case NetworkQuality.excellent:
        return 'Excellent';
    }
  }

  Color get color {
    switch (this) {
      case NetworkQuality.poor:
        return Colors.red;
      case NetworkQuality.fair:
        return Colors.orange;
      case NetworkQuality.good:
        return Colors.blue;
      case NetworkQuality.excellent:
        return Colors.green;
    }
  }

  int get bars {
    switch (this) {
      case NetworkQuality.poor:
        return 1;
      case NetworkQuality.fair:
        return 2;
      case NetworkQuality.good:
        return 3;
      case NetworkQuality.excellent:
        return 4;
    }
  }
}

enum DiscountType { percentage, amount,none }

enum PrinterSize {
  mm58,
  mm80,
  mm112,
}