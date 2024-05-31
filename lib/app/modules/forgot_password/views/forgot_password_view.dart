import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:smt_phonesh_dev/app/data/color_consts.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SMT - PhoneSH Forgot Password',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w600,
            color: ColorConsts.blackColor,
          ),
        ),
        backgroundColor: ColorConsts.scaffoldBgColor,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller.emailController,
              style: TextStyle(color: Colors.black),
              autofocus: true,
              decoration: InputDecoration(
                fillColor: Colors.black12,
                filled: true,
                hintText: 'Enter your email',
              ),
              onChanged: (value) {
                if (GetUtils.isEmail(value)) {
                  controller.isEmail.value = true;
                } else {
                  controller.isEmail.value = false;
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            Obx(
              () => GFButton(
                padding: EdgeInsets.symmetric(vertical: 10),
                blockButton: true,
                color: ColorConsts.priColor,
                onPressed: (controller.isEmail.value)
                    ? () async {
                        if (await controller.isEmailRegistered(
                          controller.emailController.text.toString(),
                        )) {
                          Get.back();
                          controller.showEmailSentDialog();
                        } else {
                          controller.showEmailNotRegisteredDialog();
                        }
                      }
                    : null,
                text: 'Reset password',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
