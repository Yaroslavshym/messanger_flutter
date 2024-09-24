import 'package:messanger_flutter/features/auth/domain/repository_abs/email_auth_abs.dart';

import '../data_sources/remote/email_auth.dart';

class EmailAuthImpl implements EmailAuthAbs {
  Future<bool> signUp(
      {required String emailAddress,
      required String password,
      required String name}) async {
    return await RemoteEmailAuth()
        .signUp(emailAddress: emailAddress, password: password, name: name);
  }

  Future<bool> signIn({
    required String emailAddress,
    required String password,
  }) async {
    return await RemoteEmailAuth()
        .signIn(emailAddress: emailAddress, password: password);
  }
}
