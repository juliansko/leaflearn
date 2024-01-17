import 'package:flutter/material.dart';

class NavRail extends StatelessWidget {
  const NavRail({
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
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
            leading: Column(
              children: <Widget>[
                Image.asset(
                  'images/logo.png',
                  height: 50,
                ), // Replace with your image asset path
                // You can add more widgets here if needed
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