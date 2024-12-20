import 'package:messanger_flutter/features/messenger/data/models/message_models.dart';
import 'package:messanger_flutter/features/messenger/domain/repository_abs/message_repository_abs.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/message_entity.dart';
import '../data_sources/remote/realtime_database_storage.dart';

class MessageRepositoryImpl implements MessageRepositoryAbs {
  String _getDataInternalPath({required String uuid}) {
    return '/message/$uuid';
  }

  Future<void> createMessage({required MessageEntity message}) async {
    String dataInternalPath =
        _getDataInternalPath(uuid: message.uuid ?? Uuid().v4());
    Map data = MessageModels().messageEntityToMap(message);
    await RealtimeDatabaseStorage().putData(
      data: data,
      dataInternalPath: dataInternalPath,
    );
    // add participantsUuidList to chat on remote
    // await RealtimeDatabaseStorage().putData(
    //   data: message.participantsUuidList,
    //   dataInternalPath: dataInternalPath + '/participantsUuidList',
    // );
  }

  Future<void> editMessage({required MessageEntity message}) async {
    createMessage(
      message: message,
    );
  }

  Future<List<MessageEntity>> getMessages() async {
    String dataInternalPath = '/message';
    Map data = await RealtimeDatabaseStorage()
        .getData(dataInternalPath: dataInternalPath);
    return MessageModels().mapToList(data: data);
  }
}
