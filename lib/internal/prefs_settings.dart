import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  static saveData(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is int) {
      prefs.setInt(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else if (value is double) {
      prefs.setDouble(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else {
      prefs.setStringList(key, value);
    }
  }

  static Future<dynamic> getData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    dynamic result = prefs.get(key);
    return result;
  }

  static Future<dynamic> getDataList(String key) async {
    final prefs = await SharedPreferences.getInstance();
    dynamic result = prefs.getStringList(key);
    return result;
  }

  static Future<bool> removeData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    dynamic result = prefs.remove(key);
    return result;
  }

  static Future<bool> clearData() async {
    final prefs = await SharedPreferences.getInstance();
    dynamic result = prefs.clear();
    return result;
  }
}
