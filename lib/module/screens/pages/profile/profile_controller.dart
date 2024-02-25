import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:seventh_sem_project/services/image_picker/imagepicker_services.dart';

class ProfileController extends GetxController{
  var imageUrl = ''.obs;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  void onPhotoUploaded() async {
    final response = await ImagePickerServices().uploadImageByGallery();
    if (response != null) {
      imageUrl.value = '';
      imageUrl(response);
    }
  }

}