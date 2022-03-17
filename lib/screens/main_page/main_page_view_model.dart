import 'package:flutter/material.dart';

class MainPageViewModel extends ChangeNotifier {
  bool advancedMode = true;

  void initialise() {
    notifyListeners();
  }

  void onSettingsBtnPressed() {
    notifyListeners();
  }

  void onModeBtnPressed() {
    toggleMode();
    notifyListeners();
  }

  void toggleMode() {
    advancedMode = !advancedMode;
    notifyListeners();
  }
}
