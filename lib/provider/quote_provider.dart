import 'package:flutter/material.dart';

class QuoteProvider extends ChangeNotifier {
  Color chooseColor = Colors.black;
  Color chooseBgColor = Colors.white;
  String? chooseFontFamily;
  String chooseImage = '';
  GlobalKey repaintBoundary = GlobalKey();

  void changeColor(Color color) {
    chooseColor = color;
    notifyListeners();
  }

  void changeBgColor(Color color) {
    chooseBgColor = color;
    notifyListeners();
  }
}
