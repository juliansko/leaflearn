class CourseModel {
  final String title;
  final double progress;
  String overview;
  List<Object> chapters;

  CourseModel(
      {required this.title,
      required this.progress,
      this.overview = 'This is the overview for the course',
      this.chapters = const []});
}
