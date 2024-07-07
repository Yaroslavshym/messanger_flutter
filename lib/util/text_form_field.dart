import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/current_theme_provider.dart';

class MyTextFormField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;

  MyTextFormField({
    this.labelText = '',
    required this.controller,
  });

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    CurrentThemeProvider currentThemeProvider =
        Provider.of<CurrentThemeProvider>(context);
    Color primaryColor = currentThemeProvider.primaryColor;
    Color secondaryColor = currentThemeProvider.secondaryColor;
    return Container(
      height: 65,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: secondaryColor,
      ),
      child: TextFormField(
        maxLines: 1,
        controller: widget.controller,
        cursorColor: primaryColor,
        style: TextStyle(color: primaryColor),
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: widget.labelText,
          labelStyle: TextStyle(color: primaryColor),
        ),
      ),
    );
  }
}
