import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  void _register() async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: _email, password: _password);

    print(userCredential);
  }

  final _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Text("Kayıt Ol"),
                      TextFormField(
                        decoration: const InputDecoration(labelText: "E-posta"),
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (newValue) {
                          _email = newValue!;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: "Şifre"),
                        autocorrect: false,
                        obscureText: true,
                        onSaved: (newValue) {
                          _password = newValue!;
                        },
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _register();
                        },
                        child: const Text("Kayıt Ol"),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
