class CourseModel {
  final String title;
  final double progress;
  String content;

  CourseModel(
      {required this.title,
      required this.progress,
      this.content = 'Placeholder'});
}
