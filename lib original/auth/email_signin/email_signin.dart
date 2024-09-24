import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../util/alert_dialog.dart';

class EmailAuth {
  Future<bool> signUp(
      {required String emailAddress,
      required String password,
      required BuildContext context}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        MyAlertDialog(
          context: context,
          text: 'Failed to sign up!\n Your password is too weak!',
          buttonText: 'OK',
        ).show();
      } else if (e.code == 'email-already-in-use') {
        MyAlertDialog(
          context: context,
          text: 'Failed to sign up!\n This email is already used!',
          buttonText: 'OK',
        ).show();
      } else {
        MyAlertDialog(
          context: context,
          text: 'Failed to sign in!\nFirebaseAuthException\n$e\n${e.code}',
          buttonText: 'OK',
        ).show();
      }
    } catch (e) {
      MyAlertDialog(
        context: context,
        text: 'Failed to sign in!\nFirebaseAuthException\n$e',
        buttonText: 'OK',
      ).show();
    }
    return false;
  }

  Future<bool> signIn(
      {required String emailAddress,
      required String password,
      required BuildContext context}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'invalid-credential') {
        MyAlertDialog(
          context: context,
          text: 'Failed to sign in!\nNo user found for that email!',
          buttonText: 'OK',
        ).show();
      } else if (e.code == 'wrong-password') {
        MyAlertDialog(
          context: context,
          text: 'Failed to sign in!\n Wrong password provided for that user!',
          buttonText: 'OK',
        ).show();
      } else {
        MyAlertDialog(
          context: context,
          text: 'Failed to sign in!\nFirebaseAuthException\n$e\n${e.code}',
          buttonText: 'OK',
        ).show();
      }
    }
    return false;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
