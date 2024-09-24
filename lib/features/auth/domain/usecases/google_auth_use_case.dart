import 'package:firebase_auth/firebase_auth.dart';

import '../../data/repository_impl/google_auth_impl.dart';

class GoogleAuthUseCase {
  Future<UserCredential> signInWithGoogle() async {
    return GoogleAuthImpl().signInWithGoogle();
  }

  Future<void> signOutFromGoogle() async {
    await GoogleAuthImpl().signOutWithGoogle();
  }
}
