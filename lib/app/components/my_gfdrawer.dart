import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:smt_phonesh_dev/app/modules/admin_panel/controllers/admin_panel_controller.dart';

class MyGFDrawer {
  final _auth = FirebaseAuth.instance;
  final controller = Get.put(AdminPanelController());
  GFDrawer showMyGFDrawer() {
    return GFDrawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          GFDrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff0C89CE),
            ),
            currentAccountPicture: Obx(() => GFAvatar(
                  backgroundImage: NetworkImage(controller
                          .user?.value?.userProfileUrl ??
                      'https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/ab/9b/bb/ab9bbba6-6714-ed70-3b45-2fbec976a434/logo_gsa_ios_color-0-1x_U007emarketing-0-0-0-6-0-0-0-85-220-0.png/1200x630wa.png'),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 8,
                ),
                Obx(() => Text(
                      'UserName: ${controller.user?.value?.userName ?? 'SMT Admin'}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    )),
                Obx(() => Text(
                      'Email: ${controller.user?.value?.userEmail}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    )),
              ],
            ),
          ),
          ...controller.brandList.map(
            (item) => ListTile(
              title: Text(
                item,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                controller.handleListTileTap(item);
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),

          //secondary
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 21),
            child: GFButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.signOut();
                  SystemNavigator.pop();
                } catch (e) {
                  Get.snackbar("Error", "Signout error. Try again later!");
                }
              },
              text: "SignOut && Close",
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
              blockButton: true,
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              color: Color(0xff454E54),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
