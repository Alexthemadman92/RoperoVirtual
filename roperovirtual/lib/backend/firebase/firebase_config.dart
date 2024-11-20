import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCApbZmIAGawGNEG2njaPf5LjHDYRvIIbo",
            authDomain: "roperovirtual-w00yzs.firebaseapp.com",
            projectId: "roperovirtual-w00yzs",
            storageBucket: "roperovirtual-w00yzs.firebasestorage.app",
            messagingSenderId: "623666510803",
            appId: "1:623666510803:web:83e7500ca943775a5acd26"));
  } else {
    await Firebase.initializeApp();
  }
}
