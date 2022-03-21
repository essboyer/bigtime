import 'package:bigtime/locator.dart';
import 'package:bigtime/services/local_storage_service.dart';
import 'package:flutter/material.dart';

class MainPageViewModel extends ChangeNotifier {
  final storageSvc = locator<LocalStorageService>();
  bool advancedMode = false;
  bool showSettings = false;

  void initialise() {
    getSavedMode();
    notifyListeners();
  }

  void getSavedMode() async {
    final dynamic value = await storageSvc.readData('mode');

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
    storageSvc.saveData('mode', advancedMode);
    notifyListeners();
  }
}
