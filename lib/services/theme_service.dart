import 'package:bigtime/locator.dart';
import 'package:bigtime/services/local_storage_service.dart';
import 'package:flutter/material.dart';

class ThemeService with ChangeNotifier {
  final storageSvc = locator<LocalStorageService>();

  final darkTheme = ThemeData.dark(
      // primaryColor: Colors.black,
      // brightness: Brightness.dark,
      // backgroundColor: const Color(0xFF212121),
      // dividerColor: Colors.black12,
      // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
      //    .copyWith(secondary: Colors.white),
      );

  final lightTheme = ThemeData.light(
          // primaryColor: Colors.white,
          // brightness: Brightness.light,
          // backgroundColor: const Color(0xFFE5E5E5),
          // dividerColor: Colors.white54,
          //colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
          // .copyWith(secondary: Colors.black),
          )
      .copyWith(primaryColor: Colors.black);

  ThemeData? _themeData;
  ThemeData? getTheme() => _themeData;
  late bool _isDarkMode;

  ThemeService() {
    storageSvc.readData('themeMode').then((value) {
      var themeMode = value ?? 'dark';
      if (themeMode == 'light') {
        _themeData = lightTheme;
        _isDarkMode = false;
      } else {
        _themeData = darkTheme;
        _isDarkMode = true;
      }
      notifyListeners();
    });
    // Timer.periodic(
    //     const Duration(seconds: 1), (timer) => setThemeMode(!_isDarkMode));
  }

  void setThemeMode(bool isDark) {
    _isDarkMode = isDark;
    if (isDark) {
      setDarkMode();
    } else {
      setLightMode();
    }
    notifyListeners();
  }

  void setDarkMode() {
    _themeData = darkTheme;
    storageSvc.saveData('themeMode', 'dark');
    notifyListeners();
  }

  void setLightMode() {
    _themeData = lightTheme;
    storageSvc.saveData('themeMode', 'light');
    notifyListeners();
  }

  bool isDarkMode() {
    return _isDarkMode;
  }
}
