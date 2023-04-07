import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStore {
  static SharedPreferences? local;

  static init() async {
    local = await SharedPreferences.getInstance();
  }

  static setTheme(bool value) {
    local?.setBool("theme", value);
  }

  static bool getTheme() {
    return local?.getBool("theme") ?? true;
  }

  static setToken(String value) {
    local?.setString("token", value);
  }

  static String getToken() {
    return local?.getString("token") ?? "";
  }

  static clear() {
    local?.clear();
  }
}
