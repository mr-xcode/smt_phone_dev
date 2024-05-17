import 'package:get/get.dart';

import '../controllers/admin_add_new_controller.dart';

class AdminAddNewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminAddNewController>(
      () => AdminAddNewController(),
    );
  }
}
