import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:leaflearn/models/course.model.dart';

class CourseOverviewPage extends StatelessWidget {
  const CourseOverviewPage({required this.course, super.key});

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.title),
      ),
      body: SafeArea(
        child: Markdown(
          data: course.overview,
        ),
      ),
    );
  }
}
