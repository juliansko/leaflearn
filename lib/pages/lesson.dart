import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:leaflearn/models/lesson.model.dart';

class LessonPage extends StatelessWidget {
  const LessonPage({required this.lesson, super.key});

  final LessonModel lesson;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lesson.title),
      ),
      body: SafeArea(
        child: Markdown(
          data: lesson.content,
        ),
      ),
    );
  }
}
