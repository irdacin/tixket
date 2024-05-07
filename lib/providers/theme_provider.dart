import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode  = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  String currentTheme = "Device Settings";

  void toggleTheme(bool isDarkMode) {
    _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    currentTheme = isDarkMode ? "Dark Theme" : "Light Theme";
    notifyListeners();
  }
  
  void setTheme(String theme) {
    if(theme == "Device Settings") {
      _themeMode = ThemeMode.system;
    }
    else if(theme == "Light Theme") {
      _themeMode = ThemeMode.light;
    }
    else {
      _themeMode = ThemeMode.dark;
    }
    currentTheme = theme;
    notifyListeners();
  }
}