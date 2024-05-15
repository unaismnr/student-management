import 'dart:async';

import 'package:flutter/material.dart';

class TimeProvider extends ChangeNotifier {
  DateTime _currentTime = DateTime.now();

  DateTime get currentTime => _currentTime;

  TimeProvider() {
    updateTime();
  }

  void updateTime() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _currentTime = DateTime.now();
      notifyListeners();
    });
  }
}
