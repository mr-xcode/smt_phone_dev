import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class ForgotPasswordController extends GetxController {
  //TODO: Implement ForgotPasswordController

  String? email;
  final RxBool isEmail = false.obs;
  final TextEditingController emailController = TextEditingController();
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

  Future<void> forgotPassword() async {}

  Future<bool> isEmailRegistered(String email) async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .limit(1)
          .get();

      return snapshot.docs.isNotEmpty;
    } catch (e) {
      print('Error checking email: $e');
      return false;
    }
  }

  Future<void> sendResetmail() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: '${emailController.text.toString()}');
      Get.snackbar(
        'Success',
        "Password was send to you email!",
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: GFColors.SUCCESS,
        duration: Duration(seconds: 3),
      );
    } catch (e) {
      print('mail cannot send: ${e}');
      Get.snackbar(
        'Error',
        "Email cannot send. Try again!",
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: GFColors.DANGER,
        duration: Duration(seconds: 3),
      );
    }
  }

  void showEmailNotRegisteredDialog() {
    Get.snackbar(
      'Error',
      "Email is not registered",
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: GFColors.DANGER,
      duration: Duration(seconds: 3),
    );
  }
}
