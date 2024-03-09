import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seventh_sem_project/module/screens/pages/home_page/widgets/appointment_card.dart';
import 'package:seventh_sem_project/module/common_widget/common_text.dart';
import 'package:seventh_sem_project/module/utils/const.dart';
import 'package:seventh_sem_project/module/utils/customized_sized_box.dart';
import 'package:seventh_sem_project/module/utils/route_constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> specialist = [
    {
      "icon": FontAwesomeIcons.userDoctor,
      "category": "General",
    },
    {
      "icon": FontAwesomeIcons.heartPulse,
      "category": "Cardiology",
    },
    {
      "icon": FontAwesomeIcons.lungs,
      "category": "Respiration",
    },
    {
      "icon": FontAwesomeIcons.hand,
      "category": "Dermatology",
    },
    {
      "icon": FontAwesomeIcons.personPregnant,
      "category": "Gynacology",
    },
    {
      "icon": FontAwesomeIcons.teeth,
      "category": "Dental",
    },
  ];

  void navigateToCategoryPage(String category) {
    switch (category) {
      case "General":
        Navigator.pushNamed(context, RouteConstant.routeHomePage);

        break;
      case "Cardiology":
        Navigator.pushNamed(context, RouteConstant.routePrediction);

        break;
      case "Respiration":
        Navigator.pushNamed(context, RouteConstant.routeHomePage);

        break;
      case "Dermatology":
        Navigator.pushNamed(context, RouteConstant.routeHomePage);

        break;
      case "Gynacology":
        Navigator.pushNamed(context, RouteConstant.routeHomePage);

        break;
      case "Dental":
        Navigator.pushNamed(context, RouteConstant.routeHomePage);

        break;

      default:
        break;
    }
  }

  bool isToggle = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello, Anu",
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
              ),
              sboxH20,
              const CustomText(
                "Category",
                style: customStyle,
              ),
              sboxH10,
              SizedBox(
                height: height * 0.08,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(specialist.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        navigateToCategoryPage(specialist[index]["category"]);
                      },
                      child: Card(
                        color: primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          child: Row(
                            children: [
                              FaIcon(
                                specialist[index]["icon"],
                                color: Colors.white,
                              ),
                              sboxW2,
                              CustomText(
                                specialist[index]["category"],
                                style: const TextStyle(
                                  fontFamily: "Full Sans LC Medium",
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              sboxH20,
              const CustomText(
                "Appointment Today",
                style: customStyle,
              ),
              AppointmentCard(),
              sboxH20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    "Popular Doctors",
                    style: customStyle,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isToggle = !isToggle!;
                      });
                    },
                    child: CustomText(
                      isToggle == false ? "View More" : "View Less",
                    ),
                  ),
                ],
              ),
              sboxH20,

              ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: isToggle ? 20 : 2,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    // height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.33,
                          child: Image.asset("assets/images/doctor_photo.jpg"),
                        ),
                        sboxW10,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomText(
                              "Dr Aruna",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const CustomText(
                              "Cardiologist",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            sboxH20,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                const Icon(
                                  Icons.star_border,
                                  color: Colors.yellow,
                                  size: 16,
                                ),
                                sboxW15,
                                const Text('4.5'),
                                sboxW15,
                                const Text('Reviews'),
                                const Text('(20)'),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ), // ListView.builder(
            ],
          ),
        ),
      ),
    );
  }
}
