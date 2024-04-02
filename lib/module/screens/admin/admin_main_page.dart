import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:seventh_sem_project/module/screens/admin/admin_controller.dart';
import 'package:seventh_sem_project/module/screens/admin/admin_home_page.dart';

class AdminMain extends StatelessWidget {
  const AdminMain({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
       AdminHomePage(),
       AdminHomePage(),
    ];
    final ac = Get.find<AdminController>();
    return Scaffold(
        body: Obx(() {
          return pages[ac.index.value];
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
                    ac.index.value = value;
                  },
                  selectedIndex: ac.index.value,
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
