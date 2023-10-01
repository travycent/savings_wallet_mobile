import 'package:shared_preferences/shared_preferences.dart';
class SharedPreferencesManager {
  static SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static SharedPreferences? getInstance() {
    return _preferences;
  }

  static String getString(String key) {
    String defaultValue = "";
    return _preferences?.getString(key) ?? defaultValue;
  }

  static Future<bool> setString(String key, String value) {
    return _preferences?.setString(key, value) ?? Future.value(false);
  }
  static Future<List<String>> getAllKeys() async {
    return _preferences?.getKeys().toList() ?? [];
  }
}