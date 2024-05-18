import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';

class RequestMissingController extends GetxController {
  //TODO: Implement RequestMissingController

  var selectedItem = 'Apple'.obs;
  List<String> items = [
    'Apple',
    'Asus',
    'Google',
    'HTC',
    'Honor',
    'Huawei',
    'LG',
    'Meizu',
    'Nokia',
    'OnePlus',
    'Oppo',
    'Realme',
    'Samsung',
    'Sony',
    'Tecno',
    'Vivo',
    'Xiaomi',
  ];

  final TextEditingController modelController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();

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

  void requestSummit() {
    if (modelController.text.isNotEmpty && detailsController.text.isNotEmpty) {
      Get.snackbar(
        "Success",
        "Your request was send! We'll add that diagram soon. Thanks...",
        backgroundColor: GFColors.SUCCESS,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
      );
      modelController.clear();
      detailsController.clear();
      Get.offAllNamed('/premium');
    } else {
      Get.snackbar(
        "Error",
        "Fill text feilds first!",
        backgroundColor: GFColors.DANGER,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
      );
    }
  }
}
