import 'dart:convert';

import 'package:seventh_sem_project/module/auth/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceDB {
  static SharedPreferences? preference;

  static Future<void> init() async {
    preference = await SharedPreferences.getInstance();
  }

  ///username
   Future<void> saveUserName(bool name) async {
    await preference!.setBool('Name', name);
  }

   bool? getUserName() {
    return preference!.getBool('Name');
  }

  Future<void> saveUserModel(NewUserModel userModel) async {
    String userJson = json.encode(userModel.toJson());
    await preference!.setString('userModel', userJson);
  }

  /// Retrieve user model from shared preferences
  NewUserModel? getUserModel() {
    String? userJson = preference!.getString('userModel');
    if (userJson != null) {
      Map<String, dynamic> jsonMap = json.decode(userJson);
      return NewUserModel.fromJson(jsonMap);
    } else {
      return null;
    }
  }


}
