import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<SharedPreferences> _sharedPreferences() async {
    return await SharedPreferences.getInstance();
  }

  Future<void> setData(String key, List<String> value) async {
    final sharedPreferences = await _sharedPreferences();

    sharedPreferences.setStringList(key, value);
  }

  Future<List<String>> getData(String key) async {
    final sharedPreferences = await _sharedPreferences();

    return sharedPreferences.getStringList(key) ?? [];
  }

  Future<void> removeData(String key) async {
    final sharedPreferences = await _sharedPreferences();

    sharedPreferences.remove(key);
  }
}
