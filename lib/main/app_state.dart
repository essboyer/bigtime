import 'package:bigtime/locator.dart';
import 'package:bigtime/services/theme_service.dart';
import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  final ThemeService _themeSvc = locator<ThemeService>();

  ThemeData? getTheme() {
    return _themeSvc.getTheme();
  }
}
