import 'package:flutter/material.dart';

import 'delegate.dart';

class NexusPage<T> extends Page<T> {
  final Widget Function() builder;

  NexusPage({super.name, required this.builder, LocalKey? key})
      : super(key: key ?? ValueKey(name));

  @override
  Route<T> createRoute(BuildContext context) =>
      NexusPageRoute<T>(settings: this, page: builder);
}

class NexusPageRoute<T> extends PageRoute<T> {
  NexusPageRoute({
    RouteSettings? settings,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.barrierColor,
    this.page,
    this.barrierLabel,
    this.maintainState = true,
  }) : super(settings: settings);

  final Widget Function()? page;

  @override
  final Duration transitionDuration;

  @override
  final Color? barrierColor;

  @override
  final String? barrierLabel;

  @override
  final bool maintainState;

  @override
  void dispose() {
    _child = null;
    super.dispose();
  }

  Widget? _child;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final child = _child ?? page!();
    final Widget result = Semantics(
      scopesRoute: true,
      explicitChildNodes: true,
      child: child,
    );
    return result;
  }
}

class InformationParser extends RouteInformationParser<Page> {
  factory InformationParser.createInformationParser(
      {String initialRoute = '/'}) {
    return InformationParser(initialRoute: initialRoute);
  }

  final String initialRoute;

  InformationParser({required this.initialRoute}) {}

  @override
  Future<Page> parseRouteInformation(RouteInformation routeInformation) =>
      Future.value(NexusDelegate.registeredRoutes.last);
}
