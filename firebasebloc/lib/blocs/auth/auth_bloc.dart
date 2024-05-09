import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasebloc/blocs/auth/auth_event.dart';
import 'package:firebasebloc/blocs/auth/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(NotAuthenticated()) {
    on<LoginEvent>(_login);
  }

  Future<void> _login(LoginEvent loginEvent, Emitter<AuthState> emitter) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      UserCredential credentials = await auth.signInWithEmailAndPassword(
          email: loginEvent.email, password: loginEvent.password);
    } on FirebaseAuthException catch (error) {
      emitter(LoginError(errorMessage: error.message));
    }
  }
}
