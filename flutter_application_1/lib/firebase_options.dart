import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) return web;
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        return web;
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBLix4E5Z3dSna8spD2Kkw2Iav3g4ZcoUw',
    appId: '1:249897394934:web:3d20e71e216a7c029402d7',
    messagingSenderId: '249897394934',
    projectId: 'fir-tutorial-708dd',
    authDomain: 'fir-tutorial-708dd.firebaseapp.com',
    storageBucket: 'fir-tutorial-708dd.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDMLkypcHlrCkZr6Ns8batF_k19h0QbdIc',
    appId: '1:249897394934:android:cfd6abdc0e30001d9402d7',
    messagingSenderId: '249897394934',
    projectId: 'fir-tutorial-708dd',
    storageBucket: 'fir-tutorial-708dd.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDMLkypcHlrCkZr6Ns8batF_k19h0QbdIc',
    appId: '1:249897394934:ios:cfd6abdc0e30001d9402d7',
    messagingSenderId: '249897394934',
    projectId: 'fir-tutorial-708dd',
    storageBucket: 'fir-tutorial-708dd.firebasestorage.app',
    iosBundleId: 'com.example.flutterApplication1',
  );
}
