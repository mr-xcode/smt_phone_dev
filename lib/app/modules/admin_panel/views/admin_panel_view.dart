import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/bottom_sheet/gf_bottom_sheet.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:smt_phonesh_dev/app/components/my_gfdrawer.dart';
import 'package:smt_phonesh_dev/app/data/color_consts.dart';
import 'package:smt_phonesh_dev/app/modules/admin_panel/views/widgets/my_body.dart';
import 'package:smt_phonesh_dev/app/modules/admin_panel/views/widgets/my_bottom_sheet.dart';

import '../controllers/admin_panel_controller.dart';

class AdminPanelView extends GetView<AdminPanelController> {
  const AdminPanelView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'SMT - Admin',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: ColorConsts.priColor,
        centerTitle: false,
        actions: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white.withAlpha(50),
            ),
            child: IconButton(
              onPressed: () {
                if (controller.myGFController.isBottomSheetOpened) {
                  controller.myGFController.hideBottomSheet();
                } else {
                  controller.myGFController.showBottomSheet();
                }
              },
              icon: Icon(
                Icons.info,
              ),
              tooltip: 'About',
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GFButton(
            color: Colors.white,
            onPressed: () {
              Get.toNamed('/admin-add-new');
            },
            text: "New",
            textStyle: const TextStyle(
              color: ColorConsts.priColor,
              fontWeight: FontWeight.bold,
            ),
            icon: const Icon(
              Icons.new_label,
              color: ColorConsts.priColor,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      drawer: MyGFDrawer().showMyGFDrawer(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.toNamed('/approve-license');
        },
        label: Text(
          "License",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        icon: const Icon(
          Icons.verified,
          color: Colors.white,
        ),
        backgroundColor: ColorConsts.priColor,
      ),
      body: MyBody(),
      bottomSheet: myBottomSheet(controller: controller),
    );
  }
}
