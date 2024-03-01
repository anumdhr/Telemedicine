import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:seventh_sem_project/module/sqflite_db/database_model.dart';
import 'package:seventh_sem_project/module/sqflite_db/sqflite_database.dart';

class HDPredictionController extends GetxController {
  TextEditingController ageController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  TextEditingController chestController = TextEditingController();
  TextEditingController bpController = TextEditingController();
  TextEditingController cholestrolController = TextEditingController();
  TextEditingController sugarController = TextEditingController();
  TextEditingController heartRateController = TextEditingController();

  final heartDiseaseList = <DatabaseModel>[].obs;

  void addResult() async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
    try {
      final newHeartDisease = DatabaseModel(
          dateTime: formattedDate,
          age: int.parse(ageController.text),
          sex: int.parse(sexController.text),
          chest: int.parse(chestController.text),
          bloodPressure: int.parse(bpController.text),
          cholestrol: int.parse(chestController.text),
          sugar: int.parse(sugarController.text),
          heartRate: int.parse(heartRateController.text));
      print('new heart d is $newHeartDisease');

      await DatabaseService().create(newHeartDisease);
      ageController.clear();
      sexController.clear();
      chestController.clear();
      bpController.clear();
      cholestrolController.clear();
      sugarController.clear();
      heartRateController.clear();
    } catch (e) {
      Logger().e(e);
    }
  }


  void readNote()async{
    List<DatabaseModel> totalList = await DatabaseService().readResult();
    heartDiseaseList.addAll(totalList);
  }
}
