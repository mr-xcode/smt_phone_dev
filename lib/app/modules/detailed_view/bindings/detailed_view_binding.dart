import 'package:get/get.dart';

import '../controllers/detailed_view_controller.dart';

class DetailedViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailedViewController>(
      () => DetailedViewController(),
    );
  }
}
