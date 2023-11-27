import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{

  bool isList = true;

  void chageView(){
    isList = !isList;
    notifyListeners();
  }

}