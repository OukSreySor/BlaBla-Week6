import 'package:blabla_week6/EX-1-START-CODE/models/course_model.dart';
import 'package:blabla_week6/EX-1-START-CODE/repositories/courses_repository.dart';
import 'package:flutter/material.dart';

class CoursesProvider with ChangeNotifier{
  
  final CoursesRepository _coursesRepository;

  CoursesProvider(this._coursesRepository);
  List<Course> get allCourses => _coursesRepository.getCourses();

  Course getCoursesFor(String courseId) {
    return allCourses.firstWhere((course) => course.name == courseId);
  }

  void addScore(String courseId, CourseScore score) {
    final course = getCoursesFor(courseId);
    _coursesRepository.addScore(course, score);
    notifyListeners();
  }
}