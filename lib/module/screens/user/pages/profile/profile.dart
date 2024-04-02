import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seventh_sem_project/module/common_widget/common_text.dart';
import 'package:seventh_sem_project/module/common_widget/info_field.dart';
import 'package:seventh_sem_project/module/screens/user/pages/profile/profile_controller.dart';
import 'package:seventh_sem_project/module/utils/const.dart';
import 'package:seventh_sem_project/module/utils/custom_text_style.dart';
import 'package:seventh_sem_project/module/utils/customized_sized_box.dart';
import 'package:seventh_sem_project/module/utils/route_constant.dart';
import 'package:seventh_sem_project/services/shared_preferences/shared_pref.dart'; // Import the dart:io library

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

// Your existing code...

class _ProfilePageState extends State<ProfilePage> {
  final pc = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Icon(Icons.arrow_back_ios),
                ),
                CustomText(
                  "Profile".toUpperCase(),
                  style: customStyle1,
                ),
                GestureDetector(
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                      final pref = Get.find<SharedPreferenceDB>();
                      pref.saveUserName(false);



                      Navigator.pushReplacementNamed(context, RouteConstant.routeLogin);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.logout),
                        CustomText(
                          "Logout",
                          style: CustomStyle.textFullSansLcBook.copyWith(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ],
                    ))
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
                        ? CircleAvatar(
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
                "Anu Manandhar",
                style: CustomStyle.textFullSansLcBook.copyWith(
                  fontSize: 20,
                ),
              ),
            ),
            sboxH12,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  " My Details".toUpperCase(),
                  style: CustomStyle.textFullSansLcBook.copyWith(
                    fontSize: 15,
                  ),
                ),
                sboxH12,
                Container(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // shrinkWrap: true,
                      children: [
                        InfoField(
                          controller: pc.nameController,
                          title: "Name",
                          hintText: "Anu Manandhar",
                        ),
                        InfoField(
                          readOnly: true,
                          controller: pc.mobileController,
                          title: "Registered Mobile",
                          hintText: "9808217706",
                        ),

                        InfoField(
                          controller: pc.addressController,
                          title: "Email",
                          hintText: "anumdr3@gmail.com",
                        ),
                        InfoField(
                          controller: pc.genderController,
                          title: "Role",
                          hintText: "User",
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
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 2),
                                      child: Text(
                                        "Edit",
                                        style: const TextStyle(
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
                                        "Exit",
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
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
