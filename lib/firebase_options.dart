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
    apiKey: 'AIzaSyBZ7rTSI8q9htB5EYJvZ0SxAhFkZuqffEM',
    appId: '1:1024500234479:web:9e156897302c7e8dad831a',
    messagingSenderId: '1024500234479',
    projectId: 'project-spotify-83d9f',
    authDomain: 'project-spotify-83d9f.firebaseapp.com',
    storageBucket: 'project-spotify-83d9f.appspot.com',
    measurementId: 'G-SEEM1MLY0R',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBrnhAHjLOAzcofCBZj6-VcMEraQyHoWqg',
    appId: '1:1024500234479:android:4900c6c56903c414ad831a',
    messagingSenderId: '1024500234479',
    projectId: 'project-spotify-83d9f',
    storageBucket: 'project-spotify-83d9f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDnqxue_RYUvOwFN1u7tNC4_NGHQAAp9oE',
    appId: '1:1024500234479:ios:d98533498b0c7ea6ad831a',
    messagingSenderId: '1024500234479',
    projectId: 'project-spotify-83d9f',
    storageBucket: 'project-spotify-83d9f.appspot.com',
    iosBundleId: 'com.example.spotifywithoutfire',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDnqxue_RYUvOwFN1u7tNC4_NGHQAAp9oE',
    appId: '1:1024500234479:ios:d98533498b0c7ea6ad831a',
    messagingSenderId: '1024500234479',
    projectId: 'project-spotify-83d9f',
    storageBucket: 'project-spotify-83d9f.appspot.com',
    iosBundleId: 'com.example.spotifywithoutfire',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBZ7rTSI8q9htB5EYJvZ0SxAhFkZuqffEM',
    appId: '1:1024500234479:web:b787c6536747ed34ad831a',
    messagingSenderId: '1024500234479',
    projectId: 'project-spotify-83d9f',
    authDomain: 'project-spotify-83d9f.firebaseapp.com',
    storageBucket: 'project-spotify-83d9f.appspot.com',
    measurementId: 'G-70S977BH1V',
  );

}