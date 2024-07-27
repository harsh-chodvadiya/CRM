import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:nexus/src/constant/enum.dart';

class Logger {
  Logger._();

  static String _color(Log? logType) {
    switch (logType) {
      case Log.error:
        return '\x1B[31m';
      case Log.warning:
        return '\x1B[33m';
      case Log.success:
        return '\x1B[32m';
      case Log.info:
        return '\x1B[36m';
      default:
        return '\x1B[35m';
    }
  }

  static void logger(
    String message, {
    Log? logType,
    bool isError = false,
    String className = '',
  }) {
    if (isError || kDebugMode) {
      if (className.isNotEmpty) {
        className = ': (${_color(logType)}$className\x1B[0m) ';
      }
      log('$className${_color(logType)}$message',
          name: '${_color(logType)}Nexus\x1B[0m');
    }
  }
}

// class Color {
//   final red = '\x1B[31m';
//   final green = '\x1B[32m';
//   final yellow = '\x1B[33m';
//   final blue = '\x1B[34m';
//   final magenta = '\x1B[35m';
//   final cyan = '\x1B[36m';
//   final blink = '\x1B[6m';
// }
