import 'package:firebase_auth/firebase_auth.dart';

abstract class GoogleAuthAbs {
  Future<UserCredential> signInWithGoogle();
  Future<void> signOutWithGoogle();
}
