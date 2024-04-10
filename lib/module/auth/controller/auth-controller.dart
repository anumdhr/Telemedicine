import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:seventh_sem_project/module/auth/auth_repository/auth_repo.dart';
import 'package:seventh_sem_project/module/auth/screen/local_database/auth_sqf_lite_database.dart';
import 'package:seventh_sem_project/module/auth/screen/local_database/models.dart';
import 'package:seventh_sem_project/module/screens/admin/doctor_main_page.dart';
import 'package:seventh_sem_project/module/screens/user/main_page/main_page.dart';
import 'package:seventh_sem_project/services/firebase_auth_implementation/firebase_auth.dart';
import 'package:seventh_sem_project/services/shared_preferences/shared_pref.dart';

class AuthController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final LoginDatabaseServices loginDatabaseServices = LoginDatabaseServices();

  final ar = AuthRepository();
  late var updatedModel = LoginDatabaseModel();
  final FirebaseService auth = FirebaseService();
  late String uid;
  var isToggle = false.obs;

  void onPressedLogin(GlobalKey<FormState> formKey) async {
    formKey.currentState!.save();
    if (formKey.currentState!.validate()) {
      Get.dialog(
        Container(
          color: Colors.black.withOpacity(0.4),
          child: const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          ),
        ),
      );
      try {
        User? user = await auth.signInWithEmailAndPassword(emailController.text, passwordController.text);
        if (user != null) {
          uid = user.uid;
          DocumentSnapshot userSnapshot = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
          Map<String, dynamic>? userData = userSnapshot.data() as Map<String, dynamic>?;
          LoginDatabaseModel userModel = LoginDatabaseModel(
            firstName: userData?['firstname'],
            lastName: userData?['lastname'],
            email: userData?['email'],
            role: userData?['role'],
            phone: userData?['phone'],
          );
          Logger().d(uid);

          updatedModel = userModel;
          loginDatabaseServices.create(updatedModel);
          String? role = userData?['role'];
          Logger().d(role);
          Get.close(1);
          if (role == 'Doctor') {
            Get.offAll(() => AdminMain());
          } else {
            Get.offAll(() => const TelemedicineMain());
          } // Close the progress indicator
          // Get.offAll(() => const TelemedicineMain()); // Navigate to the HeartDiseasePredictionPage
          Get.snackbar(
            'Login Successful',
            'Welcome!',
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        } else {
          Get.close(1); // Close the progress indicator
          Get.snackbar(
            'Authentication Failed',
            'Please use the correct username and password.',
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }

        final pref = Get.find<SharedPreferenceDB>();
        pref.saveUserName(true);
      } catch (e) {
        Get.close(1); // Close the progress indicator
        Get.snackbar(
          'Error',
          'An error occurred during login. Please try again later.',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        Logger().e("Error: $e");
      }
    }
  }
}
