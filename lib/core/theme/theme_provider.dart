import 'package:bodybuilding_tracking/core/theme/theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = darkMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData.brightness == Brightness.light) {
      _themeData = darkMode;
    } else {
      _themeData = lightMode;
    }
    notifyListeners();
  }
}
