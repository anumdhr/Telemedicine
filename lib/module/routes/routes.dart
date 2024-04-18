import 'package:flutter/material.dart';
import 'package:seventh_sem_project/module/auth/screen/admin_or_user.dart';
import 'package:seventh_sem_project/module/auth/screen/login_page/create_account_page.dart';
import 'package:seventh_sem_project/module/auth/screen/login_page/login_page.dart';
import 'package:seventh_sem_project/module/screens/user/main_page/main_page.dart';
import 'package:seventh_sem_project/module/screens/user/pages/heart_disease_prediction/heart_disease_prediction.dart';
import '../screens/splash_screen.dart';
import '../utils/route_constant.dart';
import 'custom_page_route_builder.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  if (settings.name == RouteConstant.routeLogin) {
    return CustomPageRouteBuilder(
      widget: LoginPage(),
      settings: settings,
    );
  } else if (settings.name == RouteConstant.routeSplash) {
    return CustomPageRouteBuilder(
      widget: const SplashScreen(),
      settings: settings,
    );
  } else if (settings.name == RouteConstant.routeRegister) {
    return CustomPageRouteBuilder(
      widget: CreateAccountPage(),
      settings: settings,
    );
  } else if (settings.name == RouteConstant.routeHomePage) {
    return CustomPageRouteBuilder(
      widget: const TelemedicineMain(),
      settings: settings,
    );
  } else if (settings.name == RouteConstant.routePrediction) {
    return CustomPageRouteBuilder(
      widget: const HeartDiseasePredictionPage(),
      settings: settings,
    );
  } else {
    return CustomPageRouteBuilder(
      widget: const Text("Route Not Found"),
      settings: settings,
    );
  }
}
