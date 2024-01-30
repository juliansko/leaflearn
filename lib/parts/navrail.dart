import 'package:flutter/material.dart';
import 'package:leaflearn/parts/progressbar.dart';

class NavRail extends StatelessWidget {
  const NavRail({
    // inherits values from router/nestednavigation.dart
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });
  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Fixed navigation rail on the left (start)
          NavigationRail(
            // gets the color from the theme
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            // index where the user is
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
            labelType: NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(
                  icon: Icon(Icons.home), label: Text('home')),
              NavigationRailDestination(
                  icon: Icon(Icons.book), label: Text('courses')),
              NavigationRailDestination(
                  icon: Icon(Icons.chat), label: Text('messenger')),
              NavigationRailDestination(
                  icon: Icon(Icons.settings), label: Text('settings')),
            ],
            // formats logo to the top of the navigation rail
            leading: Column(
              children: <Widget>[
                Image.asset(
                  'images/logo.png',
                  height: 70,
                ),
                LevelProgress(),
                SizedBox(height: 20),
              ],
            ),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          // Main content on the right (end)
          Expanded(
            child: body,
          ),
        ],
      ),
    );
  }
}
