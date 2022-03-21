import 'package:bigtime/locator.dart';
import 'package:bigtime/services/local_storage_service.dart';
import 'package:flutter/material.dart';

class ThemeService with ChangeNotifier {
  final storageSvc = locator<LocalStorageService>();

  final darkTheme = ThemeData(
      // primaryColor: Colors.black,
      // brightness: Brightness.dark,
      // backgroundColor: const Color(0xFF212121),
      // dividerColor: Colors.black12,
      // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
      //    .copyWith(secondary: Colors.white),
      );

  final lightTheme = ThemeData(
      // primaryColor: Colors.white,
      // brightness: Brightness.light,
      // backgroundColor: const Color(0xFFE5E5E5),
      // dividerColor: Colors.white54,
      //colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
      // .copyWith(secondary: Colors.black),
      );

  ThemeData? _themeData;
  ThemeData? getTheme() => _themeData;

  ThemeService() {
    storageSvc.readData('themeMode').then((value) {
      var themeMode = value ?? 'dark';
      if (themeMode == 'light') {
        _themeData = lightTheme;
      } else {
        _themeData = darkTheme;
      }
      notifyListeners();
    });
  }

  void setDarkMode() async {
    _themeData = darkTheme;
    storageSvc.saveData('themeMode', 'dark');
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    storageSvc.saveData('themeMode', 'light');
    notifyListeners();
  }
}
