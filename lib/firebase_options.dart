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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAij-t0_L9msAngUWe99fps7E3zvDB0Xjk',
    appId: '1:997098979845:web:1f6b6f21d3ce39a1f9d26c',
    messagingSenderId: '997098979845',
    projectId: 'calendar-cb714',
    authDomain: 'calendar-cb714.firebaseapp.com',
    storageBucket: 'calendar-cb714.appspot.com',
    measurementId: 'G-66V0W05TN0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDs--Rc9sNpOJIbLqJra0dYjfFosve4d9s',
    appId: '1:997098979845:android:cd9c966a7f0ad901f9d26c',
    messagingSenderId: '997098979845',
    projectId: 'calendar-cb714',
    storageBucket: 'calendar-cb714.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB6NjRc7veIry8ygpWCIgc1624a4Rk0quw',
    appId: '1:997098979845:ios:68da550c89038055f9d26c',
    messagingSenderId: '997098979845',
    projectId: 'calendar-cb714',
    storageBucket: 'calendar-cb714.appspot.com',
    iosClientId: '997098979845-0hdhouuk5kpc2853ot6he4keg7her6bi.apps.googleusercontent.com',
    iosBundleId: 'jp.motucraft.googleCalendar',
  );
}
