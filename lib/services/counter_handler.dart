import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterProvider with ChangeNotifier {
  late SharedPreferences _prefs;
  static const _count = 'counter';
  late int counter;
  int get number => counter;

  CounterProvider() {
    counter = 0;
    loadFromPreferences();
  }

  _initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  loadFromPreferences() async {
    await _initPreferences();
    counter = _prefs.getInt(_count) ?? 0;
  }

  minusOne() async {
    await _initPreferences();
    counter--;
    await _prefs.setInt(_count, counter);
  }

  addOne() async {
    await _initPreferences();
    counter++;
    await _prefs.setInt(_count, counter);
  }
}
