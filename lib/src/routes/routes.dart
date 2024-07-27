import 'package:auto_route/auto_route.dart';

import 'routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      path: '/',
      page: SideBar.page,
      children: [
        AutoRoute(path: '', page: Dashboard.page),
        AutoRoute(path: 'leads', page: Leads.page),
        AutoRoute(path: 'contacts', page: Contacts.page),
      ],
    ),
  ];
}
