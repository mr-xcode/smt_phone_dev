import 'package:get/get.dart';

import '../controllers/admin_detailed_view_controller.dart';

class AdminDetailedViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminDetailedViewController>(
      () => AdminDetailedViewController(),
    );
  }
}
