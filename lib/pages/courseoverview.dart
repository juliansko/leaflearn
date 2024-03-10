import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:leaflearn/models/course.model.dart';
import 'package:leaflearn/parts/lessonmini.dart';

class CourseOverviewPage extends StatefulWidget {
  const CourseOverviewPage({required this.course, super.key});

  final CourseModel course;

  @override
  State<CourseOverviewPage> createState() => _CourseOverviewPageState();
}

class _CourseOverviewPageState extends State<CourseOverviewPage> {
  CourseModel course =
      CourseModel(title: 'Loading', overview: 'Loading', progress: 0);
  @override
  void initState() {
    course = widget.course;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.course.title),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MarkdownBody(
                data: course.overview,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(right: 8), // Space between items
                  child: LessonMini(
                    lesson: course.chapters[index],
                  ),
                );
              },
              childCount: course.chapters.length,
            ),
          ),
        ],
      ),
    );
  }
}
