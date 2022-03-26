import 'package:bigtime/locator.dart';
import 'package:bigtime/services/theme_service.dart';
import 'package:flutter/material.dart';

class SettingsPageViewModel extends ChangeNotifier {
  final ThemeService themeService = locator<ThemeService>();

  void initialise() {
    notifyListeners();
  }

  void switchTheme(bool isDark) {
    themeService.setThemeMode(isDark);
    notifyListeners();
  }

  void close() {}
}
