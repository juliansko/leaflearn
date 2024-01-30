import 'package:flutter/material.dart';
import 'package:leaflearn/parts/coursemini.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [
        CourseMini(title: 'Test', progress: 0.5),
      ],
    ));
  }
}
