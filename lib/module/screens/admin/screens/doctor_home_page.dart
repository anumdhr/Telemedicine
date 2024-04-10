import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:seventh_sem_project/module/screens/admin/doctor_controller.dart';
import 'package:seventh_sem_project/module/screens/admin/screens/doctor_details.dart';

class AdminHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
    
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Doctor's Name and Image
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/doctor_photo.jpg"), // Assuming doctorImageUrl is the URL of the doctor's image
                    radius: 30,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Hello, Doctor', // Assuming doctorName is the name of the doctor
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _navigateToAddOrUpdateBlog(context, isUpdate: false);
                },
                child: Text('Add Details'),
              ),
              SizedBox(height: 16.0),
              // ElevatedButton(
              //   onPressed: () {
              //     _navigateToAddOrUpdateBlog(context, isUpdate: true);
              //   },
              //   child: Text('Update Blog'),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToAddOrUpdateBlog(BuildContext context, {required bool isUpdate}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DoctorDetails(isUpdate: isUpdate),
      ),
    );
  }
}


