import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:smt_phonesh_dev/app/modules/admin_panel/controllers/admin_panel_controller.dart';

class MyBody extends StatelessWidget {
  MyBody({
    super.key,
  });

  final AdminPanelController controller = Get.put(AdminPanelController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
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
                              Get.snackbar(
                                "Del",
                                'Deleting ${controller.modelList[index]}',
                                backgroundColor: GFColors.DANGER,
                                colorText: Colors.white,
                                snackPosition: SnackPosition.BOTTOM,
                                duration: Duration(seconds: 1),
                              );
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
              SizedBox(
                height: 54,
              ),
            ],
          ),
        );
      },
    );
  }
}
