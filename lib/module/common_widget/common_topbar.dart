import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:seventh_sem_project/module/auth/controller/register_controller.dart';
import 'package:seventh_sem_project/module/auth/model/user_model.dart';
import 'package:seventh_sem_project/module/utils/const.dart';

class TopBar extends StatelessWidget {
   const TopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final rc = Get.find<RegisterController>();
    return Row(
      children: [
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello, ${rc.newUserModel.value.firstname ?? ''}",
              style: customStyle,
            ),
            Text(
              "How are you today ?",
              style: TextStyle(
                fontFamily: "Full Sans LC Medium",
                color: Colors.black,
                fontSize: 14,
              ),
            )
          ],
        ),
        const Spacer(),
        CircleAvatar(radius: 30, child: SvgPicture.asset("assets/images/Notification_icon.svg"))
      ],
    );
  }
}
