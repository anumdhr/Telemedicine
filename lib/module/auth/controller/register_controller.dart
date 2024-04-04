import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:seventh_sem_project/module/auth/auth_repository/register_repository.dart';
import 'package:seventh_sem_project/module/auth/model/user_model.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:seventh_sem_project/module/utils/route_constant.dart';
import 'package:seventh_sem_project/services/firebase_auth_implementation/firebase_auth.dart';

class RegisterController extends GetxController {
  final hidePassword = BehaviorSubject<bool>.seeded(true);
  final acceptTerm = BehaviorSubject<bool>.seeded(false);
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();

  final roleController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormBuilderState>();


  var validateFirstName = true.obs;
  var validatePassword = true.obs;
  var validateConfirmPassword = true.obs;
  var validateLastName = true.obs;
  var validateEmail = true.obs;
  var validatePhone = true.obs;
  var validateRole = true.obs;

  final userModeList = <NewUserModel>[].obs;
  final newUserModel = NewUserModel().obs;
  final rr = RegisterRepository();
  final FirebaseService auth = FirebaseService();

  void onFirstNameChange({required String name}) {
    newUserModel.value.firstname = name;
  }

  void onLastNameChange({required String name}) {
    newUserModel.value.lastname = name;
  }

  void onPhoneChange({required String phone}) {
    RegExp hexNum = RegExp(r'^\+\d{3}\s*\d{2,3}\s{0,1}\-*\s{0,1}\d{0,8}|^9\d{9}|^[4-5]\d{0,7}');
    if ((hexNum.hasMatch(phone) && phone.length == 10)) {
      // phoneController.text = phone;
      newUserModel.value.phone = phone;
    }
  }

  void onPasswordChange({required String password}) {
    if (password.length > 5) {
      newUserModel.value.password = password;
    }
  }

  void onConfirmPasswordChange({required String password, required String confirmPassword}) {
    if (password == confirmPassword) {
      newUserModel.value.confirmPassword = confirmPassword;
    }
    // if (newUserModel.value.password == "" || newUserModel.value.password == null) {
    //   newUserModel.value.password = "";
    //
    // }
    // if (newUserModel.value.password == password && newUserModel.value.password != "") {
    //   newUserModel.value.confirmPassword = password;
    //
    // } else {
    //   newUserModel.value.confirmPassword = "";
    //
    // }
  }

  void onRoleChange({required String role}) {
    newUserModel.value.role = role;
  }

  void onEmailChange({required String email}) {
    if (email.isNotEmpty) {
      newUserModel.value.email = email;
    }
  }

  void newUser(BuildContext context) async {
    try {
      NewUserModel newUserModel = NewUserModel(
        email: emailController.text.trim(),
        firstname: firstNameController.text.trim(),
        lastname: lastNameController.text.trim(),
        role: roleController.text.trim(),
        phone: phoneController.text.trim(),
        password: confirmPassController.text.trim(),

      );
      User? user = await auth.signUpWithEmailAndPassword(
        emailController.text,
        confirmPassController.text,
        newUserModel,

      );
      if (user != null) {
        BotToast.showText(text: 'Register in successfully.', contentColor: Colors.green);

        Navigator.pushNamed(context, RouteConstant.routeLogin);
      } else {
        print("Not able to sign up");
      }
      // NewUserModel newUser = NewUserModel(
      //   firstname: firstNameController.text.trim(),
      //   lastname: lastNameController.text.trim(),
      //   phone: phoneController.text.trim(),
      //   email: emailController.text.trim(),
      //   password: passwordController.text.trim(),
      //   role: roleController.text.trim(),
      // );
      // final user = await rr.registerUser(newUser);
      // BotToast.showText(text: 'Register in successfully.', contentColor: Colors.green);
      // await Future.delayed(Duration(milliseconds: 500));
      firstNameController.clear();
      lastNameController.clear();
      phoneController.clear();
      emailController.clear();
      passwordController.clear();
      confirmPassController.clear();
      roleController.clear();
    } on DioError catch (e) {
      // cancel();
      BotToast.showText(text: 'Please check your internet connection', contentColor: Colors.red);
    } catch (e) {
      // cancel();
      BotToast.showText(text: '$e', contentColor: Colors.green);
    }
  }

  bool onCheckAllFieldValid() {
    RegExp hexNum = RegExp(r'^\+\d{3}\s*\d{2,3}\s{0,1}\-*\s{0,1}\d{0,8}|^9\d{9}|^[4-5]\d{0,7}');

    if (firstNameController.text == "") {
      newUserModel.value.copyWith(firstname: "");
      validateFirstName.value = false;
    } else {
      validateFirstName.value = true;
    }
    if (lastNameController.text == "") {
      newUserModel.value.copyWith(lastname: "");
      validateLastName.value = false;
    } else {
      validateLastName.value = true;
    }
    if (phoneController.text == "") {
      newUserModel.value.copyWith(phone: "");
      validatePhone.value = false;
    } else if ((hexNum.hasMatch(phoneController.text) && phoneController.text.trim().length == 10)) {
      validatePhone.value = true;
    } else {
      validatePhone.value = false;
    }
    if (passwordController.text == "") {
      newUserModel.value.copyWith(password: "");
      validatePassword.value = false;
    } else {
      validatePassword.value = true;
    }
    if (confirmPassController.text == "") {
      newUserModel.value.copyWith(confirmPassword: "");
      validateConfirmPassword.value = false;
    } else if (confirmPassController.text != passwordController.text) {
      validateConfirmPassword.value = false;
    } else {
      validateConfirmPassword.value = true;
    }
    if (roleController.text == "") {
      newUserModel.value.copyWith(role: "");
      validateRole.value = false;
    } else {
      validateRole.value = true;
    }

    if (emailController.text == "") {
      newUserModel.value.copyWith(email: "");
      validateEmail.value = false;
    } else {
      validateEmail.value = true;
    }

    if (
        // newUserModel.value.name == "" ||
        //     newUserModel.value.name == null ||
        //     newUserModel.value.phone == "" ||
        //     newUserModel.value.phone == null ||
        //     newUserModel.value.password == "" ||
        //     newUserModel.value.password == null ||
        //     newUserModel.value.confirmPassword == "" ||
        //     newUserModel.value.confirmPassword == null ||
        //     confirmPassController.text != passwordController.text ||
        // newUserModel.value.gender == "" ||
        // newUserModel.value.gender == null ||
        // newUserModel.value.address == null ||
        // newUserModel.value.address == ""
        validateFirstName.value == false ||
            validateLastName.value == false ||
            validateEmail.value == false ||
            validatePassword.value == false ||
            validateConfirmPassword.value == false ||
            validateRole.value == false ||
            validatePhone.value == false) {
      return false;
    } else {
      return true;
    }
  }
}
