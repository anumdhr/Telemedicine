import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:seventh_sem_project/module/auth/controller/auth_controller.dart';
import 'package:seventh_sem_project/module/screens/main_page/main_controller.dart';
import 'package:seventh_sem_project/module/screens/pages/profile/profile_controller.dart';
import 'package:seventh_sem_project/module/screens/splash_screen.dart';

import 'module/routes/custom_page_route_builder.dart';
import 'module/routes/routes.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    Get.put(AuthController());
    Get.put(ProfileController());
    return MaterialApp(
      navigatorKey: navigatorKey,
      onGenerateRoute: generateRoute,
      onGenerateInitialRoutes: (pastRoute) {
        return [CustomPageRouteBuilder(widget:  SplashScreen())];
      },

      debugShowCheckedModeBanner: false,

      builder: (context, child) {
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
            child: child!);
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
