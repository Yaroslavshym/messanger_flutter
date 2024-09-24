import 'package:flutter/material.dart';
import 'package:messanger_flutter/util/button.dart';
import 'package:provider/provider.dart';

import '../theme/current_theme_provider.dart';

class MyAlertDialog {
  final String text;
  final String buttonText;
  final BuildContext context;
  const MyAlertDialog({
    required this.context,
    required this.text,
    required this.buttonText,
  });
  Future<void> show() async {
    CurrentThemeProvider themeProvider =
        Provider.of<CurrentThemeProvider>(context);
    FocusScope.of(context).unfocus();
    await Future.delayed(const Duration(seconds: 2));
    showDialog(
        context: context,
        builder: (BuildContext context) {
          Color primaryColor = themeProvider.primaryColor;
          Color secondaryColor = themeProvider.secondaryColor;
          return AlertDialog(
            backgroundColor: secondaryColor,
            alignment: Alignment.center,
            content: SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: ListView(
                      children: [
                        Text(text),
                      ],
                    ),
                  ),
                  MyButton(
                    buttonText: buttonText,
                    buttonPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
