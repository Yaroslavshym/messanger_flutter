import 'package:flutter/material.dart';

class CurrentThemeProvider extends ChangeNotifier {
  ThemeMode mode = ThemeMode.dark;
  late Color primaryColor;
  late Color secondaryColor;
  CurrentThemeProvider() {
    CurrentThemeProvider themeModeProvider = CurrentThemeProvider();
    themeModeProvider.addListener(updateColors);
  }

  void updateColors() {
    CurrentThemeProvider themeProvider = CurrentThemeProvider();
    bool isDarkMode = mode == ThemeMode.dark;
    primaryColor = isDarkMode ? Colors.black : Colors.white;
    secondaryColor = isDarkMode ? Colors.white : Colors.black;
  }
}
