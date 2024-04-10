import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:seventh_sem_project/module/screens/admin/doctor_controller.dart';
import 'package:seventh_sem_project/module/screens/admin/screens/doctor_home_page.dart';

import 'screens/doctor_profile_page.dart';

class AdminMain extends StatefulWidget {
  const AdminMain({super.key});

  @override
  State<AdminMain> createState() => _AdminMainState();
}


class _AdminMainState extends State<AdminMain> {
  List<Widget> pages = [
    AdminHomePage(),
    DoctorProfilePage(),
  ];
  final dc = Get.find<DoctorController>();
  @override
  void initState() {

    dc.index.value = 0;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Obx(() {
          return pages[dc.index.value];
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
                    dc.index.value = value;
                  },
                  selectedIndex: dc.index.value,
                  tabs: const [
                    GButton(icon: Icons.home, text: "Home"),
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
