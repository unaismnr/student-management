import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management/controllers/time_provider.dart';
import 'package:student_management/utils/theme.dart';
import 'package:student_management/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TimeProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Student Management',
        theme: MainTheme.lightMode,
        darkTheme: MainTheme.darkMode,
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
