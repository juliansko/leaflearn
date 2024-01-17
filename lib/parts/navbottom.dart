import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavBottom extends StatelessWidget {
  const NavBottom({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                right:
                    20.0), // idk why this needs to be const but the app is so much faster when it is
            child: Image.asset(
              'images/logo.png',
              height: 50,
            ),
          )
        ],
      ),
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'home'),
          NavigationDestination(icon: Icon(Icons.book), label: 'courses'),
          NavigationDestination(icon: Icon(Icons.chat), label: 'messenger'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'settings'),
        ],
        onDestinationSelected: _goBranch,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
    );
  }
}
