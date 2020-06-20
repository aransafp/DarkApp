import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_app/util.dart';

class ThemeProvider with ChangeNotifier {
  ThemeProvider() {
    loadIsLight();
  }

  SharedPreferences _pref;
  bool _isLight;

  bool get isLight => _isLight == null ? false : _isLight;

  set isLight(bool value) {
    _isLight = value;
    saveIsLight(_isLight);
    notifyListeners();
  }

  saveIsLight(bool val) async {
    _pref = await SharedPreferences.getInstance();
    await _pref.setBool('dark', val);
    print(_pref.getBool('dark'));
  }

  loadIsLight() async {
    _pref = await SharedPreferences.getInstance();
    bool result = _pref.getBool('dark' ?? false);

    _isLight = result;
    notifyListeners();
  }

  ThemeData getTheme() =>
      _isLight == null ? darkTheme : (_isLight) ? darkTheme : lightTheme;

  String getText() => _isLight == null ? "On" : (_isLight) ? "On" : "Off";
}
