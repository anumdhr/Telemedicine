import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:seventh_sem_project/module/screens/admin/screens/doctor_home_page.dart';

class BlogController extends GetxController {
  //blog
  final titleController = TextEditingController();
  final subtitleController = TextEditingController();
  final descriptionController = TextEditingController();
  PlatformFile? blogFile;

  Future<void> addBlog() async {
    try {
      // Get the current user's UID
      BotToast.showLoading();
      final userUid = FirebaseAuth.instance.currentUser!.uid;

      // Upload the blog image to Firebase Storage
      final blogImageUrl = await uploadBlogImage();

      // Create a new blog document in the 'blogs' collection
      final blogData = {
        'title': titleController.text.trim(),
        'subtitle': subtitleController.text.trim(),
        'description': descriptionController.text.trim(),
        'imageUrl': blogImageUrl,
        'createdBy': userUid,
        'createdAt': FieldValue.serverTimestamp(),
      };

      await FirebaseFirestore.instance.collection('blogs').add(blogData);
      BotToast.closeAllLoading();
      Get.to(() => AdminHomePage());
      clearTextFields();
    } catch (e) {
      Logger().e('Error adding blog: $e');
    }
  }

  void clearTextFields() {
    blogFile = null;
    titleController.clear();
    subtitleController.clear();
    descriptionController.clear();
  }

  Future<String> uploadBlogImage() async {
    if (blogFile == null) {
      return ''; // Return an empty string if no image is selected
    }

    try {
      final path = 'blog_images/${blogFile!.name}';
      final file = File(blogFile!.path!);

      final ref = FirebaseStorage.instance.ref().child(path);
      final uploadTask = ref.putFile(file);
      final snapshot = await uploadTask.whenComplete(() {});
      final downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      Logger().e('Error uploading blog image: $e');
      return '';
    }
  }

  void onBlogImagePicked(PlatformFile? file) {
    blogFile = file;
  }
}
