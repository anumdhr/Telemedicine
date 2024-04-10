import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:seventh_sem_project/module/auth/controller/auth-controller.dart';
import 'package:seventh_sem_project/module/screens/admin/firebase_doctor_info/profile_model.dart';
import 'package:seventh_sem_project/services/image_picker/imagepicker_services.dart';

class DoctorController extends GetxController {
  var index = 0.obs;
  var imageUrl = ''.obs;
  final TextEditingController specializationController = TextEditingController(); // For doctor's specialization
  final TextEditingController degreeController = TextEditingController(); // For doctor's degree
  final TextEditingController visitingTimeController = TextEditingController(); // For doctor's visiting time
  final TextEditingController workingHospitalController = TextEditingController(); // For doctor's working hospital
  final doctorProfileList = <DoctorProfileModel>[].obs;
  final ac = Get.find<AuthController>();
  PlatformFile? platformFile;
  UploadTask? uploadTask;


  onPhotoUploaded() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    platformFile = result!.files.first;

  }

  Future<void> uploadToFirebaseStorage() async {
// Check if the user details already exist in the database

    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('adminDetails').where('userUid', isEqualTo: FirebaseAuth.instance.currentUser!.uid).limit(1).get();

    Logger().d("New user is ${FirebaseAuth.instance.currentUser!.uid}");
    final path = 'files/${platformFile!.name}';
    final file = File(platformFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);
    final snapshot = await uploadTask!.whenComplete(() => () {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    Logger().d(urlDownload);
    imageUrl.value = urlDownload;
    if (querySnapshot.docs.isNotEmpty) {
// User details already exist, perform update instead of add

      DocumentSnapshot documentSnapshot = querySnapshot.docs.first;

      String documentId = documentSnapshot.id;

// Upload the image to Firebase Storage
//
//       String fileName = 'profile_image_${ac.updatedModel.firstName}_${ac.updatedModel.lastName}.jpg';
//
//       firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref().child('doctor_images').child(fileName);
//
//       await ref.putFile(File(imageUrl.value));
//
//       String downloadURL = await ref.getDownloadURL();
//       Logger().d(downloadURL);

      await FirebaseFirestore.instance.collection('adminDetails').doc(documentId).update({
        'firstName': ac.updatedModel.firstName,
        'lastName': ac.updatedModel.lastName,
        'degree': degreeController.text.trim(),
        'specialization': specializationController.text.trim(),
        'visitingTime': visitingTimeController.text.trim(),
        'workingHospital': workingHospitalController.text.toString(),
        'image': urlDownload,
      });
      uploadTask = null;
    } else {
// User details do not exist, perform add operation

      DoctorProfileModel doctorProfileModel = DoctorProfileModel(
        firstName: ac.updatedModel.firstName,

        lastName: ac.updatedModel.lastName,

        degree: degreeController.text.trim(),

        specialization: specializationController.text.trim(),

        visitingTime: visitingTimeController.text.trim(),

        workingHospital: workingHospitalController.text.toString(),

        image: imageUrl.value,
        // This should be the download URL

        userUid: FirebaseAuth.instance.currentUser!.uid,
      );

      await FirebaseFirestore.instance.collection('adminDetails').add(doctorProfileModel.toJson());
      uploadTask = null;

    }
  }

  Future<List<DoctorProfileModel>> getDoctorProfile() async {
    try {
      doctorProfileList.clear();
      // Reference to the 'adminDetails' collection
      CollectionReference adminDetailsCollection = FirebaseFirestore.instance.collection('adminDetails');

      // Query the collection to get all documents
      QuerySnapshot querySnapshot = await adminDetailsCollection.get();

      // Iterate over the documents and convert them into DoctorProfileModel objects
      querySnapshot.docs.forEach((doc) {
        DoctorProfileModel doctorProfile = DoctorProfileModel.fromJson(doc.data() as Map<String, dynamic>);
        doctorProfileList.add(doctorProfile);
      });
      // Logger().d(doctorProfileList.length);
    } catch (e) {
      print('Error fetching doctor profiles: $e');
    }

    return doctorProfileList;
  }
}
// Get the data from text fields

// Reference to the Firebase Storage instance
//   firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
//
//   // Reference to the doctor's profile image file
//   String filePath = ac.imageUrl.value;
//   File file = File(filePath);
//   String fileName = 'profile_image.jpg';
//
//   // Upload the image to Firebase Storage
//   firebase_storage.Reference ref = storage.ref().child('doctor_images').child(fileName);
//   await ref.putFile(file);
//
//   // Get the download URL of the uploaded image
//   String downloadURL = await ref.getDownloadURL();
//
//   // Now you can store the download URL along with other data in Firestore or Realtime Database
//   // For simplicity, let's just print the download URL
//   print('Download URL: $downloadURL');



// void onPhotoUploaded() async {
//   final response = await ImagePickerServices().uploadImageByGallery();
//   if (response != null) {
//     imageUrl.value = '';
//     imageUrl(response);
//   }
// }