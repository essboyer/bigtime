import 'package:flutter/material.dart';

class MainPageViewModel extends ChangeNotifier {
  bool advancedMode = true;
  bool showSettings = false;

  void initialise() {
    notifyListeners();
  }

  void onSettingsBtnPressed() {
    showSettings = !showSettings;
    notifyListeners();
  }

  void onModeBtnPressed() {
    advancedMode = !advancedMode;
    notifyListeners();
  }

}
