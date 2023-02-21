import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData lightMode = ThemeData(
  canvasColor: Colors.white,
  brightness: Brightness.light,
  backgroundColor: Colors.white,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.black, foregroundColor: Colors.white),
);

ThemeData darkMode = ThemeData(
    canvasColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: Colors.black,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.white, foregroundColor: Colors.black));

class ThemeNotifier extends ChangeNotifier {
  final String key = "theme";
  SharedPreferences? _preferences;
  bool? _darkMode = true;

  bool? get darkMode => _darkMode;

  ThemeNotifier() {
    _darkMode = false;
    _loadFromPreferences();
  }

  _initialPreferences() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  _savePreferences() async {
    await _initialPreferences();
    _preferences!.setBool(key, _darkMode!);
  }

  _loadFromPreferences() async {
    await _initialPreferences();
    _darkMode = _preferences!.getBool(key) ?? true;
    notifyListeners();
  }

  toggleChangeTheme() {
    _darkMode = !_darkMode!;
    darkMode! ? _darkMode! : !_darkMode!;
    _savePreferences();
    notifyListeners();
  }
}
