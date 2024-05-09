import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasebloc/models/user.dart';

class UserRepository {
  Future<User> fetchUserById(String id) async {
    FirebaseFirestore db = FirebaseFirestore.instance;

    var userInfo = await db.collection("users").doc(id).get();
    var userJson = userInfo.data();
    User userModel = User.fromMap(userJson!);

    return userModel;
  }
}
