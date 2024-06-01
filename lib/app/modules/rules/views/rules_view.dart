import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smt_phonesh_dev/app/data/color_consts.dart';

import '../controllers/rules_controller.dart';

class RulesView extends GetView<RulesController> {
  const RulesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rules And Regulations',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w600,
            color: ColorConsts.blackColor,
          ),
        ),
        backgroundColor: ColorConsts.scaffoldBgColor,
      ),
    );
  }
}
