import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:nexus/src/localization/localization.dart';
import 'package:nexus/src/utils/connectivity.dart';

import 'config.dart';
import 'delegate.dart';
import 'route.dart';

class NexusRoot extends StatefulWidget {
  const NexusRoot({
    super.key,
    required this.config,
    required this.child,
    this.onConnectionChange,
  });

  final AppConfig config;
  final Widget child;
  final Function(ConnectivityResult result)? onConnectionChange;

  @override
  State<NexusRoot> createState() => NexusRootState();

  static NexusRootState of(BuildContext context) {
    late NexusRootState root;
    if (context is StatefulElement && context.state is NexusRootState) {
      root = context.state as NexusRootState;
    }
    root = context.findRootAncestorStateOfType<NexusRootState>() ?? root;
    return root;
  }
}

class NexusRootState extends State<NexusRoot> with WidgetsBindingObserver {
  static NexusRootState? _controller;
  static NexusRootState get controller {
    if (_controller == null) {
      throw Exception('NexusRoot is not part of the three');
    } else {
      return _controller!;
    }
  }

  late AppConfig config;

  @override
  void initState() {
    config = widget.config;
    NexusRootState._controller = this;
    init();
    _checkConnectivity();
    super.initState();
  }

  void init() {
    if (config.routerDelegate == null) {
      final newDelegate = NexusDelegate.createDelegate(
        page: [
          NexusPage(
            name: cleanRouteName("/${config.home.runtimeType}"),
            builder: () => config.home!,
          )
        ],
        navigatorKey: config.navigatorKey,
      );
      config = config.copyWith(routerDelegate: newDelegate);
    }

    if (config.locales.isNotEmpty) {
      NexusLocalization.readAllFiles(config.locales);
    }
  }

  void _checkConnectivity() async {
    await NexusConnectivity().checkConnectivity();
    await NexusConnectivity.connectivity.onConnectivityChanged
        .listen((event) async {
      await NexusConnectivity().checkConnectivity();
      widget.onConnectionChange?.call(NexusConnectivity.connectivityResult);
    });
  }

  @override
  dispose() {
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;

  NexusDelegate get rootDelegate => config.routerDelegate as NexusDelegate;
  GlobalKey<NavigatorState> get key => rootDelegate.navigatorKey;

  void update() {
    context.visitAncestorElements((element) {
      element.markNeedsBuild();
      return false;
    });
  }

  void setTheme(ThemeData value) {
    config = config.copyWith(theme: value);
    update();
  }

  void setThemeMode(ThemeMode value) {
    config = config.copyWith(themeMode: value);
    update();
  }

  String cleanRouteName(String name) {
    name = name.replaceAll('() => ', '');
    if (!name.startsWith('/')) {
      name = '/$name';
    }
    return Uri.tryParse(name)?.toString() ?? name;
  }
}
