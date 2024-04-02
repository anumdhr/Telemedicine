// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

NewUserModel userFromJson(String str) => NewUserModel.fromJson(json.decode(str));

String userToJson(NewUserModel data) => json.encode(data.toJson());

class NewUserModel {
  String? firstname;
  String? lastname;
  String? email;
  String? password;
  String? confirmPassword;
  String? role;
  String? phone;

  NewUserModel({
    this.firstname,
    this.lastname,
    this.email,
    this.password,
    this.confirmPassword,
    this.role,
    this.phone,
  });

  NewUserModel copyWith({
    String? firstname,
    String? lastname,
    String? email,
    String? password,
    String? confirmPassword,
    String? role,
    String? phone,
  }) =>
      NewUserModel(
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        email: email ?? this.email,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        role: role ?? this.role,
        phone: phone ?? this.phone,
      );

  factory NewUserModel.fromJson(Map<String, dynamic> json) => NewUserModel(
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        password: json["password"],
        confirmPassword: json["confirmPassword"],
        role: json["role"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "password": password,
        "role": role,
        "phone": phone,
      };
}
