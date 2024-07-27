// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:crm/src/view/contacts.dart' as _i1;
import 'package:crm/src/view/dashboard.dart' as _i2;
import 'package:crm/src/view/leads/leads.dart' as _i3;
import 'package:crm/src/view/sidebar.dart' as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    Contacts.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.Contacts(),
      );
    },
    Dashboard.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.Dashboard(),
      );
    },
    Leads.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.Leads(),
      );
    },
    SideBar.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SideBar(),
      );
    },
  };
}

/// generated route for
/// [_i1.Contacts]
class Contacts extends _i5.PageRouteInfo<void> {
  const Contacts({List<_i5.PageRouteInfo>? children})
      : super(
          Contacts.name,
          initialChildren: children,
        );

  static const String name = 'Contacts';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.Dashboard]
class Dashboard extends _i5.PageRouteInfo<void> {
  const Dashboard({List<_i5.PageRouteInfo>? children})
      : super(
          Dashboard.name,
          initialChildren: children,
        );

  static const String name = 'Dashboard';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.Leads]
class Leads extends _i5.PageRouteInfo<void> {
  const Leads({List<_i5.PageRouteInfo>? children})
      : super(
          Leads.name,
          initialChildren: children,
        );

  static const String name = 'Leads';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SideBar]
class SideBar extends _i5.PageRouteInfo<void> {
  const SideBar({List<_i5.PageRouteInfo>? children})
      : super(
          SideBar.name,
          initialChildren: children,
        );

  static const String name = 'SideBar';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
