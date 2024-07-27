import 'package:flutter/material.dart';

import 'route.dart';

class NexusDelegate extends RouterDelegate<NexusPage> with ChangeNotifier {
  static final List<NexusPage> _routeTree = [];
  static List<NexusPage> get registeredRoutes => _routeTree;
  GlobalKey<NavigatorState> navigatorKey;

  factory NexusDelegate.createDelegate({
    GlobalKey<NavigatorState>? navigatorKey,
    required List<NexusPage> page,
  }) =>
      NexusDelegate(navigatorKey: navigatorKey, page: page);

  NexusDelegate({
    GlobalKey<NavigatorState>? navigatorKey,
    required List<NexusPage> page,
  }) : navigatorKey = navigatorKey ?? GlobalKey<NavigatorState>() {
    addPages(page);
  }

  void addPages(List<NexusPage> getPages) {
    _routeTree.addAll(getPages);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: (route, result) {
        final didPop = route.didPop(result);
        if (!didPop) return false;
        return true;
      },
      pages: _routeTree.map((e) => e).toList(),
    );
  }

  @override
  NexusPage? get currentConfiguration {
    if (_routeTree.isEmpty) return null;
    return _routeTree.last;
  }

  @override
  Future<bool> popRoute() async {
    return false;
  }

  @override
  Future<void> setNewRoutePath(configuration) async {}
}
