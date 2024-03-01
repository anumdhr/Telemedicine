import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seventh_sem_project/module/common_widget/screen_witgh_background_image.dart';
import 'package:seventh_sem_project/module/utils/route_constant.dart';

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
    super.initState();
    _navigateToLogin();
  }

  void _navigateToLogin() {
    Timer(
      Duration(seconds: 5),
      () {
        Navigator.pushNamed(context, RouteConstant.routeLogin);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWithBackgroundImage(
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
