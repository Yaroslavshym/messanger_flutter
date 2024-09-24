import 'package:flutter/material.dart';

class CurrentThemeProvider extends ChangeNotifier {
  ThemeMode mode = ThemeMode.dark;
  late Color primaryColor;
  late Color secondaryColor;
  CurrentThemeProvider() {
    toggleColors();
  }

  void toggleColors() {
    bool isDarkMode = mode == ThemeMode.dark;
    primaryColor = isDarkMode ? Colors.black : Colors.white;
    secondaryColor = isDarkMode ? Colors.white : Colors.black;
    notifyListeners();
  }
}
