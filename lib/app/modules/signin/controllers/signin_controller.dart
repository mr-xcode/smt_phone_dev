import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class SigninController extends GetxController {
  //TODO: Implement SigninController

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var obscureText = true.obs;
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

  Future<void> signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          backgroundColor: GFColors.DANGER, colorText: Colors.white);
    }
  }
}
