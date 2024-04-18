import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:seventh_sem_project/module/screens/user/pages/heart_disease_prediction/controller.dart';
import 'package:seventh_sem_project/module/screens/user/pages/heart_disease_prediction/sqflite_db/database_model.dart';

class PredictionRepository {
  Dio dio = Dio();

  Future<PredictionModel> predictionData(PredictionModel predictionModel) async {
    Logger().d("kjhfdhskj");
    Logger().d(predictionModel.chestPainType);
    Logger().d('Hello ${predictionModel.cholesterol}');
    try {
      // data: predictionModel.toJson(),

      final response = await dio.post(
        'http://10.10.43.253:8000/api/predict/',
        data: predictionModel.toJson(),
      );
      Logger().d(response.statusCode);
      Logger().d(response.data);


      if (response.statusCode == 200) {
        Logger().d(response.data["prediction"]);
        return PredictionModel.fromJson(response.data);



      } else {
        // Throw an exception for non-200 status codes
        throw Exception('Failed to load prediction data');
      }

    } catch (e) {
      // Log the error
      Logger().e("Error: $e");

      // Throw an exception to ensure a non-null return value
      throw Exception('Failed to load prediction data');
    }
  }

  Future<List<PredictionModel>> predictedData() async {
    try {
      final response = await dio.get('http://10.10.43.253:8000/api/predict/');
      Logger().d(response);

      if (response.statusCode == 200) {
        final data = response.data['data'];
        List<PredictionModel> predictedModels = [];

        data.forEach((item) {
          predictedModels.add(PredictionModel.fromJson(item));
          Logger().d(predictedModels.length);
        });

        return predictedModels;
      }
    } catch (e) {
      print('erre ako aai cha $e');
    }
    return [];
  }

}
