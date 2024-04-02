import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seventh_sem_project/module/common_widget/common_text.dart';
import 'package:seventh_sem_project/module/screens/user/main_page/main_controller.dart';
import 'package:seventh_sem_project/module/utils/customized_sized_box.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  final hc = Get.find<HomeController>();
  late List<bool> isMaxLine;

  // var isMaxLine = false;

  @override
  void initState() {
    isMaxLine = List.generate(5, (index) => false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      hc.index.value = 0;
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                  sboxW15,
                  CustomText(
                    "Blog".toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              sboxH20,
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    // height: 10,
                    // width: 10,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                          child: Image.asset(
                            "assets/images/doctor_photo.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        sboxH10,
                        CustomText(
                          "Blog1".toUpperCase(),
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        sboxH10,
                        CustomText(
                          "Eyes Protection".toUpperCase(),
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        sboxH10,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            maxLines: isMaxLine[index] == true ? 2 : null,
                            textAlign: TextAlign.justify,
                            "A paragraph is a series of sentences that are organized and coherent, and are all related to a single topic. Almost every piece of writing you do that is longer than a few sentences should be organized into paragraphs. This is because paragraphs show a reader where the subdivisions of an essay begin and end, and thus help the reader see the organization of the essay and grasp its main points.Paragraphs can contain many different kinds of information. A paragraph could contain a series of brief examples or a single long illustration of a general point. It might describe a place, character, or process; narrate a series of events; compare or contrast two or more things; classify items into categories; or describe causes and effects. Regardless of the kind of information they contain, all paragraphs share certain characteristics. One of the most important of these is a topic sentence.",
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isMaxLine[index] = !isMaxLine[index];
                                  });
                                },
                                child: Text(
                                  isMaxLine[index] == false ? "View Less" : "View More",
                                  style: TextStyle(
                                    fontFamily: "Full-Sans-LC-Bold-Italic",
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => sboxH15,
                itemCount: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
