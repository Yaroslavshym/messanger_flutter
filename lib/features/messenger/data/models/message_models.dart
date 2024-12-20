import 'package:messanger_flutter/features/messenger/data/models/message_status.dart';

import '../../domain/entities/message_entity.dart';
import 'datetime_models.dart';

class MessageModels {
  List<MessageEntity> mapToList({required Map data}) {
    List<MessageEntity> messages = [];
    var a = data.keys;
    for (String uuid in data.keys) {
      var one_map = data[uuid];
      MessageEntity message = MessageModels().mapToMessageEntity(data: one_map);
      messages.add(message);
    }

    return messages;
  }

  Map<String, dynamic> messageEntityToMap(MessageEntity message) {
    return {
      "imageUrl": message.imageUrl,
      "text": message.text,
      "uuid": message.uuid,
      "whenSent": DateTimeConversion()
          .dateTimeToString(message.whenSent ?? DateTime.now().toUtc()),
      "receiverUuid": message.receiverUuid,
      "senderUuid": message.senderUuid,
      "messageStatus":
          MessageStatusModels().messageStatusToString(message.messageStatus),
    };
  }

  MessageEntity mapToMessageEntity({
    required Map<dynamic, dynamic> data,
  }) {
    print(data);
    print(data["messageStatus"]);
    MessageEntity message = MessageEntity(
      imageUrl: data["imageUrl"] ?? '',
      uuid: data["uuid"] ?? '',
      senderUuid: data["senderUuid"] ?? '',
      receiverUuid: data["receiverUuid"] ?? '',
      messageStatus:
          MessageStatusModels().stringToMessageStatus(data["messageStatus"]),
    );
    return message;
  }
}
