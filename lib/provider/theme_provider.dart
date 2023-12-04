import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isList = true;
  ThemeMode themeMode = ThemeMode.light;

  void changeView() {
    isList = !isList;
    notifyListeners();
  }

  void chanegTheme() {
    themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
