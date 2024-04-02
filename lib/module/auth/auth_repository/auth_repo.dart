import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:seventh_sem_project/constant/api_url.dart';
import 'package:seventh_sem_project/module/auth/model/login_model.dart';
import 'package:seventh_sem_project/module/auth/model/user_model.dart';
import 'package:seventh_sem_project/services/base_repo_services.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  Future<NewUserModel> logindkas(LoginModel loginModel) async {
    final response = await apiInstance.postData(url: ApiUrl.login, data: loginModel.toJson());
    return NewUserModel.fromJson(response);
  }

  Future<NewUserModel> login(LoginModel userModel) async {
    Logger().d("2");
    final Dio dio = Dio();
    String url = '${ApiUrl.baseUrl}${ApiUrl.login}';
    Uri uri = Uri.parse(url);
    // final response =await http.post(
    //   uri,
    //   body: json.encode(newUserModel.toJson()),
    // );
    final response = await dio.post(
      url,
      data: userModel.toJson(),
    );
    Logger().d('response is ${response.data}');
    Logger().d('response is ${response.statusCode}');
    final newUser = NewUserModel.fromJson(response.data);
    Logger().d('User logged in: ${newUser.email}');
    Logger().d('User logged in: ${newUser.role}');
    return newUser;
  }
}
