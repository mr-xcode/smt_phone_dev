import 'package:get/get.dart';

import '../controllers/request_missing_controller.dart';

class RequestMissingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RequestMissingController>(
      () => RequestMissingController(),
    );
  }
}
