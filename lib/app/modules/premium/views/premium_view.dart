import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:smt_phonesh_dev/app/data/color_consts.dart';
import 'package:smt_phonesh_dev/app/modules/premium/views/widgets/premium_drawer.dart';

import '../controllers/premium_controller.dart';

class PremiumView extends GetView<PremiumController> {
  const PremiumView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'SMT - PhoneSH',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: ColorConsts.priColor,
        actions: [
          GFButton(
            onPressed: () {
              Get.toNamed('/training');
            },
            color: GFColors.TRANSPARENT,
            icon: Icon(
              Icons.laptop,
              color: ColorConsts.blackColor,
            ),
            text: "Trainings",
            textColor: ColorConsts.blackColor,
          ),
        ],
      ),
      drawer: PremiumDrawer(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your button action here
          Get.toNamed('/request-missing');
        },
        icon: Icon(
          Icons.insert_chart,
          color: Colors.white,
        ),
        label: Text(
          'Request Missing',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: ColorConsts.priColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
      ),
    );
  }
}
