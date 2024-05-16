import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    await Future.delayed(Duration(seconds: 3), () {
      checkFirstTime();
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  void checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? repeat = prefs.getBool('repeat');
    if (repeat == null) {
      await prefs.setBool('repeat', true);
      Get.offAllNamed('/onboarding');
    } else {
      Get.offAllNamed('/onboarding');
    }
  }
}
