import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leaflearn/parts/appbars.dart';
import 'package:leaflearn/parts/navrail.dart';

class NestedNavigation extends StatelessWidget {
  const NestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(
            key: key ?? const ValueKey<String>('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

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
        bool mobile =
            constraints.maxWidth < 450 || orientation == Orientation.portrait;
        if (mobile) {
          return AppBars(
            body: navigationShell,
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: _goBranch,
          );
        } else {
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
