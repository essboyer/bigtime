import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static final LocalStorageService _instance = LocalStorageService();
  static late SharedPreferences prefs;

  static Future<LocalStorageService> getInstance() async {
    await _init();
    return _instance;
  }

  static Future<void> _init() async {
    prefs = await SharedPreferences.getInstance();
  }

  /// Save a value to a KVP
  void saveData(String key, dynamic value) async {
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
  Future<dynamic> readData(String key) async {
    return prefs.get(key);
  }

  /// Delete a value and key from a KVP
  Future<bool> deleteData(String key) async {
    return prefs.remove(key);
  }

  /// List of KVPs
  Future<Set> listAllKeys() async {
    return prefs.getKeys();
  }

  /// Does a key exist?
  Future<bool> hasKey(String key) async {
    return prefs.containsKey(key);
  }
}
