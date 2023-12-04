import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quotes/utils/utils.dart';
import 'package:share_extend/share_extend.dart';

class QuoteProvider extends ChangeNotifier {
  Color chooseColor = Colors.black;
  Color chooseBgColor = Colors.white;
  String? chooseFontFamily;
  String? chooseImage;

  Future<List<Map<String,dynamic>>>? quotes;

  GlobalKey repaintBoundary = GlobalKey();

  int selectedEditIndex = 0;
  int? selectedBgImage;

  void changeEditIndex(int index){
    selectedEditIndex = index;
    notifyListeners();
  }

  void changeBgImage(int index){
    selectedBgImage = index;
    chooseImage = imageList[index];
    notifyListeners();
  }

  void changeColor(Color color) {
    chooseColor = color;
    notifyListeners();
  }

  void changeBgColor(Color color) {
    chooseBgColor = color;
    if(chooseImage!=null){
      chooseImage = null;
    }
    notifyListeners();
  }

  void changeFont(String font){
    chooseFontFamily = font;
    notifyListeners();
  }

  void refresh(){
    selectedEditIndex = 0;
    selectedBgImage = null;
     chooseColor = Colors.black;
     chooseBgColor = Colors.white;
     chooseFontFamily = null;
     chooseImage = null;
     notifyListeners();
  }

  void shareImage()async{
    RenderRepaintBoundary boundary = repaintBoundary.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData =
    await image.toByteData(format: ui.ImageByteFormat.png);
    var pngBytes = byteData?.buffer.asUint8List();
    final tempDir = await getTemporaryDirectory();
    final file = await File('${tempDir.path}/image.jpg').create();
    file.writeAsBytesSync(pngBytes!);
    ShareExtend.share(file.path, "file");
  }

}
