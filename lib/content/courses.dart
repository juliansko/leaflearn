import 'package:leaflearn/models/course.model.dart';
import 'package:leaflearn/models/lesson.model.dart';

CourseModel healthyLifeStyle = CourseModel(
    title: 'Healthy Lifestyle',
    progress: 0,
    overview:
        'This course is designed to help you live a healthy lifestyle. It covers topics such as healthy eating, exercise, and mental health.',
    chapters: [
      LessonModel(title: 'Introduction to Healthy Lifestyle', content: """
  # Introduction
  This chapter introduces the concept of a healthy lifestyle and its importance. It also provides an overview of the topics covered in the course.
  """),
      LessonModel(title: 'Healthy Eating', content: """
  # Healthy Eating
  This chapter covers the importance of healthy eating and provides tips on how to maintain a healthy diet.
  """),
      LessonModel(title: 'Exercise', content: """
  # Exercise
  This chapter covers the importance of exercise and provides tips on how to maintain an active lifestyle.
  """),
      LessonModel(title: 'Mental Health', content: """
  # Mental Health
  This chapter covers the importance of mental health and provides tips on how to maintain a healthy mind.
  """)
    ]);

var healthyDiet = CourseModel(title: 'Healthy Diet', progress: 0);
