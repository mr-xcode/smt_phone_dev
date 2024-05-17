import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:smt_phonesh_dev/app/components/my_gfdrawer_addnewitems.dart';
import 'package:smt_phonesh_dev/app/components/my_gridview.dart';
import 'package:smt_phonesh_dev/app/modules/admin_add_new/controllers/gridview_controll_controller.dart';

import '../controllers/admin_add_new_controller.dart';

class AdminAddNewView extends GetView<AdminAddNewController> {
  AdminAddNewView({Key? key}) : super(key: key);

  //final controller = Get.put(AdminPanelController());
  final _gridview_controller = Get.put(GridviewControllController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Add New Data',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xff0C89CE),
        centerTitle: false,
        actions: [
          GFButton(
            onPressed: () {
              Get.offAllNamed('/admin-panel');
            },
            text: "Home",
            textStyle: const TextStyle(
              color: Color(0xff0C89CE),
              fontWeight: FontWeight.bold,
            ),
            icon: const Icon(
              Icons.home,
              color: Color(0xff0C89CE),
            ),
            color: Colors.white,
            textColor: Colors.black,
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      drawer: MyGFDrawer().showMyGFDrawer(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        height: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => Text((controller.selectedBrand.value == '')
                    ? 'Select Brand Frist'
                    : "Brand: ${controller.selectedBrand.value}"),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(() {
                if (controller.isModelVisible.value) {
                  return TextField(
                    enabled: controller.isTextEnable.value,
                    controller: controller.modelTextController,
                    decoration: const InputDecoration(labelText: "Model: "),
                  );
                } else {
                  return const SizedBox();
                }
              }),
              const SizedBox(
                height: 20,
              ),
              Obx(() {
                if (controller.isModelVisible.value) {
                  return GFButton(
                    onPressed: controller.isButtonEnable.value
                        ? () {
                            controller.confirmModel();
                          }
                        : null,
                    text: "Confirm",
                    color: Colors.deepPurpleAccent,
                  );
                } else {
                  return const SizedBox();
                }
              }),

              const SizedBox(
                height: 20,
              ),

              // upload loader
              Obx(() {
                if (_gridview_controller.isLoader.value) {
                  return const GFLoader();
                } else {
                  return Container();
                }
              }),

              // Custom table for upload form
              Obx(() {
                if (controller.isGridViewVisible.value) {
                  return MyGridview().showMyGridview();
                } else {
                  return const SizedBox();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
