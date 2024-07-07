import 'package:messanger_flutter/classes/user_class.dart';

class Chat {
  final MyUser firstUser;
  final MyUser secondUser;
  late final String
      chatID; // chatID = '${firstUser.givenName} ${secondUser.givenName}'
  Chat({
    required this.firstUser,
    required this.secondUser,
  }) {
    chatID = '${firstUser.givenName} ${secondUser.givenName}';
  }
}
