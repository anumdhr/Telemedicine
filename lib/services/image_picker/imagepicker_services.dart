import 'package:image_picker/image_picker.dart';

class ImagePickerServices {
  static final ImagePicker picker = ImagePicker();

  Future<XFile?> uploadImageByGallery() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      return photo;
    } else {
      return null;
    }
  }

  Future<String?> uploadImageByCamera() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      return photo.path;
    } else {
      return null;
    }
  }
}
