import 'package:bigtime/services/local_storage_service.dart';
import 'package:flutter/material.dart';

class MainPageViewModel extends ChangeNotifier {
  bool advancedMode = false;
  bool showSettings = false;

  void initialise() {
    getSavedMode();
    notifyListeners();
  }

  void getSavedMode() async {
    final dynamic value = await LocalStorageService.readData('mode');

    if (value is bool) {
      advancedMode = value;
      notifyListeners();
    }
  }

  void onSettingsBtnPressed() {
    showSettings = !showSettings;
    notifyListeners();
  }

  void onModeBtnPressed() {
    advancedMode = !advancedMode;
    LocalStorageService.saveData('mode', advancedMode);
    notifyListeners();
  }
}
