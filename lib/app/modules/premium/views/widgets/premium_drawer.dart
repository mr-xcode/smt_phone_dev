import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/drawer/gf_drawer.dart';
import 'package:getwidget/components/drawer/gf_drawer_header.dart';
import 'package:getwidget/getwidget.dart';
import 'package:smt_phonesh_dev/app/modules/home/controllers/home_controller.dart';
import 'package:smt_phonesh_dev/app/modules/premium/controllers/premium_controller.dart';

class PremiumDrawer extends StatelessWidget {
  const PremiumDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(HomeController());
    final _premiumController = Get.put(PremiumController());
    return GFDrawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Obx(
            () => GFDrawerHeader(
              centerAlign: true,
              currentAccountPicture: GFAvatar(
                radius: 80.0,
                backgroundImage: NetworkImage("${_controller.profileUrl}"),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Hi, ${_controller.username},',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Email: ${_controller.email}',
                    style: TextStyle(
                      color: GFColors.FOCUS,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    '< Premium Acc >',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 56, 82, 67),
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    'Expire on : ${_controller.expireOn.value}',
                    style: TextStyle(
                      color: GFColors.LIGHT,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ..._premiumController.brandList.map(
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
                _premiumController.handleListTileTap(item);
              },
            ),
          ),
          const SizedBox(
            height: 30,
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
                  _premiumController.signOut();
                } catch (e) {
                  Get.snackbar("Error", "Signout error. Try again later!");
                }
              },
              text: "SignOut",
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
