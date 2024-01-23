import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leaflearn/parts/appbars.dart';
import 'package:leaflearn/parts/navrail.dart';

class NestedNavigation extends StatelessWidget {
  const NestedNavigation({
    Key? key,
    // gets navigation shell from router/routes.dart
    required this.navigationShell,
  }) : super(
            key: key ?? const ValueKey<String>('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  // defines function for switching branches (Bottom Bar or Nav Rail)
  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        // determines if the user is on mobile phone
        bool mobile =
            constraints.maxWidth < 450 || orientation == Orientation.portrait;
        // returns the app bar if user is on small screen
        if (mobile) {
          return AppBars(
            body: navigationShell,
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: _goBranch,
          );
        }
        // returns the navigation rail if user is on large screen
        else {
          return NavRail(
            body: navigationShell,
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: _goBranch,
          );
        }
      });
    });
  }
}
