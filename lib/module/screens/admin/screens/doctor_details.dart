import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seventh_sem_project/module/screens/admin/doctor_controller.dart';

class DoctorDetails extends StatefulWidget {
  final bool? isUpdate;

  const DoctorDetails({Key? key, this.isUpdate}) : super(key: key);

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  final adc = Get.find<DoctorController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Update doctor profile".toUpperCase()),
                  InkWell(
                    onTap: () {
                      adc.onPhotoUploaded();
                    },
                    child: adc.platformFile == null
                        ? Container(
                            height: 150,
                            width: 150,
                            color: Colors.grey[200],
                            child: Icon(Icons.camera_alt, size: 50, color: Colors.grey),
                          )
                        : Image.file(
                            File(adc.platformFile!.path!),
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: adc.specializationController,
                    decoration: InputDecoration(
                      labelText: 'Specialization',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    controller: adc.degreeController,
                    decoration: InputDecoration(
                      labelText: 'Degree',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    controller: adc.visitingTimeController,
                    decoration: InputDecoration(
                      labelText: 'Visiting Time',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    controller: adc.workingHospitalController,
                    decoration: InputDecoration(
                      labelText: 'Working Hospital',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      _formKey.currentState!.save();
                      if (_formKey.currentState!.validate()) {
                        adc.uploadToFirebaseStorage();
                      }
                      Navigator.pop(context);
                    },
                    child: Text('Add'),
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
