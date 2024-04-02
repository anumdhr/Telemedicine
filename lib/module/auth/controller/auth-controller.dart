import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:seventh_sem_project/module/auth/auth_repository/auth_repo.dart';
import 'package:seventh_sem_project/module/auth/model/login_model.dart';
import 'package:seventh_sem_project/module/auth/model/user_model.dart';
import 'package:seventh_sem_project/module/screens/admin/admin_home_page.dart';
import 'package:seventh_sem_project/module/screens/user/main_page/main_page.dart';
import 'package:seventh_sem_project/module/screens/user/pages/heart_disease_prediction/heart_disease_prediction.dart';
import 'package:seventh_sem_project/module/screens/user/pages/home_page/home_page.dart';
import 'package:seventh_sem_project/module/screens/user/pages/prediction_result/prediction_result.dart';
import 'package:seventh_sem_project/module/utils/route_constant.dart';
import 'package:seventh_sem_project/services/firebase_auth_implementation/firebase_auth.dart';
import 'package:seventh_sem_project/services/shared_preferences/shared_pref.dart';

class AuthController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController roleController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final ar = AuthRepository();
  final FirebaseService auth = FirebaseService();

  void onPressedLogin(BuildContext ctx) async {
    if (kDebugMode) {
      // emailController.text = 'soojho22@gmail.com';
      // passwordController.text = 'Anuumdhr12';
    }
    formKey.currentState!.save();
    if (formKey.currentState!.validate()) {
      Get.dialog(Container(
        color: Colors.black.withOpacity(0.4),
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.red,
          ),
        ),
      ));
      try {
        User? user = await auth.signInWithEmailAndPassword(emailController.text, passwordController.text);
        Logger().d(user == null);
        if (user != null) {
          Logger().d("fkdjakf");
          Get.close(1);
          Navigator.push(ctx,MaterialPageRoute(builder: (context) => HeartDiseasePredictionPage(),));
          // Navigator.pushNamed(context, RouteConstant.routeHomePage);
          // Get.to(() => const HeartDiseasePredictionPage());
          Get.snackbar(
            '11111',
            'Please .',
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
          Logger().d("fkdjakf");

        } else {
          Get.snackbar(
            'Authentication Failed',
            'Please use the correct username and password.',
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }

        // emailController.clear();
        // passwordController.clear();

        final pref = Get.find<SharedPreferenceDB>();
        pref.saveUserName(true);
      } catch (e) {
        Logger().e("Error: $e");
        Get.snackbar(
          'Error',
          'An error occurred during login. Please try again later.',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } finally {
        Get.close(1); // Close the progress indicator
      }
    }
  }
}
