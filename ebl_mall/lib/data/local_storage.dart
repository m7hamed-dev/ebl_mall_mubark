import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  //
  static final String loginKey = 'loginKey';
  static final bool isLoginIn = false;
  static late SharedPreferences _preferences;
  //
  static Future initLocalStorage() async {
    _preferences = await SharedPreferences.getInstance();
    print('_preferences.hashCode ${_preferences.hashCode}');
  }

  static Future<void> setLogin(bool value) async {
    await _preferences.setBool(loginKey, value);
  }

  static Future<bool> checkLogin() async {
    return _preferences.getBool(loginKey) ?? false;
  }

  static Future<void> logout() async {
    await _preferences.setBool(loginKey, false);
  }
  //
}
