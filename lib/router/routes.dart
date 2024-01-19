import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:leaflearn/pages/courses.dart';
import 'package:leaflearn/pages/home.dart';
import 'package:leaflearn/pages/login.dart';
import 'package:leaflearn/pages/messenger.dart';
import 'package:leaflearn/pages/settings.dart';
import 'package:leaflearn/router/nestednavigation.dart';


part 'routes.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKeyHome =
    GlobalKey<NavigatorState>(debugLabel: 'shellHome');
final _shellNavigatorKeySettings =
    GlobalKey<NavigatorState>(debugLabel: 'shellSettings');
final _shellNavigatorKeyCourses =
    GlobalKey<NavigatorState>(debugLabel: 'shellCourses');
final _shellNavigatorKeyMessenger =
    GlobalKey<NavigatorState>(debugLabel: 'shellMessenger');

// Route data
@TypedStatefulShellRoute<ShellRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<HomeShellBranch>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<HomeRoute>(
          path: '/home',
        )
      ]
    ),
      TypedStatefulShellBranch<CoursesShellBranch>(
        routes: <TypedRoute<RouteData>>[
          TypedGoRoute<CoursesRoute>(
            path: '/courses',
          )
        ]
      ),
      TypedStatefulShellBranch<MessengerShellBranch>(
        routes: <TypedRoute<RouteData>>[
          TypedGoRoute<MessengerRoute>(
            path: '/messenger',
          )
        ]
      ),
      TypedStatefulShellBranch<SettingsShellBranch>(
        routes: <TypedRoute<RouteData>>[
          TypedGoRoute<SettingsRoute>(
            path: '/settings',
          )
        ]
      ),
    ],
)

class ShellRouteData extends StatefulShellRouteData {
  const ShellRouteData();

  static final GlobalKey<NavigatorState> $navigatorKey = _rootNavigatorKey;

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return NestedNavigation(navigationShell: navigationShell);
  }
}


class HomeShellBranch extends StatefulShellBranchData {
  const HomeShellBranch();
}

class HomeRoute extends GoRouteData {
  HomeRoute({this.loggedIn=false});
  final bool loggedIn;
  
  @override
  Widget build(BuildContext context, GoRouterState state) => const StartPage();
}


class CoursesShellBranch extends StatefulShellBranchData {
  const CoursesShellBranch();
}

class CoursesRoute extends GoRouteData {
  const CoursesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const CoursesPage();
}


class MessengerShellBranch extends StatefulShellBranchData {
  const MessengerShellBranch();
}

class MessengerRoute extends GoRouteData {
  const MessengerRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const MessengerPage();
}


class SettingsShellBranch extends StatefulShellBranchData {
  const SettingsShellBranch();
}

class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SettingsPage();
}



@TypedGoRoute<LoginRoute>(
  path: '/login',
)
class LoginRoute extends GoRouteData {
  LoginRoute({this.from});
  final String? from;

  @override
  
  Widget build(BuildContext context, GoRouterState state) => LoginPage(from);
}
