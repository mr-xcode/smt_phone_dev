import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      body: Obx(() => SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(16.0),
              width: double.infinity,
              child: (controller.selectedBrand.value.isEmpty)
                  ? Text(
                      'Choice Brand First from drawer \nor \n Search From Title Bar!')
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Brand: ${controller.selectedBrand.value}',
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16.0),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 15,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: ListTile(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                onTap: () {
                                  Get.toNamed('/detailed-view');
                                },
                                tileColor: Colors.white,
                                title: Text('iPhone 15'),
                                subtitle: Text('Sub title'),
                                leading: FaIcon(FontAwesomeIcons.apple),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 55,
                        ),
                      ],
                    ),
            ),
          )),
    );
  }
}
