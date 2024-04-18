import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:seventh_sem_project/module/screens/user/pages/heart_disease_prediction/repo/prediction_repo.dart';
import 'package:seventh_sem_project/module/screens/user/pages/heart_disease_prediction/sqflite_db/database_model.dart';

class HDPredictionController extends GetxController {
  TextEditingController ageController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  TextEditingController chestController = TextEditingController();
  TextEditingController bpController = TextEditingController();
  TextEditingController cholesterolController = TextEditingController();
  final pr = PredictionRepository();

  // bool toggle = false;

  final heartDiseaseList = <PredictionModel>[].obs;
  final listOfHeartDisease = <PredictionModel>[].obs;

  var predictionResult = ''.obs;

  Future<void> setPrediction() async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
    final age = int.parse(ageController.text);
    final sex = int.parse(sexController.text);
    final chestPainType = int.parse(chestController.text);
    final bloodPressure = int.parse(bpController.text);
    final cholestrol = int.parse(cholesterolController.text);
    Logger().d('age is $age\nsex is $sex\nchest pain type $chestPainType\nbp is $bloodPressure\ncholestrol is $cholestrol');
    final setPrediction = await pr.predictionData(PredictionModel(
      age: age ,
      sex: sex ,
      chestPainType: chestPainType ,
      bp: bloodPressure ,
      cholesterol: cholestrol,
    ));
    Logger().d(setPrediction);
    // heartDiseaseList.add(setPrediction);

    Logger().d('lenth chai${heartDiseaseList.length}');
    Logger().d('lenth chai${setPrediction.prediction.runtimeType}');
    if (setPrediction.prediction != null) {
      predictionResult.value = setPrediction.prediction.toString();
    } else {
      predictionResult.value = '0';
    }

    // predictionResult.value = heartDiseaseList[heartDiseaseList.length - 1].prediction.toString();
    Logger().d('Prediction result ${setPrediction.prediction}');

    // final predictionsCollection = FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).collection('predictions');

    // Add the prediction data to the Firestore collection
    // await predictionsCollection.add({
    //   'age': age,
    //   'sex': sex,
    //   'chestPainType': chestPainType,
    //   'bp': bloodPressure,
    //   'cholesterol': cholestrol,
    //   'dateTime': formattedDate,
    //   'prediction': '0 : Absence of Heart Disease',
    // });

    // ageController.clear();
    // sexController.clear();
    // bpController.clear();
    // chestController.clear();
    // cholesterolController.clear();
  }

  Future<void> getPrediction() async {
    Logger().d("here i am");
    final getPrediction = await pr.predictedData();
    listOfHeartDisease.value = getPrediction;
  }
}
