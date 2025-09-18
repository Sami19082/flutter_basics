import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get themeValue {
    return _isDarkMode;
  }

  set themeValue(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
}
