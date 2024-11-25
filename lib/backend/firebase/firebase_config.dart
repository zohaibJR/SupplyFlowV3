import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBp9WaH2Z-rE6wqhePcKA71Q0EsAB2cJ-I",
            authDomain: "supplyflow360-r8u3vw.firebaseapp.com",
            projectId: "supplyflow360-r8u3vw",
            storageBucket: "supplyflow360-r8u3vw.appspot.com",
            messagingSenderId: "121312876142",
            appId: "1:121312876142:web:60810fc7c8d62950b1f87f"));
  } else {
    await Firebase.initializeApp();
  }
}
