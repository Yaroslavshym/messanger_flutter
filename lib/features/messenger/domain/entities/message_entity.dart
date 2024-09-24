import 'package:uuid/uuid.dart';

class MessageEntity {
  final String uuid = Uuid().v4();
  final String chatUuid;
  final String userUuid;
  final DateTime whenSent = DateTime.now().toUtc();
  bool isSeen = false;
  bool isReceived = false;
  String text;
  String? imageUrl;

  MessageEntity({
    required this.chatUuid,
    required this.userUuid,
    required this.text,
    this.imageUrl,
  }) {}
}
