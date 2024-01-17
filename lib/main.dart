import 'package:flutter/material.dart';
import 'package:leaflearn/src/pages/settings.dart';
import 'themes/dark.dart';
import 'themes/light.dart';
import 'src/pages/home.dart';

void main() {
  // starts app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // application root
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LeafLearn',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const StartPage(),
    );

  }
}




