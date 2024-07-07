import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<UserCredential> signInWithGoogle() async {
  if (FirebaseAuth.instance.currentUser != null) {
    await signOutFromGoogle();
  }
  // try {
  //   signOutFromGoogle();
  // } catch (e) {}

  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
  var ans = await FirebaseAuth.instance.signInWithCredential(credential);
  // print('111111111${await ans.credential}');
  // String sans = ans.toString();
  // int l = sans.length;
  // List list = [];
  // print('111111111');
  // for (int i = 1; i < 5; i++) {
  //   print(sans.substring((l / 4 * (i - 1)).toInt(), (l / 4 * i).toInt()));
  // }
  return ans;
}

Future<void> signOutFromGoogle() async {
  try {
    await GoogleSignIn().signOut();

    // Optionally, clear user session or reset app state
  } catch (error) {
    // Handle sign-out errors
    print('Error signing out from Google: $error');
  }
}
