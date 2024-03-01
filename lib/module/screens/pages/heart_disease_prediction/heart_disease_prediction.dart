import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seventh_sem_project/module/utils/custom_text_style.dart';
import 'package:seventh_sem_project/module/utils/customized_sized_box.dart';
import 'package:seventh_sem_project/module/utils/validator.dart';

import 'controller.dart';

class HeartDiseasePredictionPage extends StatefulWidget {
  const HeartDiseasePredictionPage({Key? key}) : super(key: key);

  @override
  _HeartInputState createState() => _HeartInputState();
}

class _HeartInputState extends State<HeartDiseasePredictionPage> {
  final dc = Get.find<HDPredictionController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.all(5),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      "Enter Following Parameters",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: dc.ageController,
                      validator: (value) => Validator().ageValidation(value),
                      decoration: InputDecoration(
                        labelText: "Age",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: dc.sexController,
                      validator: (value) => Validator().emptyValidator(value),
                      decoration: InputDecoration(
                        labelText: "Sex - Enter 1 for Male, 0 for Female",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: dc.chestController,
                      validator: (value) => Validator().emptyValidator(value),
                      decoration: InputDecoration(
                        labelText: "Chest Pain",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: dc.bpController,
                      validator: (value) => Validator().emptyValidator(value),
                      decoration: InputDecoration(
                        labelText: "Resting blood pressure",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          // trestbps = int.parse(value);
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: dc.cholestrolController,
                      validator: (value) => Validator().emptyValidator(value),
                      decoration: InputDecoration(
                        labelText: "Cholestoral",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          // chol = int.parse(value);
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: dc.sugarController,
                      decoration: InputDecoration(
                        labelText: "Fasting blood sugar",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          // fbs = int.parse(value);
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: dc.heartRateController,
                      validator: (value) => Validator().emptyValidator(value),
                      decoration: InputDecoration(
                        labelText: "Maximum Heart Rate",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          // thalach = int.parse(value);
                        });
                      },
                    ),
                  ),
                  sboxH20,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Color(0xffD8D9D9),
                    ),
                    onPressed: () {
                      _formKey.currentState!.save();
                      if (_formKey.currentState!.validate()) {
                        dc.addResult();
                      }
                    },
                    child: Text(
                      "Result".toUpperCase(),
                      style: CustomStyle.textFullSansLcMedium.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

