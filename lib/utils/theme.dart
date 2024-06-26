import 'package:flutter/material.dart';
import 'package:student_management/utils/consts.dart';

//LIGHT
class MainTheme {
  static final lightMode = ThemeData(
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      color: Color.fromARGB(255, 247, 247, 247),
      iconTheme: IconThemeData(
        color: Color.fromARGB(255, 40, 40, 40),
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
        color: mainColor,
      )),
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 247, 247, 247),
    primaryColor: mainColor,
    cardColor: kWhiteColor,
    iconTheme: const IconThemeData(
      color: mainColor,
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(
        color: Colors.black.withOpacity(0.4),
      ),
      bodyMedium: const TextStyle(
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
      elevation: 0,
      centerTitle: true,
      color: Color.fromARGB(255, 40, 40, 40),
      iconTheme: IconThemeData(
        color: Color.fromARGB(255, 247, 247, 247),
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
    textTheme: TextTheme(
      bodySmall: TextStyle(
        color: Colors.grey.withOpacity(0.7),
      ),
      bodyMedium: const TextStyle(
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
