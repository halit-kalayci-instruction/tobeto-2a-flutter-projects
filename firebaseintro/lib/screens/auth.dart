import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  void _submit() async {
    _registerPage ? _register() : _login();
  }

  void _login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password);
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.message ?? "Giriş Başarısız")));
    }
  }

  void _register() async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: _email, password: _password);
  }

  bool _registerPage = true;
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
                      Text(_registerPage ? "Kayıt Ol" : "Giriş Yap"),
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
                          _formKey.currentState!.save();
                          _submit();
                        },
                        child: Text(_registerPage ? "Kayıt Ol" : "Giriş Yap"),
                      ),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              _formKey.currentState!.reset();
                              _registerPage = !_registerPage;
                            });
                          },
                          child: Text(_registerPage
                              ? "Zaten üye misiniz? Giriş Yap"
                              : "Hesabınız yok mu? Kayıt Ol"))
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
