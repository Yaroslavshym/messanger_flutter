import '../../../auth/domain/entities/user_entity.dart';

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
