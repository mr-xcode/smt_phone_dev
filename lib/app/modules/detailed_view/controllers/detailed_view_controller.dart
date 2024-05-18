import 'package:get/get.dart';

class DetailedViewController extends GetxController {
  //TODO: Implement DetailedViewController

  final count = 0.obs;
  var isFaved = false.obs;

  List featureList = [
    'Audio',
    'Back-Cam',
    'Backlight',
    'CPU-Vol',
    'Charger',
    'Charger',
    'EMMC-Vol',
    'Ear',
    'Finger-Print',
    'Flash',
    'Front-Cam',
    'Hand-Free',
    'LCD',
    'Mic',
    'Network',
    'SD-Card',
    'Sensor',
    'Sim-Card',
    'Speaker',
    'Touch',
    'Wifi-Bt-Gps'
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
