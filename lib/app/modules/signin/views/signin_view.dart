import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:smt_phonesh_dev/app/data/color_consts.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConsts.priColor,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo/logo_transparent.png',
                  width: 100,
                  height: 100,
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'SMT - PhoneSH Login',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    color: ColorConsts.blackColor,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  style: TextStyle(color: Colors.white),
                  controller: controller.emailController,
                  autofocus: true,
                  decoration: InputDecoration(
                    fillColor: Colors.black12,
                    filled: true,
                    label: Text(
                      "Email:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    icon: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(() => TextField(
                      style: TextStyle(color: Colors.white),
                      obscureText: controller.obscureText.value,
                      controller: controller.passwordController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.obscureText.value =
                                !controller.obscureText.value;
                          },
                          icon: (!controller.obscureText.value)
                              ? Icon(
                                  Icons.visibility,
                                  color: Colors.white,
                                )
                              : Icon(
                                  Icons.visibility_off,
                                  color: Colors.black,
                                ),
                        ),
                        fillColor: Colors.black12,
                        filled: true,
                        label: Text(
                          "Password:",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        icon: Icon(
                          Icons.password,
                          color: Colors.white,
                        ),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/forgot-password');
                      },
                      child: Text(
                        'forgot password?',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                          fontSize: 12,
                          color: GFColors.WARNING,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                GFButton(
                  onPressed: () {
                    controller.signIn();
                  },
                  blockButton: true,
                  child: Obx(() => (controller.isLoading.value)
                      ? GFLoader(
                          type: GFLoaderType.ios,
                        )
                      : Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        )),
                  color: GFColors.FOCUS,
                ),
                SizedBox(
                  height: 10,
                ),
                GFButton(
                  onPressed: () {
                    Get.toNamed('/signup');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Not a member? "),
                      Text(
                        "Sign up ",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                            fontSize: 14,
                            color: GFColors.WARNING,
                            fontWeight: FontWeight.w600),
                      ),
                      Text("now"),
                    ],
                  ),
                  color: GFColors.TRANSPARENT,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
