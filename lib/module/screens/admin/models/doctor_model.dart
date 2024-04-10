// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

AdminModel userFromJson(String str) => AdminModel.fromJson(json.decode(str));

String userToJson(AdminModel data) => json.encode(data.toJson());

class AdminModel {
  String? image;
  String? title;
  String? description;

  AdminModel({
    this.image,
    this.title,
    this.description,
  });

  AdminModel copyWith({
    String? image,
    String? title,
    String? description,
  }) =>
      AdminModel(image: this.image ?? image, title: this.title ?? title, description: this.description ?? description);

  factory AdminModel.fromJson(Map<String, dynamic> json) => AdminModel(
        image: json["image"],
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "description": description,
      };
}
