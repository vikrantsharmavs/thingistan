// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  var _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  void setTheme(themeValue) {
    _themeMode = themeValue;
    notifyListeners();
  }
}
