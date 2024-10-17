import 'dart:developer';

import 'package:uuid/uuid.dart';

class ChatEntity {
  String? uuid;
  List<String> participantsUuidList;
  DateTime? whenCreated;

  String name;
  String imageUrl;
  ChatEntity({
    this.uuid,
    this.participantsUuidList = const [],
    required this.name,
    this.imageUrl = '',
    this.whenCreated,
  }) {
    uuid = uuid ?? Uuid().v4();
    whenCreated = whenCreated ?? DateTime.now().toUtc();
  }
  void printChat() {
    print('print chat:');
    log('uuid: ${uuid}\n'
        'participantsUuidList: ${participantsUuidList}\n'
        'name: ${name}\n'
        'imageUrl: ${imageUrl}\n'
        'whenCreated: ${whenCreated}');
  }
}
