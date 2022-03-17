import 'package:flutter/material.dart';

class MainPageViewModel extends ChangeNotifier {
  void initialise() {
    notifyListeners();
  }

  void onSettingsBtnPressed() {
    print("Neat!!!");
  }

  void onModeBtnPressed() {
    print("Fart mouth!");
  }
}
