import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:smt_phonesh_dev/app/data/color_consts.dart';
import 'package:smt_phonesh_dev/app/modules/request_missing/views/widgets/brand_option_widget.dart';

import '../controllers/request_missing_controller.dart';

class RequestMissingView extends GetView<RequestMissingController> {
  const RequestMissingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Request Diagram',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: ColorConsts.priColor,
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(50),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Brand:"),
                    BrandOptionWidget(controller: controller),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: controller.modelController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Model Name: ',
                    hintText: 'iPhone 15 Pro Max',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: controller.detailsController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Which Part: ',
                    hintText: 'details what you want',
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 50,
            right: 50,
            child: GFButton(
              onPressed: () {
                controller.requestSummit();
              },
              color: ColorConsts.priColor,
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
