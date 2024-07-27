import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import 'config.dart';
import 'root.dart';

class NexusApp extends StatelessWidget {
  final GlobalKey<NavigatorState>? navigatorKey;
  final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;
  final Widget? home;
  final Map<String, WidgetBuilder>? routes;
  final String? initialRoute;
  final RouteFactory? onGenerateRoute;
  final InitialRouteListFactory? onGenerateInitialRoutes;
  final RouteFactory? onUnknownRoute;
  final TransitionBuilder? builder;
  final String title;
  final GenerateAppTitle? onGenerateTitle;
  final ThemeData? theme;
  final ThemeData? darkTheme;
  final ThemeMode themeMode;
  final Color? color;
  final TextDirection? textDirection;
  final Locale? locale;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final LocaleListResolutionCallback? localeListResolutionCallback;
  final LocaleResolutionCallback? localeResolutionCallback;
  final Iterable<Locale> supportedLocales;
  final bool showPerformanceOverlay;
  final bool checkerboardRasterCacheImages;
  final bool checkerboardOffscreenLayers;
  final bool showSemanticsDebugger;
  final bool debugShowCheckedModeBanner;
  final Map<LogicalKeySet, Intent>? shortcuts;
  final ScrollBehavior? scrollBehavior;
  final ThemeData? highContrastTheme;
  final ThemeData? highContrastDarkTheme;
  final Map<Type, Action<Intent>>? actions;
  final bool debugShowMaterialGrid;
  final bool? opaqueRoute;
  final bool? popGesture;
  final RouteInformationProvider? routeInformationProvider;
  final RouteInformationParser<Object>? routeInformationParser;
  final RouterDelegate<Object>? routerDelegate;
  final RouterConfig<Object>? routerConfig;
  final BackButtonDispatcher? backButtonDispatcher;
  final bool useInheritedMediaQuery;
  final void Function(ConnectivityResult result)? onConnectionChange;

  const NexusApp({
    Key? key,
    this.navigatorKey,
    this.scaffoldMessengerKey,
    this.home,
    Map<String, Widget Function(BuildContext)> this.routes =
        const <String, WidgetBuilder>{},
    this.initialRoute,
    this.onGenerateRoute,
    this.onGenerateInitialRoutes,
    this.onUnknownRoute,
    this.useInheritedMediaQuery = false,
    this.builder,
    this.textDirection,
    this.title = '',
    this.onGenerateTitle,
    this.color,
    this.theme,
    this.darkTheme,
    this.themeMode = ThemeMode.system,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.debugShowMaterialGrid = false,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.scrollBehavior,
    this.opaqueRoute,
    this.popGesture,
    this.highContrastTheme,
    this.highContrastDarkTheme,
    this.actions,
    this.onConnectionChange,
  })  : routeInformationProvider = null,
        backButtonDispatcher = null,
        routeInformationParser = null,
        routerDelegate = null,
        routerConfig = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return NexusRoot(
      onConnectionChange: onConnectionChange,
      config: AppConfig(
        routeInformationProvider: routeInformationProvider,
        routeInformationParser: routeInformationParser,
        routerDelegate: routerDelegate,
        backButtonDispatcher: backButtonDispatcher,
        navigatorKey: navigatorKey,
        scaffoldMessengerKey: scaffoldMessengerKey,
        // locale: locale,
        locales: supportedLocales,
        initialRoute: initialRoute,
        home: home,
        theme: theme,
        darkTheme: darkTheme,
        themeMode: themeMode,
      ),
      child: Builder(builder: (context) {
        final controller = NexusRoot.of(context);
        return MaterialApp.router(
          routerDelegate: controller.config.routerDelegate,
          routeInformationParser: controller.config.routeInformationParser,
          backButtonDispatcher: backButtonDispatcher,
          routeInformationProvider: routeInformationProvider,
          routerConfig: routerConfig,
          builder: (context, child) => builder == null
              ? (child ?? const Material())
              : builder!(context, child ?? const Material()),
          title: title,
          onGenerateTitle: onGenerateTitle,
          color: color,
          theme: controller.config.theme ?? ThemeData.fallback(),
          darkTheme: controller.config.darkTheme ??
              controller.config.theme ??
              ThemeData.fallback(),
          themeMode: controller.config.themeMode,
          scaffoldMessengerKey: controller.config.scaffoldMessengerKey,
          supportedLocales: controller.config.locales,
          localizationsDelegates: localizationsDelegates,
          localeListResolutionCallback: localeListResolutionCallback,
          localeResolutionCallback: localeResolutionCallback,
          debugShowMaterialGrid: debugShowMaterialGrid,
          showPerformanceOverlay: showPerformanceOverlay,
          checkerboardRasterCacheImages: checkerboardRasterCacheImages,
          checkerboardOffscreenLayers: checkerboardOffscreenLayers,
          showSemanticsDebugger: showSemanticsDebugger,
          debugShowCheckedModeBanner: debugShowCheckedModeBanner,
          shortcuts: shortcuts,
          scrollBehavior: scrollBehavior,
        );
      }),
    );
  }
}
