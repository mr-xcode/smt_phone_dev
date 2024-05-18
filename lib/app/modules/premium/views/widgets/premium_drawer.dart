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
    return GFDrawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Obx(() => GFDrawerHeader(
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
                        color: GFColors.SUCCESS,
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
              )),
        ],
      ),
    );
  }
}
