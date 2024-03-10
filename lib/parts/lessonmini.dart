import 'package:flutter/material.dart';
import 'package:leaflearn/models/lesson.model.dart';
import 'package:leaflearn/pages/lesson.dart';

class LessonMini extends StatelessWidget {
  const LessonMini({Key? key, required this.lesson}) : super(key: key);
  final LessonModel lesson;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  LessonPage(lesson: lesson), // CourseOverviewPage
            ));
      },
      child: Container(
        height: 65,
        width: 200,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inversePrimary,
          border: Border.all(color: Colors.black54, width: 1.0),
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                lesson.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
