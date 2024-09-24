// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCADs6OkQm2gkGeQy0JbBAKqWRB-OsoOqM',
    appId: '1:728243728692:android:d1c79668e2f0af84cf3561',
    messagingSenderId: '728243728692',
    projectId: 'messanger-flutter-e2276',
    databaseURL: 'https://messanger-flutter-e2276-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'messanger-flutter-e2276.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB4vdvrWuwoVCxL-n_9KxjOpVHNssCuANM',
    appId: '1:728243728692:ios:bcae677b3d0676d5cf3561',
    messagingSenderId: '728243728692',
    projectId: 'messanger-flutter-e2276',
    databaseURL: 'https://messanger-flutter-e2276-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'messanger-flutter-e2276.appspot.com',
    androidClientId: '728243728692-0b08qdmbcrjjlll0r50dcr3quvtckmu2.apps.googleusercontent.com',
    iosClientId: '728243728692-gisohgdg56qhdsl913cihopkpr3j98gk.apps.googleusercontent.com',
    iosBundleId: 'com.yaroslav.messangerflutter.messangerFlutter',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC3Byb2r2u56w83az4iOqRd7VGEklKYcMc',
    appId: '1:728243728692:web:3e1fa45e303348ebcf3561',
    messagingSenderId: '728243728692',
    projectId: 'messanger-flutter-e2276',
    authDomain: 'messanger-flutter-e2276.firebaseapp.com',
    databaseURL: 'https://messanger-flutter-e2276-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'messanger-flutter-e2276.appspot.com',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB4vdvrWuwoVCxL-n_9KxjOpVHNssCuANM',
    appId: '1:728243728692:ios:bcae677b3d0676d5cf3561',
    messagingSenderId: '728243728692',
    projectId: 'messanger-flutter-e2276',
    databaseURL: 'https://messanger-flutter-e2276-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'messanger-flutter-e2276.appspot.com',
    androidClientId: '728243728692-0b08qdmbcrjjlll0r50dcr3quvtckmu2.apps.googleusercontent.com',
    iosClientId: '728243728692-gisohgdg56qhdsl913cihopkpr3j98gk.apps.googleusercontent.com',
    iosBundleId: 'com.yaroslav.messangerflutter.messangerFlutter',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC3Byb2r2u56w83az4iOqRd7VGEklKYcMc',
    appId: '1:728243728692:web:99ced116031178eacf3561',
    messagingSenderId: '728243728692',
    projectId: 'messanger-flutter-e2276',
    authDomain: 'messanger-flutter-e2276.firebaseapp.com',
    databaseURL: 'https://messanger-flutter-e2276-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'messanger-flutter-e2276.appspot.com',
  );

}