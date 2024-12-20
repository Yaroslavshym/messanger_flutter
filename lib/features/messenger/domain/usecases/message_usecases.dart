import 'package:messanger_flutter/features/messenger/data/repository_impl/message_repository_impl.dart';
import 'package:messanger_flutter/features/messenger/domain/entities/message_entity.dart';

class MessageUseCases {
  bool isLoadingFirstTime = true;

  Future<void> createMessage({required MessageEntity message}) async {
    MessageRepositoryImpl().createMessage(message: message);
  }

  Future<void> editMessage({required MessageEntity message}) async {
    MessageRepositoryImpl().editMessage(message: message);
  }

  // Stream<Object?> listenMessage({required String uuid}) async* {
  //   yield MessageRepositoryImpl().listenMessage(uuid: uuid);
  // }

  Future<List<MessageEntity>> getMessages() async {
    return MessageRepositoryImpl().getMessages();
  }

  // Stream<List<MessageEntity>> listenMessages() async* {
  //   await Future.delayed(Duration(seconds: 10));
  //   yield* MessageRepositoryImpl().listenMessages();
  // }

  Stream<List<MessageEntity>> alwaysGetMessages() async* {
    if (!isLoadingFirstTime) {
      await Future.delayed(Duration(seconds: 15));
    }
    var ans = await MessageRepositoryImpl().getMessages();
    isLoadingFirstTime = false;

    yield ans;
  }
}
