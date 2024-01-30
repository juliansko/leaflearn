import 'package:flutter/material.dart';
import 'package:leaflearn/parts/coursemini.dart';
import 'package:leaflearn/services/loginservice.dart';
import 'package:provider/provider.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final ScrollController _firstController = ScrollController();
  final ScrollController _secondController = ScrollController();
  List<Course> courses = [
    Course(title: 'Garbage Collection', progress: 0.7),
    Course(
      title: 'Recycling',
      progress: 0.3,
    ),
    Course(
      title: 'Buying Groceries',
      progress: 0.5,
    ),
    Course(
      title: 'Sustainable Cities',
      progress: 0.5,
    ),
    Course(
      title: 'Green Energy',
      progress: 0.2,
    ),
    Course(
      title: 'Air Pollution',
      progress: 0.8,
    ),
  ];
  List<Course> recommendedCourses = [
    Course(title: 'Garden Composting', progress: 0),
    Course(title: 'Healthy Eating', progress: 0),
    Course(title: 'Meditation', progress: 0),
    Course(title: 'Food chains', progress: 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginInfo>(
      builder: (context, loginInfo, child) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text("Welcome back, ${loginInfo.user!.firstName}!",
                  style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 20),
              Text(
                'Your courses:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 10), // Space between the text and the list
              Container(
                height: 100,
                child: Scrollbar(
                  //isAlwaysShown: true,
                  thumbVisibility: true,
                  controller: _firstController,
                  thickness: 6.0,
                  radius: Radius.circular(5.0),
                  child: ListView.builder(
                    controller: _firstController,
                    scrollDirection: Axis.horizontal,
                    itemCount: courses.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            EdgeInsets.only(right: 8), // Space between items
                        child: CourseMini(
                          course: courses[index],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Divider(),
              SizedBox(height: 10),

              Text(
                'Recommended for you:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 10),
              Container(
                height: 100,
                child: Scrollbar(
                  //isAlwaysShown: true,
                  thumbVisibility: true,
                  controller: _secondController,
                  thickness: 6.0,
                  radius: Radius.circular(5.0),
                  child: ListView.builder(
                    controller: _secondController,
                    scrollDirection: Axis.horizontal,
                    itemCount: recommendedCourses.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            EdgeInsets.only(right: 8), // Space between items
                        child: CourseMini(
                          course: recommendedCourses[index],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
