import 'package:flutter/material.dart';
import 'package:leaflearn/pages/courseoverview.dart';

class Course {
  final String title;
  final double progress;

  Course({required this.title, required this.progress});
}

class CourseMini extends StatelessWidget {
  const CourseMini({Key? key, required this.course}) : super(key: key);
  final Course course;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  CourseOverviewPage(course: course), // CourseOverviewPage
            ));
      },
      child: Container(
        height: 65,
        width: 200,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inversePrimary,
          border: Border.all(color: Colors.black54, width: 1.0),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                course.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8), // Spacing between text and progress bar
              SizedBox(
                width:
                    150, // Width of the progress bar, less than container width
                child: LinearProgressIndicator(
                    value: course.progress,
                    color: Theme.of(context).colorScheme.primary,
                    minHeight: 7,
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
