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
    apiKey: 'AIzaSyAgdYbxylhFis9FFb3vq0hNo_3GKJn0KmU',
    appId: '1:919432132407:web:dcf39001113bd08a2a4cb2',
    messagingSenderId: '919432132407',
    projectId: 'memodemo',
    authDomain: 'memodemo-be7c6.firebaseapp.com',
    storageBucket: 'memodemo.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyANsVmkVsaxQ-W-5wdgJdGY_GoTRCk51Q4',
    appId: '1:919432132407:android:850a4f8fc3e5f7352a4cb2',
    messagingSenderId: '919432132407',
    projectId: 'memodemo',
    storageBucket: 'memodemo.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB-khtzul3ko8-kIE4b9p3aWqpEASzgaAI',
    appId: '1:919432132407:ios:1be16be8b8a73b9b2a4cb2',
    messagingSenderId: '919432132407',
    projectId: 'memodemo',
    storageBucket: 'memodemo.appspot.com',
    iosClientId: '919432132407-n6ckqom09f8nv5fh5t51sk1brh1278r0.apps.googleusercontent.com',
    iosBundleId: 'com.example.newmemodemo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB-khtzul3ko8-kIE4b9p3aWqpEASzgaAI',
    appId: '1:919432132407:ios:b9664bb72ea2b32b2a4cb2',
    messagingSenderId: '919432132407',
    projectId: 'memodemo',
    storageBucket: 'memodemo.appspot.com',
    iosClientId: '919432132407-o29b8ai5nm8do8car5m3flv75uuc97jj.apps.googleusercontent.com',
    iosBundleId: 'com.example.newmemodemo.RunnerTests',
  );
}
