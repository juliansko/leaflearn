import 'package:leaflearn/content/lifestyle/chapter1_1.dart';
import 'package:leaflearn/content/lifestyle/chapter1_2.dart';
import 'package:leaflearn/content/lifestyle/chapter2_1.dart';
import 'package:leaflearn/content/lifestyle/chapter2_2.dart';
import 'package:leaflearn/content/lifestyle/chapter3_1.dart';
import 'package:leaflearn/content/lifestyle/chapter3_2.dart';
import 'package:leaflearn/content/lifestyle/chapter4_1.dart';
import 'package:leaflearn/content/lifestyle/chapter4_2.dart';
import 'package:leaflearn/content/lifestyle/chapter5_1.dart';
import 'package:leaflearn/content/lifestyle/chapter5_2.dart';
import 'package:leaflearn/content/lifestyle/chapter6_1.dart';
import 'package:leaflearn/content/lifestyle/chapter6_2.dart';
import 'package:leaflearn/content/lifestyle/chapter7_1.dart';
import 'package:leaflearn/content/lifestyle/chapter7_2.dart';
import 'package:leaflearn/models/course.model.dart';

CourseModel healthyLifeStyle = CourseModel(
    title: 'Gesunder Lebensstil',
    progress: 0,
    overview:
        'Dieser Kurs hilft dir dabei, einen gesunden Lebensstil zu führen',
    chapters: [
      chapter1_1,
      chapter1_2,
      chapter2_1,
      chapter2_2,
      chapter3_1,
      chapter3_2,
      chapter4_1,
      chapter4_2,
      chapter5_1,
      chapter5_2,
      chapter6_1,
      chapter6_2,
      chapter7_1,
      chapter7_2,
    ]);

var healthyDiet = CourseModel(title: 'Healthy Diet', progress: 0);
