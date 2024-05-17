import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/button/gf_button_bar.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/position/gf_position.dart';
import 'package:smt_phonesh_dev/app/data/color_consts.dart';

import '../controllers/approve_license_controller.dart';

class ApproveLicenseView extends GetView<ApproveLicenseController> {
  const ApproveLicenseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Approve Users',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: ColorConsts.priColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Obx(() {
        if (controller.isLoaded.value) {
          return ListView.builder(
            itemCount: controller.buyingUsersQuerySnapshot?.docs.length,
            itemBuilder: (context, index) {
              // Build the view for each document
              return GFCard(
                boxFit: BoxFit.cover,
                titlePosition: GFPosition.start,
                image: Image.network(
                  controller.buyingUsersQuerySnapshot!.docs[index]['imageUrl'],
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                showImage: true,
                title: GFListTile(
                  avatar: GFAvatar(
                    backgroundImage: NetworkImage(
                      controller.buyingUsersQuerySnapshot?.docs[index]
                          ['profileUrl'],
                    ),
                  ),
                  titleText: controller.buyingUsersQuerySnapshot?.docs[index]
                      ['userName' ?? ''],
                  subTitleText: controller.buyingUsersQuerySnapshot?.docs[index]
                      ['email' ?? ''],
                ),
                content: Text(
                    "Duration: ${controller.buyingUsersQuerySnapshot?.docs[index]['duration']}, Pricce: ${controller.buyingUsersQuerySnapshot?.docs[index]['price']},"),
                buttonBar: GFButtonBar(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Get.snackbar("Decline", ".",
                            backgroundColor: GFColors.DANGER);
                      },
                      child: GFAvatar(
                        backgroundColor: GFColors.DANGER,
                        child: Icon(
                          Icons.cancel,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.snackbar(
                          "Appoved",
                          ".",
                          backgroundColor: GFColors.SUCCESS,
                        );
                      },
                      child: GFAvatar(
                        backgroundColor: GFColors.SUCCESS,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          return GFLoader();
        }
      }),
    );
  }
}
