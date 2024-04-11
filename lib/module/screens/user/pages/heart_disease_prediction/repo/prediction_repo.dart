import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:seventh_sem_project/module/screens/user/pages/heart_disease_prediction/sqflite_db/database_model.dart';

class PredictionRepository {
  Dio dio = Dio();

  Future<PredictionModel> predictionData(PredictionModel predictionModel) async {
    Logger().d("kjhfdhskj");
    try {
      // data: predictionModel.toJson(),

    final response = await dio.get(
        'https://fakestoreapi.com/products/1',
        // data: {
        //   "Age": 67,
        //   "Sex": 0,
        //   "Chest pain type": 3,
        //   "BP": 115,
        //   "Cholesterol": 564
        // },
      );
      Logger().d(response.statusCode);
      Logger().d(response);

      if (response.statusCode == 200) {
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

  // final url = Uri.parse('http://127.0.0.1:8000/api/user/predict/');
  // final response = await http.get(url);

  // Future<PredictionModel> predictedResult() async {
  //   try {
  //     final response = await dio.get('http://192.168.1.85:8000/api/user/predict/');
  //     Logger().d(response.statusCode);
  //
  //     if (response.statusCode == 200) {
  //       return PredictionModel.fromJson(response.data);
  //     } else {
  //       // Throw an exception for non-200 status codes
  //       throw Exception('Failed to load predicted result');
  //     }
  //   } catch (e) {
  //     // Log the error
  //     Logger().e("Error: $e");
  //
  //     // Throw an exception to ensure a non-null return value
  //     throw Exception('Failed to load predicted result');
  //   }
  // }
}
