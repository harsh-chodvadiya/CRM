import 'package:flutter/material.dart';

class AppConfig {
  final RouteInformationProvider? routeInformationProvider;
  final RouteInformationParser<Object>? routeInformationParser;
  final RouterDelegate<Object>? routerDelegate;
  final BackButtonDispatcher? backButtonDispatcher;
  final GlobalKey<NavigatorState>? navigatorKey;
  final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;
  // final Locale? locale;
  final Iterable<Locale> locales;
  final String? initialRoute;
  final Widget? home;
  final ThemeData? theme;
  final ThemeData? darkTheme;
  final ThemeMode? themeMode;

  AppConfig({
    required this.routeInformationProvider,
    required this.routeInformationParser,
    required this.routerDelegate,
    required this.backButtonDispatcher,
    required this.navigatorKey,
    required this.scaffoldMessengerKey,
    // required this.locale,
    required this.locales,
    required this.initialRoute,
    required this.home,
    this.theme,
    this.darkTheme,
    this.themeMode,
  });

  AppConfig copyWith({
    RouteInformationProvider? routeInformationProvider,
    RouteInformationParser<Object>? routeInformationParser,
    RouterDelegate<Object>? routerDelegate,
    BackButtonDispatcher? backButtonDispatcher,
    GlobalKey<NavigatorState>? navigatorKey,
    GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey,
    // Locale? locale,
    Iterable<Locale>? locales,
    String? initialRoute,
    Widget? home,
    ThemeData? theme,
    ThemeData? darkTheme,
    ThemeMode? themeMode,
  }) {
    return AppConfig(
      routeInformationProvider:
          routeInformationProvider ?? this.routeInformationProvider,
      routeInformationParser:
          routeInformationParser ?? this.routeInformationParser,
      routerDelegate: routerDelegate ?? this.routerDelegate,
      backButtonDispatcher: backButtonDispatcher ?? this.backButtonDispatcher,
      navigatorKey: navigatorKey ?? this.navigatorKey,
      scaffoldMessengerKey: scaffoldMessengerKey ?? this.scaffoldMessengerKey,
      // locale: locale ?? this.locale,
      locales: locales ?? this.locales,
      initialRoute: initialRoute ?? this.initialRoute,
      home: home ?? this.home,
      theme: theme ?? this.theme,
      darkTheme: darkTheme ?? this.darkTheme,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppConfig &&
        other.routeInformationProvider == routeInformationProvider &&
        other.routeInformationParser == routeInformationParser &&
        other.routerDelegate == routerDelegate &&
        other.backButtonDispatcher == backButtonDispatcher &&
        other.navigatorKey == navigatorKey &&
        other.scaffoldMessengerKey == scaffoldMessengerKey &&
        // other.locale == locale &&
        other.locales == locales &&
        other.initialRoute == initialRoute &&
        other.home == home &&
        other.theme == theme &&
        other.darkTheme == darkTheme &&
        other.themeMode == themeMode;
  }

  @override
  int get hashCode {
    return routeInformationProvider.hashCode ^
        routeInformationParser.hashCode ^
        routerDelegate.hashCode ^
        backButtonDispatcher.hashCode ^
        navigatorKey.hashCode ^
        scaffoldMessengerKey.hashCode ^
        // locale.hashCode ^
        locales.hashCode ^
        initialRoute.hashCode ^
        home.hashCode ^
        theme.hashCode ^
        darkTheme.hashCode ^
        themeMode.hashCode;
  }
}
