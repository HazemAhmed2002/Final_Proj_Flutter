import 'package:shared_preferences/shared_preferences.dart';

class SpHelper {
  static late SharedPreferences sp;
  static initSp() async {
    sp = await SharedPreferences.getInstance();
  }

  static createNewItem(String key, String value) {
    sp.setString(key, value);
  }

  static String? getItem(String key) {
    String? result = sp.getString(key);
    return result;
  }

  static deleteItem(String key) {
    sp.remove(key);
  }

  static updateItem(String key, String value) {
    sp.setString(key, value);
  }

  static saveIsDark(bool x) {
    sp.setBool('isDark', x);
  }

  static bool getIsDark() {
    bool result = sp.getBool('isDark') ?? false;
    return result;
  }

  static bool checkFirstTime() {
    bool? result = sp.getBool('FirstLogin');
    if (result == null) {
      sp.setBool('FirstLogin', false);
      return true;
    } else {
      return false;
    }
  }
}
