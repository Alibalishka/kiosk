import 'package:flutter/services.dart';

abstract class Vibration {
  // abstract - no need to build instance of this class
  static void vibrate() {
    // by calling vibration this way, we can easily change to another alternative
    HapticFeedback.mediumImpact();
  }

  static void lightVibrate() {
    // by calling vibration this way, we can easily change to another alternative
    HapticFeedback.lightImpact();
  }

  static void clickVibrate() {
    // by calling vibration this way, we can easily change to another alternative
    HapticFeedback.selectionClick();
  }
}
