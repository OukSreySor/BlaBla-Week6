import 'package:flutter/material.dart';
import '../models/course_model.dart';
import '../provider/courses_provider.dart';
import 'course_screen.dart';

const Color mainColor = Colors.blue;

class CourseListScreen extends StatefulWidget {
  const CourseListScreen({super.key, required this.coursesProvider});

  final CoursesProvider coursesProvider;

  @override
  State<CourseListScreen> createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {

  void _editCourse(Course course) async {
    await Navigator.of(context).push<Course>(
      MaterialPageRoute(builder: (ctx) => CourseScreen(
        courseId: course.name,
        coursesProvider: widget.coursesProvider,
        
      )),
    );

    setState(() {
      // trigger a rebuild
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text('SCORE APP', style: TextStyle(color: Colors.white)),
      ),
      body:
          ListView.builder(
            itemCount: widget.coursesProvider.allCourses.length,
            itemBuilder:
              (ctx, index) => Dismissible(
                key: Key(widget.coursesProvider.allCourses[index].name),
                child: CourseTile(
                  course: widget.coursesProvider.allCourses[index],
                  onEdit: _editCourse,
                ),
              ),
            )
          );
        }
 
  }


class CourseTile extends StatelessWidget {
  const CourseTile({super.key, required this.course, required this.onEdit});

  final Course course;
  final Function(Course) onEdit;

  int get numberOfScores => course.scores.length;

  String get numberText {
    return course.hasScore ? "$numberOfScores scores" : 'No score';
  }

  String get averageText {
    String average = course.average.toStringAsFixed(1);
    return course.hasScore ? "Average : $average" : '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            onTap: () => onEdit(course),
            title: Text(course.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(numberText), Text(averageText)],
            ),
          ),
        ),
      ),
    );
  }
}
