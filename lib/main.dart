import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:crm/src/my_app.dart';

Future<void> main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  // await Storage.initialize();
  // await FileOperations.initialize();
  // if (Platform.isIOS) {
  //   await Firebase.initializeApp(options: DefaultFirebaseOptions.ios);
  // } else {
  //   await Firebase.initializeApp();
  // }
  // await Nexus.initLocale(
  //   Storage.get(Storage.locale) != null
  //       ? Locale(Storage.get(Storage.locale).first,
  //           Storage.get(Storage.locale).last)
  //       : const Locale('en', 'US'),
  // );
  // if (Storage.get(Storage.locale) == null) {
  //   Storage.set(Storage.locale, ['en', 'US']);
  // }
  // FlutterError.onError = (errorDetails) {
  //   Nexus.log('${errorDetails.exception}', logType: Log.error);
  //   if (!kDebugMode) {
  //     // FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  //   }
  // };
  // PlatformDispatcher.instance.onError = (error, stack) {
  //   Nexus.log('$error', logType: Log.error);
  //   if (!kDebugMode) {
  //     // FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  //   }
  //   return true;
  //};
  runApp(const MyApp());
}
