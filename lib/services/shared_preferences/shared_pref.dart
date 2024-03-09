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


}
