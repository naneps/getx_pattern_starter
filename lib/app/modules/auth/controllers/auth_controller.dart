import 'package:get/get.dart';

class AuthController extends GetxController {
  //TODO: Implement AuthController
  RxBool isShowPass = false.obs;
  RxBool isShowPassConfirm = false.obs;
  RxBool isLoading = false.obs;
  RxString phone = ''.obs;
  RxString password = ''.obs;
  final count = 0.obs;
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
  void increment() => count.value++;
}
