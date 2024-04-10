// To parse this JSON data, do
//
//     final doctorProfileModel = doctorProfileModelFromJson(jsonString);

import 'dart:convert';

DoctorProfileModel doctorProfileModelFromJson(String str) => DoctorProfileModel.fromJson(json.decode(str));

String doctorProfileModelToJson(DoctorProfileModel data) => json.encode(data.toJson());

class DoctorProfileModel {

  String? firstName;
  String? lastName;
  String? specialization;
  String? degree;
  String? visitingTime;
  String? workingHospital;
  String? image;
  String? userUid;

  DoctorProfileModel({
    this.firstName,
    this.lastName,
    this.specialization,
    this.degree,
    this.visitingTime,
    this.workingHospital,
    this.image,
    this.userUid,
  });

  DoctorProfileModel copyWith({
    String? firstName,
    String? lastName,
    String? specialization,
    String? degree,
    String? visitingTime,
    String? workingHospital,
    String? image,
    String? userUid,
  }) =>
      DoctorProfileModel(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        specialization: specialization ?? this.specialization,
        degree: degree ?? this.degree,
        visitingTime: visitingTime ?? this.visitingTime,
        workingHospital: workingHospital ?? this.workingHospital,
        image: image ?? this.image,
      );

  factory DoctorProfileModel.fromJson(Map<String, dynamic> json) => DoctorProfileModel(
    firstName: json["firstName"],
    lastName: json["lastName"],
    specialization: json["Specialization"],
    degree: json["Degree"],
    visitingTime: json["Visiting Time"],
    workingHospital: json["Working Hospital"],
    image: json["image"],
    userUid: json["userUid"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "Specialization": specialization,
    "Degree": degree,
    "Visiting Time": visitingTime,
    "Working Hospital": workingHospital,
    "image": image,
    "userUid": userUid,
  };
}
