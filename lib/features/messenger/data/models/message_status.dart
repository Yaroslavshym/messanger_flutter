import 'package:messanger_flutter/core/enums/message_status.dart';

class MessageStatusModels {
  String messageStatusToString(MessageStatus message) {
    return message.name.toString();
  }

  MessageStatus stringToMessageStatus(String messageString) {
    Map messageStatuses = {};
    for (var status in MessageStatus.values) {
      messageStatuses[status.name.toString()] = status;
    }
    if (messageStatuses.keys.contains(messageString)) {
      return messageStatuses[messageString];
    }
    return MessageStatus.failed;
  }
}
