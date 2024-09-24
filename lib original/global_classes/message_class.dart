import 'package:messanger_flutter/global_classes/user_class.dart';

class Message {
  final DateTime whenSent; //DateTime(2024, 7, 9, 12, 30)
  bool isArrived;
  final MyUser userWhoSent;
  Message({
    required this.whenSent,
    required this.isArrived,
    required this.userWhoSent,
  });
}
