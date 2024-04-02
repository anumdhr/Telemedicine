import 'package:get/get.dart';
import 'package:seventh_sem_project/services/image_picker/imagepicker_services.dart';

class AdminController extends GetxController{
  var index = 0.obs;
  var imageUrl = ''.obs;

  void onPhotoUploaded() async {
    final response = await ImagePickerServices().uploadImageByGallery();
    if (response != null) {
      imageUrl.value = '';
      imageUrl(response);
    }
  }

}