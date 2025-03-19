import 'package:blabla_week6/EX-1-START-CODE/models/course_model.dart';
import 'package:blabla_week6/EX-1-START-CODE/repositories/courses_repository.dart';

class CoursesMockRepository extends CoursesRepository {

  final List<Course> _courses = [
    Course(name: 'Flutter'),
    Course(name: 'Python'),
    Course(name: 'JAVA'),
    Course(name: 'HTML'),
  ];

  @override
  List<Course> getCourses() => _courses;

  @override
  void addScore(Course course, CourseScore score) {
    course.addScore(score);
  }

}