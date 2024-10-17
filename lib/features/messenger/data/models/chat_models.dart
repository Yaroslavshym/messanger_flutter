import 'dart:developer';

import 'package:messanger_flutter/features/messenger/data/models/datetime_models.dart';

import '../../domain/entities/chat_entity.dart';

class ChatModels {
  List<ChatEntity> mapToList({required Map data}) {
    List<ChatEntity> chats = [];
    var a = data.keys;
    for (String uuid in data.keys) {
      var one_map = data[uuid];
      ChatEntity chat = ChatModels().mapToChatEntity(data: one_map);
      chats.add(chat);
    }

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
    };
  }

  ChatEntity mapToChatEntity({
    required Map<dynamic, dynamic> data,
  }) {
    log('chat_models:  (data):     $data \n type: ${data.runtimeType}');
    DateTime? date;
    try {
      date = DateTimeConversion().stringToDateTime(data["whenCreated"]);
      print('tried successfully');
    } catch (e) {
      date = DateTime.now().toUtc();
    }
    var a = data["participantsUuidList"];
    ChatEntity chat = ChatEntity(
      participantsUuidList: [],
      name: data["data"] ?? '',
      imageUrl: data["imageUrl"] ?? '',
      whenCreated: date,
      uuid: data["uuid"] ?? '',
    );
    chat.printChat();
    return chat;
  }
}

// final String uuid = Uuid().v4();
// final List<String> participantsUuidList;
// final DateTime whenCreated = DateTime.now().toUtc();
// final String name;
// final String imageUrl;
