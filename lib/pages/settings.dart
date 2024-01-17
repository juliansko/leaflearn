import 'package:flutter/material.dart';
import 'package:leaflearn/parts/appbar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: makeAppBar(context),
      body: const Center(
        child: Text('Settings'),
      ),
    );
  }
}
