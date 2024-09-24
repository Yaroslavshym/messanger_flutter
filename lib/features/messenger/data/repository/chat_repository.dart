import 'package:messanger_flutter/features/messenger/data/data_sources/remote/realtime_database_storage.dart';

import '../../domain/entities/chat_entity.dart';

class ChatRepository {
  Future<void> createChat(ChatEntity chat) async {
    Map data = {
      "imageUrl": chat.imageUrl,
      "name": chat.name,
      "participantsUuidList": chat.participantsUuidList,
      "whenCreated": chat.whenCreated.toIso8601String(),
    };
    await RealtimeDatabaseStorage()
        .createChat(data: data, stringRef: "chat/${chat.uuid}");
  }
}
