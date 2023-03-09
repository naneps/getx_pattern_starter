import 'package:get/get.dart';

import '../controllers/core_controller.dart';

class CoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoreController>(
      () => CoreController(),
    );
  }
}
