import 'dart:convert';

import 'package:capitalplace/src/features/auth/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required String name,
    required String email,
  }) : super(name: name, email: email);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  }

  // factory UserModel.fromFirebase(Map<String, dynamic> map) {
  //   return UserModel(
  //     name: map['name'] ?? '',
  //     email: map['email'] ?? '',
  //   );
  // }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
