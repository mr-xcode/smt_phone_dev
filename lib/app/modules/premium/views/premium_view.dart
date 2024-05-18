import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:smt_phonesh_dev/app/data/color_consts.dart';
import 'package:smt_phonesh_dev/app/modules/premium/views/widgets/premium_drawer.dart';

import '../controllers/premium_controller.dart';

class PremiumView extends GetView<PremiumController> {
  PremiumView({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: GFAppBar(
        onChanged: (value) {
          print(value);
        },
        onSubmitted: (value) {
          print('Summited value: ${value}');
          controller.titleSearchController.clear();
        },
        onTap: () {
          print('Tapped');
        },
        searchController: controller.titleSearchController,
        searchHintText: 'iPhone 15 Pro Max',
        leading: GFIconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          type: GFButtonType.transparent,
        ),
        searchBar: true,
        title: Text('SMT'),
        actions: <Widget>[
          GFIconButton(
            tooltip: 'Trainings',
            icon: Icon(
              Icons.laptop,
              color: Colors.white,
            ),
            onPressed: () {
              Get.toNamed('/training');
            },
            type: GFButtonType.transparent,
          ),
        ],
      ),
      drawer: PremiumDrawer(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your button action here
          Get.toNamed('/request-missing');
        },
        icon: Icon(
          Icons.insert_chart,
          color: Colors.white,
        ),
        label: Text(
          'Request Missing',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: ColorConsts.priColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
      ),
    );
  }
}
