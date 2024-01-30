import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  // Define the default brightness and colors.
  colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.green, brightness: Brightness.dark),
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
