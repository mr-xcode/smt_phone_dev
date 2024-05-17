import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignupView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image Choose View
                Obx(() {
                  return Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey.shade200,
                    child: controller.isProfileImageChooseSuccess.value
                        ? Image.file(controller.file)
                        : Center(
                            child: Text(
                            "?",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          )),
                  );
                }),
                SizedBox(
                  height: 10,
                ),
                // Choose Image
                Obx(() => GFButton(
                      onPressed: !controller.isProfileImageChooseSuccess.value
                          ? () {
                              controller.chooseImage();
                            }
                          : null,
                      child: Text("Choose Image..."),
                    )),

                // Username:
                TextField(
                  controller: controller.usernameController,
                  decoration: InputDecoration(label: Text("UserName: ")),
                ),

                // Email:
                TextField(
                  controller: controller.emailController,
                  decoration: InputDecoration(label: Text("Email: ")),
                ),

                // Password:
                TextField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(label: Text("Password: ")),
                ),

                // PhoneNumber:
                TextField(
                  controller: controller.phonenumberController,
                  decoration: InputDecoration(label: Text("Phone Number: ")),
                ),

                // Address:
                TextField(
                  controller: controller.addressController,
                  decoration: InputDecoration(label: Text("Address: ")),
                ),

                // Signup Button
                Obx(() => GFButton(
                      onPressed: controller.isSignUpLoading.value
                          ? null
                          : () {
                              controller.signUp();
                            },
                      blockButton: true,
                      child: controller.isSignUpLoading.value
                          ? GFLoader()
                          : Text('Sign Up'),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
