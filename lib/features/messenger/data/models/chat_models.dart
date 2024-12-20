import 'package:messanger_flutter/features/messenger/data/models/datetime_models.dart';

import '../../domain/entities/chat_entity.dart';

class ChatModels {
  List<ChatEntity> mapToList({required Map data}) {
    List<ChatEntity> chats = [];
    for (String uuid in data.keys) {
      //
      ChatEntity chat = ChatModels().mapToChatEntity(data: data[uuid]);
      //
      chats.add(chat);
    }
    print(chats);
    return chats;
  }

  Map<String, dynamic> chatEntityToMap(ChatEntity chat) {
    return {
      "imageUrl": chat.imageUrl,
      "name": chat.name,
      "participantsUuidList": chat.participantsUuidList,
      "whenCreated": DateTimeConversion()
          .dateTimeToString(chat.whenCreated ?? DateTime.now().toUtc()),
      "uuid": chat.uuid,
      "messagesUuidList": chat.messagesUuidList,
    };
  }

  ChatEntity mapToChatEntity({
    required Map<dynamic, dynamic> data,
  }) {
    DateTime? date;
    try {
      date = DateTimeConversion().stringToDateTime(data["whenCreated"]);
    } catch (e) {
      date = DateTime.now().toUtc();
    }
    var a = 'chat_models: ' + data["participantsUuidList"];
    print(a);
    ChatEntity chat = ChatEntity(
      participantsUuidList: data["participantsUuidList"] ?? [],
      name: data["data"] ?? '',
      imageUrl: data["imageUrl"] ?? '',
      whenCreated: date,
      uuid: data["uuid"] ?? '',
      messagesUuidList: data["messagesUuidList"] ?? [],
    );
    return chat;
  }
}

// final String uuid = Uuid().v4();
// final List<String> participantsUuidList;
// final DateTime whenCreated = DateTime.now().toUtc();
// final String name;
// final String imageUrl;
