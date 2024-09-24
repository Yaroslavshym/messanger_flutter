import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/theme/current_theme_provider.dart';

class MyButton extends StatefulWidget {
  final VoidCallback buttonPressed;
  final String buttonText;
  final num
      changeHeightBy; // for subtracting or adding to value the height of button
  final num
      changeWidthBy; // for subtracting or adding to value the width of button
  const MyButton({
    super.key,
    required this.buttonText,
    required this.buttonPressed,
    this.changeHeightBy = 0,
    this.changeWidthBy = 0,
  });

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    CurrentThemeProvider themeProvider =
        Provider.of<CurrentThemeProvider>(context);
    Color primaryColor = themeProvider.primaryColor;
    Color secondaryColor = themeProvider.secondaryColor;
    return GestureDetector(
      onTap: widget.buttonPressed,
      child: Container(
        height: 65,
        width: 150,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            widget.buttonText,
            textAlign: TextAlign.center,
            style: TextStyle(color: primaryColor),
          ),
        ),
      ),
    );
  }
}
