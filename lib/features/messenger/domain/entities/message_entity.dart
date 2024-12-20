import 'dart:developer';

import 'package:messanger_flutter/core/enums/message_status.dart';
import 'package:uuid/uuid.dart';

class MessageEntity {
  String? uuid;
  final String senderUuid;
  final String receiverUuid;
  DateTime? whenSent;

  MessageStatus messageStatus = MessageStatus.sent;
  String text;
  String? imageUrl;

  MessageEntity({
    this.uuid,
    required this.senderUuid,
    required this.receiverUuid,
    required this.messageStatus,
    this.text = '',
    this.imageUrl,
    this.whenSent,
  }) {
    uuid = uuid ?? Uuid().v4();
    whenSent = whenSent ?? DateTime.now().toUtc();
  }

  void printMessage() {
    print('print message:');
    log('uuid: ${uuid}\n'
        'senderUuid: ${senderUuid}\n'
        'receiverUuid: ${receiverUuid}\n'
        'messageStatus: ${messageStatus}\n'
        'text: ${text}\n'
        'imageUrl: ${imageUrl}\n'
        'whenSent: ${whenSent}\n');
  }
}
