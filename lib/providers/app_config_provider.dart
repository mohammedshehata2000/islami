import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLanguge = 'en';
  ThemeMode appTheme = ThemeMode.light;

  AppConfigProvider() {
    _loadPreferences(); // Load when the provider is created
  }

  Future<void> _loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    appLanguge = prefs.getString('languge') ?? 'en';
    appTheme = _getThemeMode(prefs.getString('theme') ?? 'light');
    notifyListeners();
  }

  Future<void> changeLanguge(String newLanguge) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('languge', newLanguge);

    // Only update if the language actually changed
    if (appLanguge != newLanguge) {
      appLanguge = newLanguge;
      notifyListeners();
    }
  }

  Future<void> changeTheme(ThemeMode newTheme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'theme', newTheme == ThemeMode.dark ? 'dark' : 'light');

    // Only update if the theme actually changed
    if (appTheme != newTheme) {
      appTheme = newTheme;
      notifyListeners();
    }
  }

  bool isDark() {
    return appTheme == ThemeMode.dark;
  }

// Helper to convert string to ThemeMode
  ThemeMode _getThemeMode(String themeString) {
    if (themeString == 'dark') {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }
}
