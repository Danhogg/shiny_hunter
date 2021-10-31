import 'package:shared_preferences/shared_preferences.dart';

class UsersSharedPreferences {
  static late SharedPreferences _preferences;
  static const _counter = 'counter';

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future changeCounter(value) async {
    await _preferences.setInt(_counter, value);
  }

  static int? getCounter() {
    return _preferences.getInt(_counter);
  }
}
