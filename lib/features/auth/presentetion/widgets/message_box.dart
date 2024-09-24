import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/theme/current_theme_provider.dart';
import '../../../messenger/domain/entities/message_entity.dart';

class MessageBox extends StatelessWidget {
  List<Widget> listOfWidgets;
  final MessageEntity message;
  MessageBox({
    this.listOfWidgets = const [],
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    CurrentThemeProvider themeProvider =
        Provider.of<CurrentThemeProvider>(context);
    Color primaryColor = themeProvider.primaryColor;
    Color secondaryColor = themeProvider.secondaryColor;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: secondaryColor,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('${message.whenSent.hour}:${message.whenSent.minute}'),
            ],
          )
        ],
      ),
    );
  }
}
