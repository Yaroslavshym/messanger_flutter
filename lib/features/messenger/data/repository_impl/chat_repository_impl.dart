import 'package:messanger_flutter/features/messenger/data/data_sources/remote/realtime_database_storage.dart';
import 'package:messanger_flutter/features/messenger/data/models/chat_models.dart';
import 'package:messanger_flutter/features/messenger/domain/repository_abs/chat_repository_abs.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/chat_entity.dart';

// Future<void> createChat({required ChatEntity chat}){}
// Future<void> updateChat({required ChatEntity chat});
// Stream<Object?> listenChat({required ChatEntity chat});
// Future<Object?> getChat({required ChatEntity chat});

class ChatRepositoryImpl implements ChatRepositoryAbs {
  String _getDataInternalPath({required String uuid}) {
    return '/chat/$uuid';
  }

  Future<void> createChat({
    required ChatEntity chat,
  }) async {
    String dataInternalPath =
        _getDataInternalPath(uuid: chat.uuid ?? Uuid().v4());
    Map data = ChatModels().chatEntityToMap(chat);
    await RealtimeDatabaseStorage().putData(
      data: data,
      dataInternalPath: dataInternalPath,
    );
    // add participantsUuidList to chat on remote
    await RealtimeDatabaseStorage().putData(
      data: chat.participantsUuidList,
      dataInternalPath: dataInternalPath + '/participantsUuidList',
    );
    // add participantsUuidList to chat on remote
    await RealtimeDatabaseStorage().putData(
      data: chat.messagesUuidList,
      dataInternalPath: dataInternalPath + '/messagesUuidList',
    );

    // String secondDataInternalPath =
    //     _getDataInternalPath(uuid: chat.uuid ?? Uuid().v4()) +
    //         '/participantsUuidList';
    // await RealtimeDatabaseStorage().putData(
    //   data: secondData,
    //   dataInternalPath: secondDataInternalPath,
    // );

    // final new_ref = FirebaseDatabase.instance
    //     .ref('$dataInternalPath');
    // ref.set(participantsUuidList);
  }

  Future<void> updateChat({required ChatEntity chat}) async {
    createChat(
      chat: chat,
    );
  }

  Stream<ChatEntity> listenChat({required String uuid}) async* {
    String dataInternalPath = _getDataInternalPath(uuid: uuid);
    Map data = await RealtimeDatabaseStorage()
        .listenData(dataInternalPath: dataInternalPath) as Map;
    yield ChatModels().mapToChatEntity(data: data);
  }

  Future<ChatEntity> getChat({required String uuid}) async {
    String dataInternalPath = _getDataInternalPath(uuid: uuid);

    Map data = await RealtimeDatabaseStorage()
        .getData(dataInternalPath: dataInternalPath);
    return ChatModels().mapToChatEntity(data: data);
  }

  Future<List<ChatEntity>> getChats() async {
    String dataInternalPath = '/chat';
    Map data = await RealtimeDatabaseStorage()
        .getData(dataInternalPath: dataInternalPath);
    return ChatModels().mapToList(data: data);
  }

  Stream<List<ChatEntity>> listenChats() async* {
    String dataInternalPath = '/chat';
    Map data = await RealtimeDatabaseStorage()
        .listenData(dataInternalPath: dataInternalPath) as Map;
    yield ChatModels().mapToList(data: data);
  }
}
