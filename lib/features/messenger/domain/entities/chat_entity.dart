import 'package:uuid/uuid.dart';

class ChatEntity {
  final String uuid = Uuid().v4();
  final List<String> participantsUuidList;
  final DateTime whenCreated = DateTime.now().toUtc();
  final String name;
  final String imageUrl;
  ChatEntity({
    required this.participantsUuidList,
    required this.name,
    this.imageUrl = '',
  }) {}
}
