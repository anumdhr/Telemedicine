// To parse this JSON data, do
//
//     final loginDatabaseModel = loginDatabaseModelFromJson(jsonString);

import 'dart:convert';

LoginDatabaseModel loginDatabaseModelFromJson(String str) => LoginDatabaseModel.fromJson(json.decode(str));

String loginDatabaseModelToJson(LoginDatabaseModel data) => json.encode(data.toJson());

class LoginDatabaseModel {
  String? firstName;
  String? lastName;
  String? email;
  String? role;
  String? phone;

  LoginDatabaseModel({
    this.firstName,
    this.lastName,
    this.email,
    this.role,
    this.phone,
  });

  LoginDatabaseModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? role,
    String? phone,
  }) =>
      LoginDatabaseModel(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        role: role ?? this.role,
        phone: phone ?? this.phone,
      );

  factory LoginDatabaseModel.fromJson(Map<String, dynamic> json) => LoginDatabaseModel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        role: json["role"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "role": role,
      "phone": phone,
    };
  }
}
