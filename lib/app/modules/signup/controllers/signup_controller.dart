import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignupController extends GetxController {
  //TODO: Implement SignupController

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phonenumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  Rx<File?> selectedImage = Rx<File?>(null);
  Rx<Uint8List?> selectedImageData = Rx<Uint8List?>(null);

  bool isUsernameValid = false;
  bool isPhonenumberValid = false;
  bool isAddressValid = false;
  bool isPasswordValid = false;
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

  Future<XFile?> _pickImageFromPlatform() async {
    final picker = ImagePicker();
    if (GetPlatform.isWeb) {
      return await picker.pickImage(source: ImageSource.gallery);
    } else {
      return await picker.pickImage(source: ImageSource.gallery);
    }
  }

  Future<void> chooseImage() async {
    try {
      final pickedFile = await _pickImageFromPlatform();
      if (pickedFile != null) {
        final imageData = await pickedFile.readAsBytes();
        selectedImageData.value = imageData;
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<void> signUp() async {
    if (usernameController.text.length > 8) {
      isUsernameValid = true;
    } else {
      Get.snackbar("Username", 'Username is too short');
      return;
    }
    if (passwordController.text.length > 5) {
      isPasswordValid = true;
    } else {
      Get.snackbar("Password", "Password is too short");
      return;
    }
    if (phonenumberController.text.length > 8) {
      isPasswordValid = true;
    } else {
      Get.snackbar("PhoneNumber", "Enter a valid Phone number");
      return;
    }
    if (addressController.text.length > 5) {
      isAddressValid = true;
    } else {
      Get.snackbar("Address", "Please enter valid Address");
      return;
    }
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      String userId = userCredential.user!.uid;
      createUserInDb(userId);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> createUserInDb(String userId) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(userId).set({
        'userId': userId,
        'username': usernameController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'phoneNumber': phonenumberController.text,
        'address': addressController.text,
        'role': 'user',
        'expireOn': '',
        // Add any other user-specific data you want to store
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
