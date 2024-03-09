import 'package:flutter/material.dart';
import 'package:leaflearn/parts/coursemini.dart';
import 'package:leaflearn/models/course.model.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final ScrollController _firstController = ScrollController();
  late List<CourseModel> allCourses;

  @override
  void initState() {
    super.initState();
    allCourses = [
      CourseModel(
          title: 'Garbage Collection', progress: 0.7, overview: 'Placeholder'),
      CourseModel(title: 'Recycling', progress: 0.3, overview: 'Placeholder'),
      CourseModel(
          title: 'Buying Groceries', progress: 0.5, overview: 'Placeholder'),
      CourseModel(
          title: 'Sustainable Cities', progress: 0.5, overview: 'Placeholder'),
      CourseModel(
          title: 'Green Energy', progress: 0.2, overview: 'Placeholder'),
      CourseModel(
          title: 'Air Pollution', progress: 0.8, overview: 'Placeholder'),
      CourseModel(
          title: 'Garden Composting', progress: 0, overview: 'Placeholder'),
      CourseModel(
          title: 'Healthy Eating',
          progress: 0,
          overview:
              'Die weltweite ***Lebensmittelproduktion*** beansprucht mehr als ein Drittel der Landfläche und trägt etwa 30% der anthropogenen Treibhausgasemissionen bei. Die Umweltauswirkungen dieser Produktion sind als erhebliche Bedrohung für die Umwelt identifiziert worden. Technologische Fortschritte in der Landwirtschaft allein reichen nicht aus, um diesen Herausforderungen zu begegnen. Veränderungen hin zu nachhaltigeren Essgewohnheiten werden als entscheidend angesehen, um die Umweltbelastung des Ernährungssystems zu verringern. '),
      CourseModel(title: 'Meditation', progress: 0, overview: 'Placeholder'),
      CourseModel(title: 'Food chains', progress: 0, overview: 'Placeholder'),
      CourseModel(
          title: 'Ethical fashion', progress: 0, overview: 'Placeholder'),
      CourseModel(
          title: 'Sustainable travel', progress: 0, overview: 'Placeholder'),
      CourseModel(
          title: 'Urban planning', progress: 0, overview: 'Placeholder'),
      CourseModel(title: 'Global water ressources', progress: 0),
      CourseModel(title: 'Greenwashing', progress: 0),
      CourseModel(title: 'Sustainable architecture', progress: 0),
      CourseModel(title: 'Global Health', progress: 0),
      CourseModel(title: 'Global warming', progress: 0)
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
              const SizedBox(height: 20),
              Text("All courses",
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 10),
              Container(
                height: 1000,
                width: 500,
                child: Scrollbar(
                  //isAlwaysShown: true,
                  thumbVisibility: true,
                  controller: _firstController,
                  thickness: 6.0,
                  radius: const Radius.circular(5.0),
                  child: ListView.builder(
                    controller: _firstController,
                    scrollDirection: Axis.vertical,
                    itemCount: allCourses.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            right: 8), // Space between items
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
