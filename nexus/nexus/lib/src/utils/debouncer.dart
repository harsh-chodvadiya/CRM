import 'dart:async';

import 'package:flutter/foundation.dart';

class Debouncer {
  static Timer? _timer;

  static Future<void> call(VoidCallback action) async {
    if (null != _timer) {
      _timer!.cancel();
    }
    _timer = Timer(const Duration(milliseconds: 500), action);
  }
}
