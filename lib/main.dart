import 'package:flutter/material.dart';
import 'package:student_management/utils/theme.dart';
import 'package:student_management/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MainTheme.lightMode,
      darkTheme: MainTheme.darkMode,
      home: const HomePage(),
    );
  }
}
