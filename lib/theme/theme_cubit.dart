import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  /// {@macro brightness_cubit}
  ThemeCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
      backgroundColor: Colors.black,
    ),
    brightness: Brightness.light,
  );

  static final _darkTheme = ThemeData(
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      brightness: Brightness.dark,
      canvasColor: Colors.black);

  Future<bool?> _getPref() async {
    return null;
  
    // prefs = await SharedPreferences.getInstance();
    //return prefs.getBool('toggle');
  }

  void _setPref() {
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
    //prefs.setBool('toggle', state.brightness == Brightness.dark);
    // _getPref();
  }

  /// Toggles the current brightness between light and dark.
  Future<void> toggleTheme() async {
    _setPref();
  }
}
