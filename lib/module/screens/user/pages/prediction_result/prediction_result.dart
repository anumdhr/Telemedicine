import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seventh_sem_project/module/common_widget/common_text.dart';
import 'package:seventh_sem_project/module/screens/user/pages/heart_disease_prediction/controller.dart';
import 'package:seventh_sem_project/module/utils/custom_text_style.dart';
import 'package:seventh_sem_project/module/utils/customized_sized_box.dart';

class PredictionResult extends StatefulWidget {
  const PredictionResult({super.key});

  @override
  State<PredictionResult> createState() => _PredictionResultState();
}

class _PredictionResultState extends State<PredictionResult> {
  final dc = Get.find<HDPredictionController>();

  @override
  void initState() {
    dc.readNote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(dc.heartDiseaseList.isEmpty){
     return Center(child: Text("No list to display."));
    }else{
      return SafeArea(
          child: SingleChildScrollView(
            child: Obx(
                    () {
                  return Column(
                    children: [
                      Text(
                        "Results".toUpperCase(),
                        style: CustomStyle.textFullSansLcBook.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      sboxH10,
                      ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        // itemCount: 10,
                        itemCount: dc.heartDiseaseList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            child: Image.asset(
                                              "assets/images/heart_pulse1.jpg",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        sboxW8,
                                        Expanded(
                                          flex: 4,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              CustomText("Age:${dc.heartDiseaseList[index].age}"),
                                              sboxH5,
                                              CustomText("Heart Rate:${dc.heartDiseaseList[index].heartRate}"),
                                              sboxH5,
                                              CustomText("Sugar:${dc.heartDiseaseList[index].sugar}"),
                                              sboxH5,
                                            ],
                                          ),
                                        ),
                                        sboxW8,
                                        Expanded(
                                          flex: 4,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              CustomText(
                                                "Cholestrol:${dc.heartDiseaseList[index].cholestrol}",
                                                style: TextStyle(
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                              sboxH5,
                                              CustomText(
                                                "Blood Pressure:${dc.heartDiseaseList[index].bloodPressure}",
                                                style: TextStyle(
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                              sboxH5,
                                              CustomText("Chest:${dc.heartDiseaseList[index].chest}"),
                                              sboxH5,
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    CustomText(
                                      "Date:${dc.heartDiseaseList[index].dateTime}",
                                      style: CustomStyle.textFullSansLcBook.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                      ),
                                    ),
                                    sboxH20,
                                    CustomText(
                                      "Results    0 : Absense of Heart Disease",
                                      style: CustomStyle.textFullSansLcBook.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ).paddingSymmetric(horizontal: 5),
                              sboxH20,
                            ],
                          );
                        },
                      )
                    ],
                  );
                }
            ),
          ));

    }
  }
}
