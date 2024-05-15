import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class NavigationHelper {
  static void push(BuildContext context, Widget page) {
    Navigator.of(context).push(
      PageTransition(
        child: page,
        type: PageTransitionType.rightToLeft,
        duration: const Duration(milliseconds: 1),
      ),
    );
  }
}
