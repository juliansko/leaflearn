import 'package:flutter/material.dart';
import 'package:leaflearn/content/courses.dart';
import 'package:leaflearn/parts/coursemini.dart';
import 'package:leaflearn/services/loginservice.dart';
import 'package:provider/provider.dart';
import 'package:leaflearn/models/course.model.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final ScrollController _zeroController = ScrollController();
  final ScrollController _firstController = ScrollController();
  List<CourseModel> featuredCourses = [
    CourseModel(
        title: 'Sustainable Diet',
        progress: 0,
        overview:
            'Die weltweite ***Lebensmittelproduktion*** beansprucht mehr als ein Drittel der Landfläche und trägt etwa 30% der anthropogenen Treibhausgasemissionen bei.![](images/burger.jpeg) Die Umweltauswirkungen dieser Produktion sind als erhebliche Bedrohung für die Umwelt identifiziert worden. Technologische Fortschritte in der Landwirtschaft allein reichen nicht aus, um diesen Herausforderungen zu begegnen. Veränderungen hin zu nachhaltigeren Essgewohnheiten werden als entscheidend angesehen, um die Umweltbelastung des Ernährungssystems zu verringern.'),
    healthyLifeStyle,
  ];
  List<CourseModel> courses = [
    CourseModel(title: 'Garbage Collection', progress: 0.7),
    CourseModel(
      title: 'Recycling',
      progress: 0.3,
    ),
    CourseModel(
      title: 'Buying Groceries',
      progress: 0.5,
    ),
    CourseModel(
      title: 'Sustainable Cities',
      progress: 0.5,
    ),
    CourseModel(
      title: 'Green Energy',
      progress: 0.2,
    ),
    CourseModel(
      title: 'Air Pollution',
      progress: 0.8,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginInfo>(
      builder: (context, loginInfo, child) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Text("Welcome back, ${loginInfo.user!.firstName}!",
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 20),
              Text(
                'Featured courses:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 10), // Space between the text and the list
              Container(
                height: 100,
                child: Scrollbar(
                  //isAlwaysShown: true,
                  thumbVisibility: false,
                  controller: _zeroController,
                  thickness: 6.0,
                  radius: const Radius.circular(5.0),
                  child: ListView.builder(
                    controller: _firstController,
                    scrollDirection: Axis.horizontal,
                    itemCount: featuredCourses.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            right: 8), // Space between items
                        child: CourseMini(
                          course: featuredCourses[index],
                        ),
                      );
                    },
                  ),
                ),
              ),
              const Divider(),
              const SizedBox(height: 10),
              Text(
                'Your courses:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 10), // Space between the text and the list
              Container(
                height: 100,
                child: Scrollbar(
                  //isAlwaysShown: true,
                  thumbVisibility: false,
                  controller: _firstController,
                  thickness: 6.0,
                  radius: const Radius.circular(5.0),
                  child: ListView.builder(
                    controller: _firstController,
                    scrollDirection: Axis.horizontal,
                    itemCount: courses.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            right: 8), // Space between items
                        child: CourseMini(
                          course: courses[index],
                        ),
                      );
                    },
                  ),
                ),
              ),
              const Divider(),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}
