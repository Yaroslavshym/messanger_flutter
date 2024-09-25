import 'package:uuid/uuid.dart';

class ChatEntity {
  String? uuid;
  final List<String> participantsUuidList;
  DateTime? whenCreated;

  final String name;
  final String imageUrl;
  ChatEntity({
    this.uuid,
    required this.participantsUuidList,
    required this.name,
    this.imageUrl = '',
    this.whenCreated,
  }) {
    uuid = uuid ?? Uuid().v4();
    whenCreated = whenCreated ?? DateTime.now().toUtc();
  }
}
