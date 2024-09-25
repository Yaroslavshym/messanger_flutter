import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repository_abs/auth_global_abs.dart';

class AuthGlobalImpl implements AuthGlobalAbs {
  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }
}
