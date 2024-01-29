import 'package:flutter/material.dart';
import 'package:leaflearn/parts/progressbar.dart';

class AppBars extends StatelessWidget {
  const AppBars({
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
      appBar: AppBar(
        // gets the color from the theme
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        flexibleSpace: LayoutBuilder(
          builder: (context, constraints) => const SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                LevelProgress(),
                Spacer(),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          Padding(
            // adds padding to the right of the app bar so logo sits there
            padding: const EdgeInsets.only(right: 20.0),
            child: Image.asset(
              'images/logo.png',
              height: 50,
            ),
          ),
        ],
      ),
      body: body,
      bottomNavigationBar: NavigationBar(
        // index where the user is
        selectedIndex: selectedIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'home'),
          NavigationDestination(icon: Icon(Icons.book), label: 'courses'),
          NavigationDestination(icon: Icon(Icons.chat), label: 'messenger'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'settings'),
        ],
        onDestinationSelected: onDestinationSelected,
        // gets the color from the theme
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      ),
    );
  }
}
