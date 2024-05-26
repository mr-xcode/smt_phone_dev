import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';
import 'package:getwidget/getwidget.dart';
import 'package:smt_phonesh_dev/app/data/color_consts.dart';
import 'package:smt_phonesh_dev/app/modules/admin_panel/controllers/admin_panel_controller.dart';

import '../controllers/admin_detailed_view_controller.dart';

class AdminDetailedViewView extends GetView<AdminDetailedViewController> {
  const AdminDetailedViewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mController = Get.put(AdminPanelController());
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Detailed: ${mController.selectedBrand.value}/${mController.modelDetailedTapped.value}',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: ColorConsts.priColor,
      ),
      body: Obx(
        () => (controller.isLoading.value)
            ? GFLoader()
            : Container(
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                  itemCount: controller.stringSubModelList.value.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onLongPress: () {
                        Get.back();
                        Get.snackbar(
                          "Del",
                          'Deleting ${controller.stringSubModelList[index]}',
                          backgroundColor: GFColors.DANGER,
                          colorText: Colors.white,
                          snackPosition: SnackPosition.BOTTOM,
                          duration: Duration(seconds: 1),
                        );
                      },
                      child: GFAccordion(
                        title: '${controller.stringSubModelList[index]}',
                        contentPadding: EdgeInsets.all(5),
                        titleBorderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        contentBorderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        content: '${controller.myList[index]}',
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
