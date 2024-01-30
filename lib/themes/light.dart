import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  // Creates Application color scheme from Light Green
  colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.lightGreen, brightness: Brightness.light),

  useMaterial3: true,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 72,
      fontWeight: FontWeight.bold,
    ),
    // ···
    titleLarge: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      fontSize: 25,
    ),
  ),
);
