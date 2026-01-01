//
// import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
// import 'package:flutter/foundation.dart'
//     show defaultTargetPlatform, kIsWeb, TargetPlatform;
//
//
// class DefaultFirebaseOptions {
//   static FirebaseOptions get currentPlatform {
//     if (kIsWeb) {
//       return web;
//     }
//     switch (defaultTargetPlatform) {
//       case TargetPlatform.android:
//         return android;
//       case TargetPlatform.iOS:
//         return ios;
//       case TargetPlatform.macOS:
//         return macos;
//       case TargetPlatform.windows:
//         return windows;
//       case TargetPlatform.linux:
//         throw UnsupportedError(
//           'DefaultFirebaseOptions have not been configured for linux - '
//           'you can reconfigure this by running the FlutterFire CLI again.',
//         );
//       default:
//         throw UnsupportedError(
//           'DefaultFirebaseOptions are not supported for this platform.',
//         );
//     }
//   }
//
//   static const FirebaseOptions web = FirebaseOptions(
//     apiKey: 'AIzaSyC-h0o-P_wbjT7W5hRuM5QFIbhsPf1W_y8',
//     appId: '1:734891659976:web:0870dcd265f2fe8a560bfd',
//     messagingSenderId: '734891659976',
//     projectId: 'chatapp-a3a4c',
//     authDomain: 'chatapp-a3a4c.firebaseapp.com',
//     storageBucket: 'chatapp-a3a4c.firebasestorage.app',
//     measurementId: 'G-M21X8S5ERG',
//   );
//
//   static const FirebaseOptions android = FirebaseOptions(
//     apiKey: 'AIzaSyCbYcQHjQu8eUh4uEuKBaE2YwVCpk-iL_E',
//     appId: '1:734891659976:android:cea989f54fd95e67560bfd',
//     messagingSenderId: '734891659976',
//     projectId: 'chatapp-a3a4c',
//     storageBucket: 'chatapp-a3a4c.firebasestorage.app',
//   );
//
//   static const FirebaseOptions ios = FirebaseOptions(
//     apiKey: 'AIzaSyDMHlBshhs4BdyJXUlMF7DTPA6hzTkZK8M',
//     appId: '1:734891659976:ios:5ba8a095eb8da8d3560bfd',
//     messagingSenderId: '734891659976',
//     projectId: 'chatapp-a3a4c',
//     storageBucket: 'chatapp-a3a4c.firebasestorage.app',
//     iosBundleId: 'com.example.chat',
//   );
//
//   static const FirebaseOptions macos = FirebaseOptions(
//     apiKey: 'AIzaSyDMHlBshhs4BdyJXUlMF7DTPA6hzTkZK8M',
//     appId: '1:734891659976:ios:5ba8a095eb8da8d3560bfd',
//     messagingSenderId: '734891659976',
//     projectId: 'chatapp-a3a4c',
//     storageBucket: 'chatapp-a3a4c.firebasestorage.app',
//     iosBundleId: 'com.example.chat',
//   );
//
//   static const FirebaseOptions windows = FirebaseOptions(
//     apiKey: 'AIzaSyC-h0o-P_wbjT7W5hRuM5QFIbhsPf1W_y8',
//     appId: '1:734891659976:web:276c6c89ebb5a928560bfd',
//     messagingSenderId: '734891659976',
//     projectId: 'chatapp-a3a4c',
//     authDomain: 'chatapp-a3a4c.firebaseapp.com',
//     storageBucket: 'chatapp-a3a4c.firebasestorage.app',
//     measurementId: 'G-M3W6MM7KJE',
//   );
// }
