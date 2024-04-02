import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:seventh_sem_project/module/screens/user/main_page/main_controller.dart';
import 'package:seventh_sem_project/module/screens/user/pages/blog.dart';
import 'package:seventh_sem_project/module/screens/user/pages/home_page/home_page.dart';
import 'package:seventh_sem_project/module/screens/user/pages/prediction_result/prediction_result.dart';
import 'package:seventh_sem_project/module/screens/user/pages/profile/profile.dart';

class TelemedicineMain extends StatefulWidget {
  const TelemedicineMain({super.key});

  @override
  State<TelemedicineMain> createState() => _TelemedicineMainState();
}

class _TelemedicineMainState extends State<TelemedicineMain> {
  List<Widget> pages = [
    const HomePage(),
    const BlogPage(),
    const PredictionResult(),
    ProfilePage(),
  ];

  final hc = Get.find<HomeController>();

  @override
  void initState() {
    hc.index.value = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() {
          return pages[hc.index.value];
        }),
        bottomNavigationBar: Container(
          color: const Color(0xff7be495),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            child: Obx(() {
              return GNav(
                  backgroundColor: const Color(0xff7be495),
                  color: Colors.white,
                  activeColor: Colors.white,
                  gap: 8,
                  padding: const EdgeInsets.all(16),
                  tabBackgroundColor: Colors.deepPurple.withOpacity(0.50),
                  onTabChange: (value) {
                    hc.index.value = value;
                  },
                  selectedIndex: hc.index.value,
                  tabs: const [
                    GButton(icon: Icons.home, text: "Home",),
                    GButton(
                      icon: FontAwesomeIcons.blog,
                      text: "Blog",
                    ),
                    GButton(
                      icon: FontAwesomeIcons.userDoctor,
                      text: "Prediction",
                    ),
                    GButton(
                      icon: FontAwesomeIcons.user,
                      text: "Profile",
                    ),
                  ]);
            }),
          ),
        ));
  }
}
