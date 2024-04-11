// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

BlogModel userFromJson(String str) => BlogModel.fromJson(json.decode(str));

String userToJson(BlogModel data) => json.encode(data.toJson());

class BlogModel {
  String? image;
  String? title;
  String? description;

  BlogModel({
    this.image,
    this.title,
    this.description,
  });

  BlogModel copyWith({
    String? image,
    String? title,
    String? description,
  }) =>
      BlogModel(image: this.image ?? image, title: this.title ?? title, description: this.description ?? description);

  factory BlogModel.fromJson(Map<String, dynamic> json) => BlogModel(
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
