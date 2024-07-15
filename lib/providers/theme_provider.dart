import "package:flutter/material.dart";

class ThemeProvider with ChangeNotifier {
  bool isDarkMode = false;

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }

  ThemeData get themeData {
    return isDarkMode ? ThemeData.dark() : ThemeData.light();
  }
}