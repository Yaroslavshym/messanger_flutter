import 'package:flutter/material.dart';
import 'package:messanger_flutter/providers/current_theme_mode_provider.dart';

class CurrentThemeProvider extends ChangeNotifier {
  late Color primaryColor;
  late Color secondaryColor;
  final CurrentThemeModeProvider _themeProvider = CurrentThemeModeProvider();
  CurrentThemeProvider() {
    _themeProvider.addListener(_updateColors);
    _updateColors();
  }
  void _updateColors() {
    print('_updateColors..........');
    if (_themeProvider.mode == ThemeMode.dark) {
      primaryColor = Colors.black;
      secondaryColor = Colors.white;
    } else {
      primaryColor = Colors.white;
      secondaryColor = Colors.black;
    }
    notifyListeners();
  }
}
