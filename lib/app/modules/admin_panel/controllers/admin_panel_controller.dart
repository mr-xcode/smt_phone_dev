import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_phonesh_dev/app/data/user.model.dart';

class AdminPanelController extends GetxController {
  //TODO: Implement AdminPanelController

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

  Rx<UserModel>? user;

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
  void onInit() async {
    super.onInit();
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .get();
    Map<String, dynamic> data = documentSnapshot.data()!;
    user = UserModel(
      userName: data['username'],
      userEmail: data['email'],
      userPhoneNumber: data['phoneNumber'],
      userAddress: data['address'],
      userProfileUrl: data['imageUrl'],
    ).obs;
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

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    }
  }

  Future<String> fetchImageUrl() async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .get();
    Map<String, dynamic> data = documentSnapshot.data()!;

    String imageUrl = data['imageUrl'];
    print('imgeUrl: ${imageUrl}');
    return imageUrl;
  }
}
