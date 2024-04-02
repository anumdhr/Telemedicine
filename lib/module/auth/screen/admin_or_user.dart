import 'package:flutter/material.dart';
import 'package:seventh_sem_project/module/utils/const.dart';
import 'package:seventh_sem_project/module/utils/custom_text_style.dart';
import 'package:seventh_sem_project/module/utils/route_constant.dart';

class AdminOrUserLogin extends StatelessWidget {
  const AdminOrUserLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, RouteConstant.routeLogin);

              },
              child: Text("Login as Admin",
                style: CustomStyle.textFullSansLcBook.copyWith(
                  color: primaryColor,
                  fontSize: 14,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, RouteConstant.routeLogin);

              },
              child: Text("Login as User",
                style: CustomStyle.textFullSansLcBook.copyWith(
                  color: primaryColor,
                  fontSize: 14,
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
