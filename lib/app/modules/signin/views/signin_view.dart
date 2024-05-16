import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/button/gf_button.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SigninView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller.emailController,
              decoration: InputDecoration(
                label: Text(
                  "Email:",
                ),
              ),
            ),
            TextField(
              controller: controller.passwordController,
              decoration: InputDecoration(
                label: Text(
                  "Password:",
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GFButton(
                  onPressed: () {
                    Get.offNamed('/signup');
                  },
                  child: Text("Register"),
                  color: GFColors.SECONDARY,
                ),
                GFButton(
                  onPressed: () {
                    controller.signIn();
                  },
                  child: Text("Login"),
                  color: GFColors.PRIMARY,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
