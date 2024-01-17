import 'package:flutter/material.dart';
import 'package:leaflearn/parts/navbottom.dart';
import '../../parts/appbar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: makeAppBar(context),
      body: const Center(
        child: Text("Settings Page"),
      ),
      bottomNavigationBar: makeNavBottom(context),
    );
  }
}