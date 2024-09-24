import 'package:messanger_flutter/features/auth/data/repository_impl/email_auth_impl.dart';

class EmailAuthUseCase {
  Future<bool> signUp(
      {required String emailAddress,
      required String password,
      required String name}) async {
    return await EmailAuthImpl()
        .signUp(emailAddress: emailAddress, password: password, name: name);
  }

  Future<bool> signIn({
    required String emailAddress,
    required String password,
  }) async {
    return await EmailAuthImpl()
        .signIn(emailAddress: emailAddress, password: password);
  }

  Future<void> signOut() async {}
}
