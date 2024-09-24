import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/theme/current_theme_provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    CurrentThemeProvider themeProvider =
        Provider.of<CurrentThemeProvider>(context);
    return Scaffold(
        backgroundColor: themeProvider.primaryColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: themeProvider.secondaryColor,
          child: Icon(
            Icons.add,
            color: themeProvider.primaryColor,
          ),
        ),
        body:
            // StreamBuilder()

            ListView(
          children: [],
        ));
  }
}
