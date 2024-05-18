import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:getwidget/components/button/gf_icon_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/types/gf_button_type.dart';

import '../controllers/detailed_view_controller.dart';

class DetailedViewView extends GetView<DetailedViewController> {
  const DetailedViewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        leading: GFIconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          type: GFButtonType.transparent,
        ),
        title: Text("iPhone 15 Pro Max"),
        actions: <Widget>[
          Obx(() => GFIconButton(
                icon: (!controller.isFaved.value)
                    ? Icon(
                        Icons.favorite_border_outlined,
                        color: GFColors.DANGER,
                      )
                    : Icon(
                        Icons.favorite,
                        color: GFColors.DANGER,
                      ),
                onPressed: () {
                  controller.isFaved.value = !controller.isFaved.value;
                },
                type: GFButtonType.transparent,
              )),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: controller.featureList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  onTap: () {
                    Get.snackbar(
                      "iPhone 15 Pro Max",
                      'Viewing Data!',
                      backgroundColor: GFColors.FOCUS,
                      snackPosition: SnackPosition.BOTTOM,
                      colorText: Colors.white,
                    );
                  },
                  tileColor: Colors.white,
                  title: Text('${controller.featureList[index]}'),
                  leading: FaIcon(FontAwesomeIcons.apple),
                ),
              );
            }),
      ),
    );
  }
}
