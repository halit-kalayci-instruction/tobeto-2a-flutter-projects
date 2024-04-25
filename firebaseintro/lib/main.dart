import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseintro/firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // 10:15 - Auth Impl.
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("Firebase Entegrasyon"),
        ),
      ),
    ),
  );
}
