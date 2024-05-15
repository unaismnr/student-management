import 'package:flutter/material.dart';
import 'package:student_management/utils/consts.dart';

//LIGHT
class MainTheme {
  static final lightMode = ThemeData(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: mainColor,
      iconTheme: IconThemeData(
        color: kWhiteColor,
      ),
    ),
    fontFamily: 'Lato',
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: kWhiteColor,
      indicatorColor: Color.fromARGB(255, 237, 245, 255),
      labelTextStyle: MaterialStatePropertyAll(TextStyle(
        color: kBlackColor,
      )),
      iconTheme: MaterialStatePropertyAll(IconThemeData(
        color: kBlackColor,
      )),
    ),
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
    dividerColor: Colors.grey[200],
    colorScheme: const ColorScheme.light(
      primary: mainColor,
      background: Color(0xFFDCE3EB),
      secondaryContainer: kWhiteColor,
    ),
    useMaterial3: false,
  );

  //DARK
  static final darkMode = ThemeData(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: kBlackColor,
      iconTheme: IconThemeData(
        color: kWhiteColor,
      ),
    ),
    fontFamily: 'Lato',
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: kBlackColor,
      indicatorColor: Color.fromARGB(255, 93, 123, 166),
      labelTextStyle: MaterialStatePropertyAll(TextStyle(
        color: Color.fromARGB(255, 245, 245, 245),
      )),
      iconTheme: MaterialStatePropertyAll(IconThemeData(
        color: Color.fromARGB(255, 245, 245, 245),
      )),
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 40, 40, 40),
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
    dividerColor: Colors.grey[800],
    colorScheme: const ColorScheme.light(
      primary: mainColor,
      background: Color.fromARGB(255, 40, 40, 40),
      secondaryContainer: kBlackColor,
    ),
    useMaterial3: false,
  );
}
