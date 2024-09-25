import '../entities/chat_entity.dart';

abstract class ChatRepositoryAbs {
  String _getStoragePath({required String storagePath, required String uuid});
  Future<void> putData({required ChatEntity chat});
  Future<void> updateData({required ChatEntity chat});
  Stream<Object?> listenData({required ChatEntity chat});
}
