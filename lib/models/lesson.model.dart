class LessonModel {
  final String title;
  bool completed;
  String content;

  LessonModel(
      {required this.title,
      this.content = 'This is a chapter for the course',
      this.completed = false});
}
