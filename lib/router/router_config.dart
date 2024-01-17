import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leaflearn/parts/navbottom.dart';
import 'package:leaflearn/pages/home.dart';
import 'package:leaflearn/pages/settings.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKeyHome =
    GlobalKey<NavigatorState>(debugLabel: 'shellHome');
final _shellNavigatorKeySettings =
    GlobalKey<NavigatorState>(debugLabel: 'shellSettings');
final router = GoRouter(
    initialLocation: '/home',
    navigatorKey: _rootNavigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return NavBottom(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(
              navigatorKey: _shellNavigatorKeyHome,
              routes: [
                GoRoute(
                  path: '/home',
                  builder: (context, state) =>
                      const StartPage(title: 'LeafLearn Home'),
                )
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorKeySettings,
              routes: [
                GoRoute(
                  path: '/settings',
                  builder: (context, state) => const SettingsPage(
                    title: 'Settings Page',
                  ),
                )
              ],
            )
          ])
    ]);
