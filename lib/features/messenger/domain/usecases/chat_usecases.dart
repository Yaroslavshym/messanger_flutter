import 'package:messanger_flutter/features/messenger/data/repository/chat_repository.dart';
import 'package:messanger_flutter/features/messenger/domain/entities/chat_entity.dart';

class ChatUseCases {
  void createNewChat(ChatEntity chat) {
    ChatRepository().createChat(chat);
  }

  void getChats() {}
}
