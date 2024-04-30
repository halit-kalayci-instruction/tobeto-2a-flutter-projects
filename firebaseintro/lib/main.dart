import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseintro/firebase_options.dart';
import 'package:firebaseintro/screens/auth.dart';
import 'package:firebaseintro/screens/homepage.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FirebaseApp firebaseApp = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);

// StreamBuilder => FirebaseAuth.AuthStateChanges
  runApp(
    MaterialApp(
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) return const Homepage();
          return const Auth();
        },
      ),
    ),
  );
}
