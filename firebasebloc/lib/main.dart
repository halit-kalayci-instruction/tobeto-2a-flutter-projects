import 'package:firebase_core/firebase_core.dart';
import 'package:firebasebloc/blocs/auth/auth_bloc.dart';
import 'package:firebasebloc/blocs/users/user_bloc.dart';
import 'package:firebasebloc/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
      BlocProvider<UserBloc>(create: (context) => UserBloc())
    ],
    child: const MaterialApp(),
  ));
}
