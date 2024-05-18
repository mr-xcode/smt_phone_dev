import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PremiumController extends GetxController {
  List<String> brandList = [
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

  final selectedBrand = ''.obs;

  final storageRef = FirebaseStorage.instance.ref();
  final modelList = [].obs;
  final subModelList = [].obs;
  final stringSubModelList = "".obs;

  final TextEditingController titleSearchController = TextEditingController();

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

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    }
  }

  void handleListTileTap(String name) {
    selectedBrand.value = name;
    Get.back();
  }
}
