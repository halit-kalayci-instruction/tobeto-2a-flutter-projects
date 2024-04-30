import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseintro/models/userModel.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<UserModel> _getUser() async {
    User? loggedInUser = FirebaseAuth.instance.currentUser;

    if (loggedInUser != null) {
      FirebaseFirestore db = FirebaseFirestore.instance;

      var userInfo = await db.collection("users").doc(loggedInUser.uid).get();
      var userJson = userInfo.data();
      UserModel userModel = UserModel.fromMap(userJson!);

      return userModel;
      // Ana sayfada bir adet image picker kullanarak resim yüklenmesi. Seçilen resmin
      // Avatar'a aktarılması
      // Güncelle butonuna tıklandığında databasedeki giriş yapmış kullanıcının "avatarUrl" kısmına "abc" yazan
      // güncelleme kodları.
    }

    throw Exception("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase App"),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: _getUser(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Text("Veri Yükleniyor..");
            } else {
              return Text(
                  "Hoşgeldiniz ${snapshot.data!.firstName} ${snapshot.data!.lastName}");
            }
          },
        ),
      ),
    );
  }
}
