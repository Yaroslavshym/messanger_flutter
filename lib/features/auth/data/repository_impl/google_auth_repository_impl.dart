import 'package:firebase_auth/firebase_auth.dart';
import 'package:messanger_flutter/features/auth/data/data_sources/remote/google_auth.dart';

import '../../domain/repository_abs/google_auth_repository_abs.dart';

class GoogleAuthRepositoryImpl implements GoogleAuthRepositoryAbs {
  Future<UserCredential> signInWithGoogle() async {
    // if (FirebaseAuth.instance.currentUser != null) {
    //   signOutWithGoogle();
    // }
    return RemoteGoogleAuth().signInWithGoogle();
  }

  Future<void> signOutWithGoogle() async {
    await RemoteGoogleAuth().signOutFromGoogle();
  }
}
