import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  late bool isDarkMode;
  bool get darktheme => isDarkMode;
  late SharedPreferences _prefs;
  static const _theme = "theme";

  ThemeData darkTheme = ThemeData.dark().copyWith(primaryColor: Colors.black);

  ThemeData lightTheme = ThemeData.light().copyWith(primaryColor: Colors.white);

  ThemeProvider() {
    isDarkMode = false;
    loadFromPreferences();
  }

  _initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  swapTheme() async {
    isDarkMode = !isDarkMode;
    saveToPreferences();
    notifyListeners();
  }

  loadFromPreferences() async {
    await _initPreferences();
    isDarkMode = _prefs.getBool(_theme) ?? false;
  }

  saveToPreferences() async {
    await _initPreferences();
    await _prefs.setBool(_theme, isDarkMode);
  }
}
