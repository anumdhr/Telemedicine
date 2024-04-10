import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:seventh_sem_project/firebase_options.dart';
import 'package:seventh_sem_project/module/auth/controller/auth-controller.dart';
import 'package:seventh_sem_project/module/auth/controller/register_controller.dart';
import 'package:seventh_sem_project/module/auth/screen/local_database/auth_sqf_lite_database.dart';
import 'package:seventh_sem_project/module/screens/splash_screen.dart';
import 'package:seventh_sem_project/module/screens/user/main_page/main_controller.dart';
import 'package:seventh_sem_project/module/screens/user/pages/heart_disease_prediction/controller.dart';
import 'package:seventh_sem_project/module/screens/user/pages/heart_disease_prediction/sqflite_db/sqflite_database.dart';
import 'package:seventh_sem_project/module/screens/user/pages/profile/profile_controller.dart';
import 'package:seventh_sem_project/services/shared_preferences/shared_pref.dart';
import 'module/routes/custom_page_route_builder.dart';
import 'module/routes/routes.dart';
import 'module/screens/admin/doctor_controller.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  DatabaseService().connectDb();
  LoginDatabaseServices().connectDb();
  await SharedPreferenceDB.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());

    Get.put(HomeController());
    Get.put(RegisterController());
    Get.put(ProfileController());
    Get.put(HDPredictionController());
    Get.put(SharedPreferenceDB());
    Get.put(DoctorController());


    final botToastBuilder = BotToastInit();
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      onGenerateRoute: generateRoute,
      onGenerateInitialRoutes: (pastRoute) {
        return [CustomPageRouteBuilder(widget: const SplashScreen())];
      },

      debugShowCheckedModeBanner: false,

      builder: (context, child) {
        child = botToastBuilder(context,child);
        ScreenUtil.init(
          context,
          designSize: const Size(1920, 1080),
          splitScreenMode: true,
          minTextAdapt: true,
        );
        return Theme(
            data: ThemeData(
              primaryColor: const Color(0xff7be495),
              scaffoldBackgroundColor: const Color(0xffF5f5f5),
              useMaterial3: true,
              fontFamily: "Full Sans LC Book",
            ),
            child: child);
      },
      // builder: (context, child) {
      //   final botToastBuilder = BotToastInit();
      //   BotToastNavigatorObserver();
      //   child = botToastBuilder(context, child);
      //   return child;
      // },
    );
  }
}
