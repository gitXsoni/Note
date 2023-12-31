// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBbH8R7YunmT5jL3iSCZtMmsFDajmTBFbw',
    appId: '1:665421397029:web:18b3380f663a00d83b53cc',
    messagingSenderId: '665421397029',
    projectId: 'practice-87327',
    authDomain: 'practice-87327.firebaseapp.com',
    storageBucket: 'practice-87327.appspot.com',
    measurementId: 'G-TVPCQ93RQD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAGb_KBQUY8sS0W7n09d7vYBg8xaIzel90',
    appId: '1:665421397029:android:b599c95f6e7f90e03b53cc',
    messagingSenderId: '665421397029',
    projectId: 'practice-87327',
    storageBucket: 'practice-87327.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAn_nP63HVQNcRHS7b6qqLkmuWhbRa0b8k',
    appId: '1:665421397029:ios:5884c199606c06093b53cc',
    messagingSenderId: '665421397029',
    projectId: 'practice-87327',
    storageBucket: 'practice-87327.appspot.com',
    iosBundleId: 'com.example.loginUi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAn_nP63HVQNcRHS7b6qqLkmuWhbRa0b8k',
    appId: '1:665421397029:ios:8f2b73e0d10873f13b53cc',
    messagingSenderId: '665421397029',
    projectId: 'practice-87327',
    storageBucket: 'practice-87327.appspot.com',
    iosBundleId: 'com.example.loginUi.RunnerTests',
  );
}
