import 'package:messanger_flutter/features/messenger/data/data_sources/remote/realtime_database_storage.dart';
import 'package:messanger_flutter/features/messenger/data/models/chat_models.dart';
import 'package:messanger_flutter/features/messenger/domain/repository_abs/chat_repository_abs.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/chat_entity.dart';

class ChatRepositoryImpl implements ChatRepositoryAbs {
  String _getDataInternalPath({required String uuid}) {
    return '/chat/$uuid';
  }

  Future<void> putData({
    required ChatEntity chat,
  }) async {
    String dataInternalPath =
        _getDataInternalPath(uuid: chat.uuid ?? Uuid().v4());
    Map data = ChatModels().chatEntityToMap(chat);
    await RealtimeDatabaseStorage().putData(
      data: data,
      dataInternalPath: dataInternalPath,
    );
  }

// TODO: finish implementation
  Future<void> updateData({required ChatEntity chat}) async {
    String dataInternalPath =
        _getDataInternalPath(uuid: chat.uuid ?? Uuid().v4());
    Map data = ChatModels().chatEntityToMap(chat);
    await RealtimeDatabaseStorage().updateData(
      data: data,
      dataInternalPath: dataInternalPath,
    );
  }

  Stream<Object?> listenData({required ChatEntity chat}) async* {
    String dataInternalPath =
        _getDataInternalPath(uuid: chat.uuid ?? Uuid().v4());
    yield RealtimeDatabaseStorage()
        .listenData(dataInternalPath: dataInternalPath);
  }
}
