import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smt_phonesh_dev/app/data/color_consts.dart';

import '../controllers/admin_panel_controller.dart';

class AdminPanelView extends GetView<AdminPanelController> {
  const AdminPanelView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SMT - Admin Panel',
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
          'AdminPanelView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
