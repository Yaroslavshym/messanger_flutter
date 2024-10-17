import '../entities/chat_entity.dart';

abstract class ChatRepositoryAbs {
  String _getStoragePath({required String storagePath, required String uuid});
  Future<void> createChat({required ChatEntity chat});
  Future<void> updateChat({required ChatEntity chat});
  Stream<ChatEntity> listenChat({required String uuid});
  Future<ChatEntity> getChat({required String uuid});
  Future<List<ChatEntity>> getChats();
  Stream<List<ChatEntity>> listenChats();
}
