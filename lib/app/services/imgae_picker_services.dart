import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService extends GetxService {
  ImagePicker imagePicker = ImagePicker();
  Future<XFile?> pickImageFromGallery() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    return pickedFile;
  }

  Future<XFile> pickImageFromCamera() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    return pickedFile!;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
