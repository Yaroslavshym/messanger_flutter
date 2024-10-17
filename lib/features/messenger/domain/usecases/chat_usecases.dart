import 'package:messanger_flutter/features/messenger/data/repository_impl/chat_repository_impl.dart';
import 'package:messanger_flutter/features/messenger/domain/entities/chat_entity.dart';

class ChatUseCases {
  bool isLoadingFirstTime = true;

  Future<void> createChat({required ChatEntity chat}) async {
    ChatRepositoryImpl().createChat(chat: chat);
  }

  Future<void> updateChat({required ChatEntity chat}) async {
    ChatRepositoryImpl().updateChat(chat: chat);
  }

  // Stream<Object?> listenChat({required String uuid}) async* {
  //   yield ChatRepositoryImpl().listenChat(uuid: uuid);
  // }

  Future<ChatEntity> getChat({required String uuid}) async {
    return ChatRepositoryImpl().getChat(uuid: uuid);
  }

  Future<List<ChatEntity>> getChats() async {
    return ChatRepositoryImpl().getChats();
  }

  // Stream<List<ChatEntity>> listenChats() async* {
  //   await Future.delayed(Duration(seconds: 10));
  //   yield* ChatRepositoryImpl().listenChats();
  // }

  Stream<List<ChatEntity>> alwaysGetChats() async* {
    if (!isLoadingFirstTime) {
      await Future.delayed(Duration(seconds: 15));
    }
    print('99999999 not delayed!!!');
    var ans = await ChatRepositoryImpl().getChats();
    isLoadingFirstTime = false;
    print('99999999 $ans');

    yield ans;
  }
}
