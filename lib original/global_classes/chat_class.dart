import 'package:messanger_flutter/global_classes/user_class.dart';

class Chat {
  final MyUser firstUser;
  final MyUser secondUser;

  // chatID = '${firstUser.givenName} ${secondUser.givenName}'
  late final String chatID;
  Chat({
    required this.firstUser,
    required this.secondUser,
  }) {
    chatID = '${firstUser.givenName} ${secondUser.givenName}';
  }
}
