import 'package:flutter/material.dart';

class CourseMini extends StatelessWidget {
  const CourseMini({Key? key, required this.title, required this.progress})
      : super(key: key);
  final String title;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(title),
    );
  }
}
