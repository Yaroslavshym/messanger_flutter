// need to submit review to facebook

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
//
// Future<UserCredential> signInWithFacebook() async {
//   // Trigger the sign-in flow
//   final LoginResult loginResult = await FacebookAuth.instance.login();
//
//   // Check if login was successful and access token is not null
//   String ans = loginResult.accessToken?.tokenString ?? '';
//
//   if (loginResult.status == LoginStatus.success) {
//     final OAuthCredential facebookAuthCredential =
//         FacebookAuthProvider.credential(ans);
//
//     // Once signed in, return the UserCredential
//     return await FirebaseAuth.instance
//         .signInWithCredential(facebookAuthCredential);
//   } else {
//     throw FirebaseAuthException(
//       code: 'ERROR_FACEBOOK_LOGIN_FAILED',
//       message: 'Facebook login failed',
//     );
//   }
// }
