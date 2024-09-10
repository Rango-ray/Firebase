// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_auth/firebase_auth.dart';
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
/// 
/// 
/// 
/// 

import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';

// ...

//await Firebase.initializeApp(
 //   options : DefaultFirebaseOptions.currentPlatform,
//);




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

  static  FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA0CGkUQL1yHVvNX6O1IpZGQ4lp7MLpaCU',
    appId: '1:1064135727959:web:f2c866666d25284fe77c12',
    messagingSenderId: '1064135727959',
    projectId: 'aaaa-record',
    authDomain: 'aaaa-record.firebaseapp.com',
    storageBucket: 'aaaa-record.appspot.com',
    measurementId: 'G-EB0W5H2N0V',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCR4a2R6hJt9wQDQ6uBIMFNEZHBpmrmaco',
    appId: '1:1064135727959:android:f6589006ecac612ae77c12',
    messagingSenderId: '1064135727959',
    projectId: 'aaaa-record',
    storageBucket: 'aaaa-record.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC3O6am7xG2wL89awXfXY1DBc5_YRiK8ZU',
    appId: '1:1064135727959:ios:8c754199b157bfd3e77c12',
    messagingSenderId: '1064135727959',
    projectId: 'aaaa-record',
    storageBucket: 'aaaa-record.appspot.com',
    iosBundleId: 'com.example.logginPage',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC3O6am7xG2wL89awXfXY1DBc5_YRiK8ZU',
    appId: '1:1064135727959:ios:8c754199b157bfd3e77c12',
    messagingSenderId: '1064135727959',
    projectId: 'aaaa-record',
    storageBucket: 'aaaa-record.appspot.com',
    iosBundleId: 'com.example.logginPage',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA0CGkUQL1yHVvNX6O1IpZGQ4lp7MLpaCU',
    appId: '1:1064135727959:web:ad7bc6bde7a228ade77c12',
    messagingSenderId: '1064135727959',
    projectId: 'aaaa-record',
    authDomain: 'aaaa-record.firebaseapp.com',
    storageBucket: 'aaaa-record.appspot.com',
    measurementId: 'G-YDS0YSRPJY',
  );
}
