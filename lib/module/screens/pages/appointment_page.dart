import 'package:flutter/material.dart';
import 'package:seventh_sem_project/module/common_widget/common_text.dart';
import 'package:seventh_sem_project/module/utils/const.dart';
import 'package:seventh_sem_project/module/utils/custom_text_style.dart';
import 'package:seventh_sem_project/module/utils/customized_sized_box.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final TabController _tabController = TabController(length: 3, vsync: this);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CustomText(
                "Appointment Schedule",
                style: customStyle1,
              ),
            ),
            sboxH20,
            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: TabBar(controller: _tabController, tabs: [
                Container(
                  // height: 300,

                  // decoration: BoxDecoration(
                  //     color: switchListenState == 0 ? const Color(0xffC84C20) : const Color(0xffffffff), borderRadius: BorderRadius.circular(20),
                  // ),
                  width: double.infinity,
                  child: Tab(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        "Pending",
                        style: CustomStyle.textFullSansLcBook.copyWith(
                          fontSize: 14,
                          // color: switchListenState == 0 ? Colors.white : const Color(0xffC84C20),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  // height: 300,

                  // decoration: BoxDecoration(
                  //     color: switchListenState == 0 ? const Color(0xffC84C20) : const Color(0xffffffff), borderRadius: BorderRadius.circular(20),
                  // ),
                  width: double.infinity,
                  child: Tab(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        "Accepted",
                        style: CustomStyle.textFullSansLcBook.copyWith(
                          fontSize: 14,
                          // color: switchListenState == 0 ? Colors.white : const Color(0xffC84C20),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  // height: 300,

                  // decoration: BoxDecoration(
                  //     color: switchListenState == 0 ? const Color(0xffC84C20) : const Color(0xffffffff), borderRadius: BorderRadius.circular(20),
                  // ),
                  width: double.infinity,
                  child: Tab(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        "Completed",
                        style: CustomStyle.textFullSansLcBook.copyWith(
                          fontSize: 14,
                          // color: switchListenState == 0 ? Colors.white : const Color(0xffC84C20),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            Expanded(
              child: Container(
                child: TabBarView(
                    controller: _tabController,
                    children: [
                  Text("Hello",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  Text("Hello"),
                  Text("Hello"),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
