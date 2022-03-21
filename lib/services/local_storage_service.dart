import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  /// Save a value to a KVP
  static void saveData(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is int) {
      prefs.setInt(key, value);
    } else if (value is double) {
      prefs.setDouble(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else {
      throw Exception("Bad datatype");
    }
  }

  /// Read a value from a KVP
  static Future<dynamic> readData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    dynamic obj = prefs.get(key);
    return obj;
  }

  /// Delete a value and key from a KVP
  static Future<bool> deleteData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  /// List of KVPs
  static Future<Set> listAllKeys() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getKeys();
  }

  /// Does a key exist?
  static Future<bool> hasKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }
}
