import 'package:flutter/material.dart';
import 'package:student_management/view/home/home.dart';
import 'package:student_management/view/main/bottom_navigation.dart';
import 'package:student_management/view/period_time/period_time.dart';
import 'package:student_management/view/settings/settings.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final _pagesList = [
    const HomePage(),
    const PeriodTime(),
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: selectedIndexNotifier,
          builder: (context, newIndex, _) {
            return _pagesList[newIndex];
          }),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
