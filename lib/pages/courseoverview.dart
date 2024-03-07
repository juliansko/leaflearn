import 'package:flutter/material.dart';
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
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text('Overview of ${course.title}'),
                Text(
                  course.content,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
