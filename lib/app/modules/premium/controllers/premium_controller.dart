import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PremiumController extends GetxController {
  //TODO: Implement PremiumController
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
  final selectedModel = ''.obs;
  final modelTextController = TextEditingController();
  final isTextEnable = true.obs;
  final isButtonEnable = true.obs;
  final isModelVisible = false.obs;
  final isGridViewVisible = false.obs;

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
    isModelVisible.value = true;
    isTextEnable.value = true;
    isButtonEnable.value = true;
    isGridViewVisible.value = false;
    modelTextController.clear();
    Get.back();
    getModelList();
  }

  Future getModelList() async {
    final listResult =
        await storageRef.child('${selectedBrand.value}').listAll();
    modelList.clear();
    subModelList.clear();
    for (var prefix in listResult.prefixes) {
      modelList.add(prefix.name);
      await getSubModelList();
    }
  }

  Future getSubModelList() async {
    final listResult = await storageRef
        .child('${selectedBrand.value}/${selectedModel.value}')
        .listAll();

    for (var prefix in listResult.prefixes) {
      stringSubModelList.value += prefix.name;
      stringSubModelList.value += ', ';
    }
  }
}
