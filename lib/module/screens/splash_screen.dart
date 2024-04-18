import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:seventh_sem_project/module/common_widget/screen_witgh_background_image.dart';
import 'package:seventh_sem_project/module/utils/route_constant.dart';
import 'package:seventh_sem_project/services/shared_preferences/shared_pref.dart';

import '../common_widget/common_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    _navigateToLogin();
    super.initState();
  }

  void _navigateToLogin() {
    final pref = Get.find<SharedPreferenceDB>();
    var isLoggedIn = pref.getUserName();

    Timer(
      Duration(seconds: 5),
      () {
        // Navigator.pushNamed(context, RouteConstant.routeLogin);

        if (isLoggedIn != null) {
          if (isLoggedIn) {
            Navigator.pushReplacementNamed(context, RouteConstant.routeLogin);
          } else {
            Navigator.pushReplacementNamed(context, RouteConstant.routeLogin);
          }
        } else {
          Navigator.pushReplacementNamed(context, RouteConstant.routeLogin);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWithScaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/medical_icon.svg',
                color: Colors.white,
              ),
              CustomText(
                "Hello There!".toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
