import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

class NexusConnectivity extends ChangeNotifier {
  static final Connectivity connectivity = Connectivity();

  static late ConnectivityResult connectivityResult;

  Future<void> checkConnectivity() async {
    final result = await connectivity.checkConnectivity();
    if (result.isNotEmpty) {
      connectivityResult = result.first;
      notifyListeners();
    }
  }
}
