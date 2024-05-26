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
                          onTap: () {
                            controller.modelDetailedTapped.value =
                                controller.modelList[index];
                            Get.toNamed('admin-detailed-view');
                          },
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
