class DatabaseModel {
  int? id;

  final int age;
  final int sex;
  final int chest;
  final int bloodPressure;
  final int cholestrol;
  final int sugar;
  final int heartRate;
  final String dateTime;

  DatabaseModel({
    this.id,

    required this.dateTime,
    required this.age,
    required this.sex,
    required this.chest,
    required this.bloodPressure,
    required this.cholestrol,
    required this.sugar,
    required this.heartRate,
  });
  DatabaseModel copyWith({int? age, int? sex, int? chest, int? bloodPressure, int? cholestrol, int? sugar, int? heartRate, String? dateTime}) {
    return DatabaseModel(
      dateTime: dateTime ?? this.dateTime,
      age: age ?? this.age,
      sex: sex ?? this.sex,
      chest: chest ?? this.chest,
      bloodPressure: bloodPressure ?? this.bloodPressure,
      cholestrol: cholestrol ?? this.cholestrol,
      sugar: sugar ?? this.sugar,
      heartRate: heartRate ?? this.heartRate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'age': age,
      'sex': sex,
      'chest': chest,
      'bloodPressure': bloodPressure,
      'cholestrol': cholestrol,
      'sugar': sugar,
      'heartRate': heartRate,
      'dateTime': dateTime,
    };
  }
}
// class HeartDiseaseModel {
//   int? id;
//   final int age;
//   final int sex;
//   final int chest;
//   final int bloodPressure;
//   final int cholestrol;
//   final int sugar;
//   final int heartRate;
//   final String dateTime;
//
//   HeartDiseaseModel({
//     this.id,
//     required this.dateTime,
//     required this.age,
//     required this.sex,
//     required this.chest,
//     required this.bloodPressure,
//     required this.cholestrol,
//     required this.sugar,
//     required this.heartRate,
//   });
//
//   HeartDiseaseModel copyWith({int? age, int? sex, int? chest, int? bloodPressure, int? cholestrol, int? sugar, int? heartRate, String? dateTime}) {
//     return HeartDiseaseModel(
//       dateTime: dateTime ?? this.dateTime,
//       age: age ?? this.age,
//       sex: sex ?? this.sex,
//       chest: chest ?? this.chest,
//       bloodPressure: bloodPressure ?? this.bloodPressure,
//       cholestrol: cholestrol ?? this.cholestrol,
//       sugar: sugar ?? this.sugar,
//       heartRate: heartRate ?? this.heartRate,
//     );
//   }
// }

