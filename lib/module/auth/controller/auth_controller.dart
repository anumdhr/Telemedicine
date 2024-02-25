import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class AuthController extends GetxController{
  final hidePassword = BehaviorSubject<bool>.seeded(true);
  final acceptTerm = BehaviorSubject<bool>.seeded(false);
  final genderController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
}