import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:smt_phonesh_dev/app/components/my_gfdrawer.dart';
import 'package:smt_phonesh_dev/app/data/color_consts.dart';

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
          GFButton(
            onPressed: () {
              Get.toNamed('/admin-add-new');
            },
            text: "New",
            textStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            icon: const Icon(
              Icons.new_label,
              color: Colors.white,
            ),
            textColor: Colors.black,
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      drawer: MyGFDrawer().showMyGFDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/approve-license');
        },
        child: Text(
          "License",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: ColorConsts.priColor,
      ),
      body: Obx(() {
        return Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              (controller.selectedBrand.isEmpty)
                  ? Text(
                      "!!! Select Brand First !!!",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.red),
                    )
                  : Text(
                      '==> ' + controller.selectedBrand.value + ' <==',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue),
                    ),
              if (controller.selectedBrand.value.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.modelList.length,
                    itemBuilder: (context, index) {
                      return GFListTile(
                          color: Colors.white,
                          title: Text(
                            controller.modelList[index],
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          icon: IconButton(
                            onPressed: () async {
                              return await controller
                                  .deleteFolderRecursive(
                                      '${controller.selectedBrand}/${controller.modelList[index]}')
                                  .then((value) =>
                                      controller.modelList.removeAt(index));
                            },
                            icon: const Icon(Icons.delete_forever),
                            color: GFColors.DANGER,
                            iconSize: 36,
                          ));
                    },
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }
}
