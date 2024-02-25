import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBTPcsYpIzGA0CdjDoVnEk690-gzihTje8",
            authDomain: "share-35f96.firebaseapp.com",
            projectId: "share-35f96",
            storageBucket: "share-35f96.appspot.com",
            messagingSenderId: "320942372746",
            appId: "1:320942372746:web:38772df0fc0ef425ed7a73",
            measurementId: "G-GYCLQ8YD2Y"));
  } else {
    await Firebase.initializeApp();
  }
}
