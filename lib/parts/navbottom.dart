import 'package:flutter/material.dart';

BottomNavigationBar makeNavBottom(BuildContext context){
  return BottomNavigationBar(
    backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Library'),
      BottomNavigationBarItem(icon: Icon(Icons.play_arrow), label: 'Play'),
      BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
    ],
    showSelectedLabels: false,
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed,
  );
}