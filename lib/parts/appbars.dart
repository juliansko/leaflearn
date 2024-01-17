import 'package:flutter/material.dart';

class AppBars extends StatelessWidget {
  const AppBars({
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
        backgroundColor: Colors.grey[700],
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Image.asset(
              'images/logo.png',
              height: 50,
            ),
          )
        ],
      ),
      body: body,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'home'),
          NavigationDestination(icon: Icon(Icons.book), label: 'courses'),
          NavigationDestination(icon: Icon(Icons.chat), label: 'messenger'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'settings'),
        ],
        onDestinationSelected: onDestinationSelected,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
    );
  }
}
