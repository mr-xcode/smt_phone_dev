import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smt_phonesh_dev/app/data/color_consts.dart';

import '../controllers/privacy_policy_controller.dart';

class PrivacyPolicyView extends GetView<PrivacyPolicyController> {
  const PrivacyPolicyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Privacy Policy',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w600,
            color: ColorConsts.blackColor,
          ),
        ),
        backgroundColor: ColorConsts.scaffoldBgColor,
      ),
      body: SafeArea(
          child: Container(
        child: Text('body'),
      )),
    );
  }
}
