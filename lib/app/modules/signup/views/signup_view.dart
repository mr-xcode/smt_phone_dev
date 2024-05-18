import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:smt_phonesh_dev/app/data/color_consts.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SMT - PhoneSH Sign Up',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w600,
            color: ColorConsts.blackColor,
          ),
        ),
        backgroundColor: ColorConsts.scaffoldBgColor,
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
                    color: Colors.grey.shade300,
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
                      color: ColorConsts.priColor,
                      child: Text("Choose Image..."),
                    )),

                // Username:
                TextField(
                  controller: controller.usernameController,
                  decoration: InputDecoration(
                    label: Text("UserName: "),
                    suffixIcon: Icon(Icons.person),
                    hintText: 'SMT User',
                  ),
                ),

                // Email:
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    label: Text("Email: "),
                    suffixIcon: Icon(Icons.email),
                    hintText: 'smtuser@gmail.com',
                  ),
                ),

                // Password:
                TextField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(
                    label: Text("Password: "),
                    suffixIcon: Icon(Icons.lock),
                    hintText: '******',
                  ),
                ),

                // PhoneNumber:
                TextField(
                  keyboardType: TextInputType.phone,
                  controller: controller.phonenumberController,
                  decoration: InputDecoration(
                    label: Text("Phone Number: "),
                    suffixIcon: Icon(Icons.phone),
                    hintText: '09xxxxxxxx',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // Address:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Address: "),
                    Obx(
                      () => DropdownButton<String>(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        borderRadius: BorderRadius.circular(10),
                        hint: Text("Address: "),
                        style: TextStyle(
                          color: ColorConsts.blackColor,
                        ),
                        value: controller.selectedItem.value,
                        onChanged: (newValue) {
                          controller.selectedItem.value = newValue ?? '';
                        },
                        items: controller.items
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 20,
                ),
                // Signup Button
                Obx(() => GFButton(
                      onPressed: controller.isSignUpLoading.value
                          ? null
                          : () {
                              controller.signUp();
                            },
                      color: ColorConsts.priColor,
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
