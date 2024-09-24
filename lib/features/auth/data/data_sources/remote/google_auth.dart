import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RemoteGoogleAuth {
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    var ans =  await FirebaseAuth.instance.signInWithCredential(credential);






    // final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // final GoogleSignInAuthentication? googleAuth =
    //     await googleUser?.authentication;
    // final credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth?.accessToken,
    //   idToken: googleAuth?.idToken,
    // );
    //
    // var ans = await FirebaseAuth.instance.signInWithCredential(credential);

    print('111111111${await ans.credential}');
    String sans = ans.toString();
    int l = sans.length;
    List list = [];
    print('111111111');
    for (int i = 1; i < 5; i++) {
      print(sans.substring((l / 4 * (i - 1)).toInt(), (l / 4 * i).toInt()));
    }

    // throw ErrorDescription(FirebaseAuth.instance.currentUser.toString());

    return ans;
  }

  Future<void> signOutFromGoogle() async {
    await GoogleSignIn().signOut();
  }
}
