import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseintro/firebase_options.dart';
import 'package:firebaseintro/screens/auth.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FirebaseApp firebaseApp = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);

// StreamBuilder => FirebaseAuth.AuthStateChanges
  runApp(
    const MaterialApp(home: Auth()),
  );
}
