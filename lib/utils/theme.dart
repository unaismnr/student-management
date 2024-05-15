import 'package:flutter/material.dart';
import 'package:student_management/utils/consts.dart';

class MainTheme {
  static final lightMode = ThemeData(
    // appBarTheme: const AppBarTheme(
    //   centerTitle: true,
    //   color: mainColor,
    // ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 247, 247, 247),
    primaryColor: mainColor,
    cardColor: kWhiteColor,
    iconTheme: const IconThemeData(
      color: mainColor,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: kBlackColor,
      ),
    ),
  );
  static final darkMode = ThemeData(
    // appBarTheme: const AppBarTheme(
    //   centerTitle: true,
    //   color: mainColor,
    // ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 35, 35, 35),
    primaryColor: kBlackColor,
    cardColor: const Color.fromARGB(255, 48, 49, 52),
    iconTheme: const IconThemeData(
      color: Color.fromARGB(255, 245, 245, 245),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Color.fromARGB(255, 245, 245, 245),
      ),
    ),
  );
}
