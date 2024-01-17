import 'package:flutter/material.dart';
import 'package:leaflearn/router/router_config.dart';
import 'themes/dark.dart';
import 'themes/light.dart';
import 'pages/home.dart';

void main() {
  // starts app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // application root
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'LeafLearn',
      theme: lightTheme,
      darkTheme: darkTheme,
      routerConfig: router,
    );
  }
}
