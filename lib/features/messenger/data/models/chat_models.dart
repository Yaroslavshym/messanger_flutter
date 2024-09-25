import 'package:messanger_flutter/features/messenger/data/models/datetime_models.dart';

import '../../domain/entities/chat_entity.dart';

class ChatModels {
  Map<dynamic, dynamic> chatEntityToMap(ChatEntity chat) {
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
    required String uuid,
  }) {
    return ChatEntity(
      participantsUuidList: data["participantsUuidList"],
      name: data["data"],
      imageUrl: data["imageUrl"],
      whenCreated: data["whenCreated"],
      uuid: data["uuid"],
    );
  }
}

// final String uuid = Uuid().v4();
// final List<String> participantsUuidList;
// final DateTime whenCreated = DateTime.now().toUtc();
// final String name;
// final String imageUrl;
