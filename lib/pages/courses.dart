import 'package:flutter/material.dart';
import 'package:leaflearn/parts/coursemini.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final ScrollController _firstController = ScrollController();
  late List<Course> allCourses;

  @override
  void initState() {
    super.initState();
    allCourses = [
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
      Course(title: 'Garden Composting', progress: 0),
      Course(title: 'Healthy Eating', progress: 0),
      Course(title: 'Meditation', progress: 0),
      Course(title: 'Food chains', progress: 0),
      Course(title: 'Ethical fashion', progress: 0),
      Course(title: 'Sustainable travel', progress: 0),
      Course(title: 'Urban planning', progress: 0),
      Course(title: 'Global water ressources', progress: 0),
      Course(title: 'Greenwashing', progress: 0),
      Course(title: 'Sustainable architecture', progress: 0),
      Course(title: 'Global Health', progress: 0),
      Course(title: 'Global warming', progress: 0)
    ];

    allCourses.sort((a, b) => a.title.compareTo(b.title));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text("All courses",
                  style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 10),
              Container(
                height: 1000,
                width: 500,
                child: Scrollbar(
                  //isAlwaysShown: true,
                  thumbVisibility: true,
                  controller: _firstController,
                  thickness: 6.0,
                  radius: Radius.circular(5.0),
                  child: ListView.builder(
                    controller: _firstController,
                    scrollDirection: Axis.vertical,
                    itemCount: allCourses.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            EdgeInsets.only(right: 8), // Space between items
                        child: CourseMini(
                          course: allCourses[index],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
