import 'dart:convert';

class UserModel {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? avatarUrl;
  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.avatarUrl,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (firstName != null) {
      result.addAll({'firstName': firstName});
    }
    if (lastName != null) {
      result.addAll({'lastName': lastName});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    if (avatarUrl != null) {
      result.addAll({'avatarUrl': avatarUrl});
    }

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      avatarUrl: map['avatarUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
