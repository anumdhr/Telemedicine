import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:seventh_sem_project/module/auth/controller/auth-controller.dart';
import 'package:seventh_sem_project/module/common_widget/common_text.dart';
import 'package:seventh_sem_project/module/common_widget/info_field.dart';
import 'package:seventh_sem_project/module/screens/admin/doctor_controller.dart';
import 'package:seventh_sem_project/module/screens/user/pages/profile/profile_controller.dart';
import 'package:seventh_sem_project/module/utils/const.dart';
import 'package:seventh_sem_project/module/utils/custom_text_style.dart';
import 'package:seventh_sem_project/module/utils/customized_sized_box.dart';
import 'package:seventh_sem_project/module/utils/route_constant.dart';
import 'package:seventh_sem_project/services/shared_preferences/shared_pref.dart'; // Import the dart:io library

class DoctorProfilePage extends StatefulWidget {
  const DoctorProfilePage({super.key});

  @override
  State<DoctorProfilePage> createState() => _DoctorProfilePageState();
}

// Your existing code...

class _DoctorProfilePageState extends State<DoctorProfilePage> with TickerProviderStateMixin {
  final pc = Get.find<ProfileController>();
  final ac = Get.find<AuthController>();
  final dc = Get.find<DoctorController>();
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: Get.height,
        width: Get.width,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                  CustomText(
                    "Profile".toUpperCase(),
                    style: customStyle1,
                  ),
                  Container(),
                ],
              ),
              sboxH12,
              Center(
                child: GestureDetector(
                  onTap: () {
                    pc.onPhotoUploaded();
                  },
                  child: Obx(
                    () {
                      return pc.imageUrl.toString() == ''
                          ? const CircleAvatar(
                              backgroundColor: primaryColor,
                              radius: 40,
                              backgroundImage: AssetImage("assets/images/doctor_photo.jpg"),
                            )
                          : SizedBox(
                              height: 80,
                              width: 80,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Image.file(
                                  File(pc.imageUrl.value), // Get the path from XFile
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                    },
                  ),
                ),
              ),
              sboxH12,
              Center(
                child: CustomText(
                  "${ac.updatedModel.firstName} ${ac.updatedModel.lastName}",
                  style: CustomStyle.textFullSansLcBook.copyWith(
                    fontSize: 20,
                  ),
                ),
              ),
              sboxH12,
              TabBar(controller: _tabController, tabs: [
                CustomText(
                  " My Details".toUpperCase(),
                  style: CustomStyle.textFullSansLcBook.copyWith(
                    fontSize: 15,
                  ),
                ),
                CustomText(
                  " Professional Details".toUpperCase(),
                  style: CustomStyle.textFullSansLcBook.copyWith(
                    fontSize: 15,
                  ),
                ),
              ]),
              SizedBox(
                height: Get.height * 0.5,
                child: TabBarView(controller: _tabController, children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // shrinkWrap: true,
                    children: [
                      InfoField(
                        controller: pc.nameController,
                        title: "Name",
                        hintText: "${ac.updatedModel.firstName} ${ac.updatedModel.lastName}",
                      ),
                      InfoField(
                        readOnly: true,
                        controller: pc.mobileController,
                        title: "Registered Mobile",
                        hintText: "${ac.updatedModel.phone}",
                      ),

                      InfoField(
                        controller: pc.addressController,
                        title: "Email",
                        hintText: "${ac.updatedModel.email}",
                      ),
                      InfoField(
                        controller: pc.genderController,
                        title: "Role",
                        hintText: "${ac.updatedModel.role}",
                      ),
                      sboxH35,
                      // const Spacer(),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 9),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                margin: const EdgeInsets.symmetric(horizontal: 12),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 2),
                                    child: Text(
                                      "Edit",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "Full Sans LC Book",
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                FirebaseAuth.instance.signOut();
                                final pref = Get.find<SharedPreferenceDB>();
                                pref.saveUserName(false);

                                Navigator.pushReplacementNamed(context, RouteConstant.routeLogin);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 9),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                margin: const EdgeInsets.symmetric(horizontal: 12),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 2),
                                    child: Text(
                                      "Logout",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "Full Sans LC Book",
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      sboxH20,
                    ],
                  ),
                  //professional details
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // shrinkWrap: true,
                    children: [
                      InfoField(
                        controller: pc.nameController,
                        title: "Specialization",
                        hintText: "${ac.updatedModel.firstName} ${ac.updatedModel.lastName}",
                      ),
                      InfoField(
                        readOnly: true,
                        controller: pc.mobileController,
                        title: "Degree",
                        hintText: "${ac.updatedModel.phone}",
                      ),

                      InfoField(
                        controller: pc.addressController,
                        title: "Visiting Time",
                        hintText: "${ac.updatedModel.email}",
                      ),
                      InfoField(
                        controller: pc.genderController,
                        title: "Working Hospital",
                        hintText: "${ac.updatedModel.role}",
                      ),
                      sboxH35,
                      // const Spacer(),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 9),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                margin: const EdgeInsets.symmetric(horizontal: 12),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 2),
                                    child: Text(
                                      "Edit",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "Full Sans LC Book",
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                FirebaseAuth.instance.signOut();
                                final pref = Get.find<SharedPreferenceDB>();
                                pref.saveUserName(false);

                                Navigator.pushReplacementNamed(context, RouteConstant.routeLogin);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 9),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                margin: const EdgeInsets.symmetric(horizontal: 12),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 2),
                                    child: Text(
                                      "Logout",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "Full Sans LC Book",
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      sboxH20,
                    ],
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
