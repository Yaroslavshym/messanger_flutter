import 'dart:math';

import 'package:flutter/material.dart';
import 'package:messanger_flutter/features/messenger/domain/entities/chat_entity.dart';
import 'package:messanger_flutter/features/messenger/domain/usecases/chat_usecases.dart';

class ChatWidget extends StatelessWidget {
  final ChatEntity chat;
  const ChatWidget({required this.chat});

  @override
  Widget build(BuildContext context) {
    // make sure that chats have a name
    if (chat.name.length == 0) {
      chat.name = 'Interesting chat ${Random().nextInt(100)}';
      ChatUseCases().updateChat(chat: chat);
    }
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white, width: 2),
            color: Colors.black),
        height: MediaQuery.sizeOf(context).height * 0.2,
        width: MediaQuery.sizeOf(context).width * 0.9,
        // color: Colors.white,
        child: Column(
          children: [
            Text(
              '${chat.name}',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ));
  }
}
