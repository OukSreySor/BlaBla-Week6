
import 'package:blabla_week6/EX-1-START-CODE/provider/courses_provider.dart';
import 'package:blabla_week6/EX-1-START-CODE/repositories/courses_mock_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/course_list_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CoursesProvider(CoursesMockRepository()), 
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Consumer<CoursesProvider>(
        builder: (context, coursesProvider, child){
          return CourseListScreen(coursesProvider: coursesProvider);
      },)
      
    );
  }
}
