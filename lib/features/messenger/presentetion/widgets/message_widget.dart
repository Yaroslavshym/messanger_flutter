import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/theme/current_theme_provider.dart';
import '../../../messenger/domain/entities/message_entity.dart';

class MessageWidget extends StatelessWidget {
  List<Widget> messageWidgetList;
  final MessageEntity message;
  MessageWidget({
    this.messageWidgetList = const [],
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    CurrentThemeProvider themeProvider =
        Provider.of<CurrentThemeProvider>(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: themeProvider.secondaryColor,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('${message.whenSent?.hour}:${message.whenSent?.minute}'),
            ],
          )
        ],
      ),
    );
  }
}
