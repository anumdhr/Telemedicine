import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seventh_sem_project/module/screens/admin/screens/doctor_details.dart';
import 'package:seventh_sem_project/module/screens/controller/blog_controller.dart';

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
              const Row(
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
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _navigateToAddOrUpdateBlog(context, isUpdate: false);
                },
                child: const Text('Add Details'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // add detail page banauney
                  // 3 ta field
                  // image, title, subtitle
                  // blog details
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddBlog(),
                    ),
                  );
                },
                child: const Text('Add Blog'),
              ),
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

class AddBlog extends StatefulWidget {
  AddBlog({super.key});

  @override
  State<AddBlog> createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  final bc = Get.find<BlogController>();
@override
  void initState() {
  bc.blogFile = null;
  super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Blog'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              InkWell(
                onTap: () async {
                  FilePickerResult? result = await FilePicker.platform.pickFiles();
                  if (result != null) {
                    bc.onBlogImagePicked(result.files.first);
                  }
                },
                child: bc.blogFile == null
                    ? Container(
                  height: 150,
                  width: 150,
                  color: Colors.grey[200],
                  child: const Icon(Icons.camera_alt, size: 50, color: Colors.grey),
                )
                    : Image.file(
                  File(bc.blogFile!.path!),
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Title',
                  labelText: 'Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Subtitle',
                  labelText: 'Subtitle',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                maxLines: 3,
                maxLength: 300,
                decoration: InputDecoration(
                  hintText: 'Description',
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      bc.addBlog();
                    },
                    child: const Text('Add Blog'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
