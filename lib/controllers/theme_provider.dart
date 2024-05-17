import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;

  ThemeProvider() {
    themeChange();
  }

  void themeChange() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
