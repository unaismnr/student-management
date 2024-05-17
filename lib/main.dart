import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management/controllers/theme_provider.dart';
import 'package:student_management/controllers/time_provider.dart';
import 'package:student_management/utils/theme.dart';
import 'package:student_management/view/main/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            title: 'Student Management',
            theme: MainTheme.lightMode,
            darkTheme: MainTheme.darkMode,
            themeMode: themeProvider.isDark ? ThemeMode.light : ThemeMode.dark,
            home: MainPage(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
