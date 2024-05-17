import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminAddNewController extends GetxController {
  //TODO: Implement AdminAddNewController

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

  List<String> brandList = [
    'Samsung',
    'Apple',
    'Huawei',
    'Xiaomi',
    'OnePlus',
    'Oppo',
    'Vivo',
    'Realme',
    'Meizu',
    'Tecno',
    'Honor',
    'Asus',
    'Gionee',
    'Nokia',
    'HTC',
    'Google',
    'LG',
    'Sony',
  ];

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

  @override
  void onClose() {
    super.onClose();
    selectedBrand.value = '';
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

  void confirmModel() {
    if (modelTextController.text.length > 0) {
      selectedModel.value = modelTextController.text;
      modelTextController.clear;
      isTextEnable.value = false;
      isButtonEnable.value = false;
      isGridViewVisible.value = true;
    } else {
      Get.snackbar("Error", "Model name is empty");
    }
  }

  Future<void> deleteFolderRecursive(String folderPath) async {
    final storage = FirebaseStorage.instance;
    final ListResult result = await storage.ref(folderPath).listAll();
    for (final Reference ref in result.items) {
      await ref.delete();
    }

    // Recursively delete subfolders
    for (final Reference ref in result.prefixes) {
      await deleteFolderRecursive(ref.fullPath);
    }
  }
}
