import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RemoteGoogleAuth {
  Future<UserCredential> signInWithGoogle() async {
    // try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    var ans = await FirebaseAuth.instance.signInWithCredential(credential);
    return ans;
    // } catch (e) {
    //   throw ErrorDescription('Failed to sign up!\nFirebaseAuthException\n$e');
    // }
  }

  Future<void> signOutFromGoogle() async {
    await GoogleSignIn().signOut();
  }
}
