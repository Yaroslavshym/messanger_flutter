import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth {
  Future<UserCredential> signInWithGoogle() async {
    if (FirebaseAuth.instance.currentUser != null) {
      await signOutFromGoogle();
    }
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
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
    // }\

    // throw ErrorDescription(FirebaseAuth.instance.currentUser.toString());

    return ans;
  }

  Future<void> signOutFromGoogle() async {
    await GoogleSignIn().signOut();
  }
}

// } catch (e) {
// MyAlertDialog(
// context: context,
// text: 'Failed to login to your google account!\n$e',
// buttonText: 'OK',
// ).show();
// }
