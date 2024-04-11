// To parse this JSON data, do
//
//     final predictionModel = predictionModelFromJson(jsonString);

import 'dart:convert';

PredictionModel predictionModelFromJson(String str) => PredictionModel.fromJson(json.decode(str));

String predictionModelToJson(PredictionModel data) => json.encode(data.toJson());

class PredictionModel {
  int? age;
  int? sex;
  int? chestPainType;
  int? bp;
  int? cholesterol;
  String? dateTime;
  String? prediction;

  PredictionModel({
    this.age,
    this.sex,
    this.chestPainType,
    this.bp,
    this.cholesterol,
    this.dateTime,
    this.prediction,
  });

  PredictionModel copyWith({
    int? age,
    int? sex,
    int? chestPainType,
    int? bp,
    int? cholesterol,
    String? dateTime,
    String? prediction,
  }) =>
      PredictionModel(
        age: age ?? this.age,
        sex: sex ?? this.sex,
        chestPainType: chestPainType ?? this.chestPainType,
        bp: bp ?? this.bp,
        cholesterol: cholesterol ?? this.cholesterol,
        dateTime: dateTime ?? this.dateTime,
        prediction: prediction ?? this.prediction,
      );

  factory PredictionModel.fromJson(Map<String, dynamic> json) => PredictionModel(
    age: json["Age"],
    sex: json["Sex"],
    chestPainType: json["Chest pain type"],
    bp: json["BP"],
    cholesterol: json["Cholesterol"],
    dateTime: json["dateTime"],
    prediction: json["prediction "],
  );

  Map<String, dynamic> toJson() => {
    "Age": age,
    "Sex": sex,
    "Chest pain type": chestPainType,
    "BP": bp,
    "Cholesterol": cholesterol,

  };
}
