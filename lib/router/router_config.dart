import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leaflearn/parts/appbars.dart';
import 'package:leaflearn/pages/home.dart';
import 'package:leaflearn/pages/settings.dart';
import 'package:leaflearn/pages/courses.dart';
import 'package:leaflearn/pages/messenger.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKeyHome =
    GlobalKey<NavigatorState>(debugLabel: 'shellHome');
final _shellNavigatorKeySettings =
    GlobalKey<NavigatorState>(debugLabel: 'shellSettings');
final _shellNavigatorKeyCourses =
    GlobalKey<NavigatorState>(debugLabel: 'shellCourses');
final _shellNavigatorKeyMessenger =
    GlobalKey<NavigatorState>(debugLabel: 'shellMessenger');

final router = GoRouter(
    initialLocation: '/home',
    navigatorKey: _rootNavigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return AppBars(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(
              navigatorKey: _shellNavigatorKeyHome,
              routes: [
                GoRoute(
                  path: '/home',
                  builder: (context, state) => const StartPage(),
                )
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorKeyCourses,
              routes: [
                GoRoute(
                  path: '/courses',
                  builder: (context, state) => const CoursesPage(),
                )
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorKeyMessenger,
              routes: [
                GoRoute(
                  path: '/messenger',
                  builder: (context, state) => const MessengerPage(),
                )
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorKeySettings,
              routes: [
                GoRoute(
                  path: '/settings',
                  builder: (context, state) => const SettingsPage(),
                )
              ],
            ),
          ])
    ]);
