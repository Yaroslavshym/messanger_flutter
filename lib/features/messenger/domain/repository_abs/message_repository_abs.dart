import 'package:messanger_flutter/features/messenger/domain/entities/message_entity.dart';

abstract class MessageRepositoryAbs {
  String _getStoragePath({required String storagePath, required String uuid});
  Future<void> createMessage({required MessageEntity message});
  Future<void> editMessage({required MessageEntity message});
  Future<List<MessageEntity>> getMessages();
}
