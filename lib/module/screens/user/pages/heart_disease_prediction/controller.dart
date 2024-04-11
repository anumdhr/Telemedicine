import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'package:seventh_sem_project/constant/api_url.dart';
import 'package:seventh_sem_project/module/screens/user/pages/heart_disease_prediction/repo/prediction_repo.dart';
import 'package:seventh_sem_project/module/screens/user/pages/heart_disease_prediction/sqflite_db/database_model.dart';
import 'package:seventh_sem_project/module/screens/user/pages/heart_disease_prediction/sqflite_db/sqflite_database.dart';
import 'package:seventh_sem_project/module/screens/user/pages/home_page/home_page.dart';
import 'package:seventh_sem_project/module/utils/const.dart';

class HDPredictionController extends GetxController {
  TextEditingController ageController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  TextEditingController chestController = TextEditingController();
  TextEditingController bpController = TextEditingController();
  TextEditingController cholesterolController = TextEditingController();
  final pr = PredictionRepository();

  final heartDiseaseList = <PredictionModel>[].obs;

  // void addResult() async {
  //   DateTime now = DateTime.now();
  //   String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
  //   try {
  //     final newHeartDisease = PredictionModel(
  //       dateTime: formattedDate,
  //       age: int.parse(ageController.text),
  //       sex: int.parse(sexController.text),
  //       cholesterol: int.parse(chestController.text),
  //     );
  //
  //     // await DatabaseService().create(newHeartDisease);
  //     ageController.clear();
  //     sexController.clear();
  //     chestController.clear();
  //     bpController.clear();
  //     cholesterolController.clear();
  //   } catch (e) {
  //     Logger().e(e);
  //   }
  // }

  Future<void> setPrediction() async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
    final age = int.parse(ageController.text);
    final sex = int.parse(sexController.text);
    final chestPainType = int.parse(chestController.text);
    final bloodPressure = int.parse(bpController.text);
    final cholestrol = int.parse(cholesterolController.text);
    Logger().d('age is $age\nsex is $sex\nchest pain type $chestPainType\nbp is $bloodPressure\ncholestrol is $cholestrol');

    final setPrediction = pr.predictionData(PredictionModel(
      age: age ?? 0,
      sex: sex ?? 0,
      chestPainType: chestPainType ?? 0,
      bp: bloodPressure ?? 0,
      cholesterol: cholestrol ?? 0,
    ));

    final predictionsCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('predictions');

    // Add the prediction data to the Firestore collection
    await predictionsCollection.add({
      'age': age,
      'sex': sex,
      'chestPainType': chestPainType,
      'bp': bloodPressure,
      'cholesterol': cholestrol,
      'dateTime': formattedDate,
      'prediction': '0 : Absence of Heart Disease',
    });

    // final predictionsCollection = FirebaseFirestore.instance.collection('predictions');
    //
    // // Add the prediction data to the Firestore collection
    // await predictionsCollection.add(
    //   PredictionModel()
    //       .copyWith(age: age, sex: sex, bp: bloodPressure, chestPainType: chestPainType, cholesterol: cholestrol, dateTime: formattedDate, prediction: "1")
    //       .toJson(),
    // );
  }

// void fetchPredictionHistory() async {
//   final url = Uri.parse('http://127.0.0.1:8000/api/user/predict/');
//   final response = await http.get(url);
//
//   if (response.statusCode == 200) {
//     final responseData = jsonDecode(response.body);
//     final predictions = responseData.map<PredictionModel>((item) => PredictionModel.fromJson(item)).toList();
//     heartDiseaseList.value = predictions;
//   } else {
//     Get.snackbar(
//       "Error",
//       "Failed to fetch prediction history. Please try again later.",
//       backgroundColor: Colors.red,
//       colorText: Colors.white,
//     );
//   }
// }
}
