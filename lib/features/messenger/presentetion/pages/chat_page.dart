import 'package:flutter/material.dart';
import 'package:messanger_flutter/config/theme/current_theme_provider.dart';
import 'package:messanger_flutter/features/messenger/domain/entities/chat_entity.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatelessWidget {
  final ChatEntity chat;
  const ChatPage({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    CurrentThemeProvider themeProvider =
        Provider.of<CurrentThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.primaryColor,
        title: Text(
          'Chat Name',
          style: TextStyle(
            color: themeProvider.secondaryColor,
          ),
        ),
        iconTheme: IconThemeData(
          color:
              themeProvider.secondaryColor, // Change this to your desired color
        ),
      ),
      backgroundColor: themeProvider.primaryColor,
      body: Column(
        children: [
          // chat

          // text field for sending
        ],
      ),
    );
  }
}
