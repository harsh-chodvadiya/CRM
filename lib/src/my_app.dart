import 'package:flutter/material.dart';
import 'package:crm/src/constant/constant.dart';

import 'view/authentication/login.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 844),
      minTextAdapt: true,
      builder: (context, child) {
        return NexusApp(
          onConnectionChange: (result) {},
          debugShowCheckedModeBanner: false,
          theme: Themes.light,
          darkTheme: Themes.dark,
          themeMode: ThemeMode.light,
          home: const Login(),
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('hi', 'IN'),
          ],
        );
      },
    );
  }
}
