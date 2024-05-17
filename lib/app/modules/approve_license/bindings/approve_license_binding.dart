import 'package:get/get.dart';

import '../controllers/approve_license_controller.dart';

class ApproveLicenseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApproveLicenseController>(
      () => ApproveLicenseController(),
    );
  }
}
