import 'package:bigtime/locator.dart';
import 'package:bigtime/services/theme_service.dart';
import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  final ThemeService _themeSvc = locator<ThemeService>();
  ThemeData? currentTheme;

  AppState() {
    setTheme();
    currentTheme = getTheme();
  }

  void setTheme() {
    currentTheme = getTheme();
    notifyListeners();
  }

  ThemeData? getTheme() => _themeSvc.getTheme();
}
