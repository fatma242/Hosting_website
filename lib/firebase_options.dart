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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB-5qJXMBVM8uXy2TyflO6ujOAS0xeHmWk',
    appId: '1:529821159961:web:892b3fa3edab2eb8555088',
    messagingSenderId: '529821159961',
    projectId: 'cloudtask-a9567',
    authDomain: 'cloudtask-a9567.firebaseapp.com',
    storageBucket: 'cloudtask-a9567.firebasestorage.app',
    measurementId: 'G-941X6M5Q1Q',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBSnByezRHX7ue8Pkocg01PtDEPz8X_RyQ',
    appId: '1:529821159961:android:11d777040f1d75b2555088',
    messagingSenderId: '529821159961',
    projectId: 'cloudtask-a9567',
    storageBucket: 'cloudtask-a9567.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBg8hPY_r3jh45SurY9V3Xhn4s0d1V1fQY',
    appId: '1:529821159961:ios:9a4ada045443151a555088',
    messagingSenderId: '529821159961',
    projectId: 'cloudtask-a9567',
    storageBucket: 'cloudtask-a9567.firebasestorage.app',
    iosBundleId: 'com.example.cloudTask2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBg8hPY_r3jh45SurY9V3Xhn4s0d1V1fQY',
    appId: '1:529821159961:ios:9a4ada045443151a555088',
    messagingSenderId: '529821159961',
    projectId: 'cloudtask-a9567',
    storageBucket: 'cloudtask-a9567.firebasestorage.app',
    iosBundleId: 'com.example.cloudTask2',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB-5qJXMBVM8uXy2TyflO6ujOAS0xeHmWk',
    appId: '1:529821159961:web:53e7a79075cd656a555088',
    messagingSenderId: '529821159961',
    projectId: 'cloudtask-a9567',
    authDomain: 'cloudtask-a9567.firebaseapp.com',
    storageBucket: 'cloudtask-a9567.firebasestorage.app',
    measurementId: 'G-XNZ5F613M3',
  );
}