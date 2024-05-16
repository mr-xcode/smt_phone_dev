import 'package:get/get.dart';

import '../controllers/is_firsttime_controller.dart';

class IsFirsttimeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IsFirsttimeController>(
      () => IsFirsttimeController(),
    );
  }
}
