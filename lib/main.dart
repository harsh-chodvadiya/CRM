import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:crm/src/constant/constant.dart';
import 'package:crm/src/my_app.dart';
import 'package:crm/src/utils/utils.dart';
import 'package:nexus/nexus.dart';

Future<void> main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Storage.initialize();
      // await FileOperations.initialize();
      // if (Platform.isIOS) {
      //   await Firebase.initializeApp(options: DefaultFirebaseOptions.ios);
      // } else {
      //   await Firebase.initializeApp();
      // }
      FlutterError.onError = (errorDetails) {
        Nexus.log('${errorDetails.exception}', logType: Log.error);
        if (!kDebugMode) {
          // FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
        }
      };
      PlatformDispatcher.instance.onError = (error, stack) {
        Nexus.log('$error', logType: Log.error);
        if (!kDebugMode) {
          // FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        }
        return true;
      };
      runApp(const MyApp());
    },
    (error, stack) {
      Nexus.log('$error', logType: Log.error);
      if (!kDebugMode) {
        // FirebaseCrashlytics.instance.recordError(error, stack);
      }
    },
  );
}
