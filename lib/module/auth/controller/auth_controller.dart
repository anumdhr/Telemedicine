import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';
import 'package:seventh_sem_project/module/auth/model/user_model.dart';

class AuthController extends GetxController {
  final hidePassword = BehaviorSubject<bool>.seeded(true);
  final acceptTerm = BehaviorSubject<bool>.seeded(false);
  final genderController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormBuilderState>();

  var validateName = true.obs;
  var validatePassword = true.obs;
  var validateConfirmPassword = true.obs;
  var validateAddress = true.obs;
  var validatePhone = true.obs;
  var validateGender = true.obs;

  final userModeList = <NewUserModel>[].obs;
  final newUserModel = NewUserModel().obs;

  void onNameChange({required String name}) {
    newUserModel.value.name = name;
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

  void onGenderChange({required String gender}) {
    newUserModel.value.gender = gender;
  }

  void onAddressChange({required String address}) {
    if (address.isNotEmpty) {
      newUserModel.value.address = address;
    }
  }

  void newUser() {
    NewUserModel newUser = NewUserModel(
      name: nameController.text.trim(),
      gender: genderController.text.trim(),
      phone: phoneController.text.trim(),
      address: addressController.text.trim(),
      password: passwordController.text.trim(),
      confirmPassword: confirmPassController.text.trim(),
    );
  }

  bool onCheckAllFieldValid() {
    RegExp hexNum = RegExp(r'^\+\d{3}\s*\d{2,3}\s{0,1}\-*\s{0,1}\d{0,8}|^9\d{9}|^[4-5]\d{0,7}');

    if (nameController.text == "") {
      newUserModel.value.copyWith(name: "");
      validateName.value = false;
    } else {
      validateName.value = true;
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
    if (genderController.text == "") {
      newUserModel.value.copyWith(gender: "");
      validateGender.value = false;
    } else {
      validateGender.value = true;
    }

    if (addressController.text == "") {
      newUserModel.value.copyWith(address: "");
      validateAddress.value = false;
    } else {
      validateAddress.value = true;
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
        validateName.value == false ||
            validateAddress.value == false ||
            validatePassword.value == false ||
            validateConfirmPassword.value == false ||
            validateGender.value == false ||
            validatePhone.value == false) {
      return false;
    } else {
      return true;
    }
  }
}
