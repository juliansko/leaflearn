import 'package:leaflearn/parts/coursemini.dart';
import 'package:flutter/material.dart';

class CourseOverviewPage extends StatelessWidget {
  CourseOverviewPage({required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.title),
      ),
      body: Center(
        // Replace with your course overview content
        child: Text('Overview of ${course.title}'),
      ),
    );
  }
}
