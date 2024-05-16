import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smt_phonesh_dev/app/data/color_consts.dart';

import '../controllers/premium_controller.dart';

class PremiumView extends GetView<PremiumController> {
  const PremiumView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PremiumView',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: ColorConsts.priColor,
        actions: [
          IconButton(
            onPressed: () {
              controller.signOut();
            },
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'PremiumView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
