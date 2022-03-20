import 'package:bigtime/managers/theme_manager.dart';
import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  final ThemeNotifier theme = ThemeNotifier();

  ThemeData? getTheme() {
    return theme.getTheme();
  }
}
