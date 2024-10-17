import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/theme/current_theme_provider.dart';
import 'button.dart';

class MyAlertDialog {
  final String text;
  final String buttonText;
  const MyAlertDialog({
    required this.text,
    required this.buttonText,
  });
  Future<void> show(BuildContext context) async {
    CurrentThemeProvider themeProvider =
        Provider.of<CurrentThemeProvider>(context, listen: false);
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
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
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
