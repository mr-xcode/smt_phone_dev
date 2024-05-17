import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:smt_phonesh_dev/app/data/color_consts.dart';

import '../controllers/buying_controller.dart';

class BuyingView extends GetView<BuyingController> {
  const BuyingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<String> arguments = Get.arguments;
    String duration = arguments[0];
    String price = arguments[1];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Buying',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: ColorConsts.priColor,
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        width: double.infinity,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'လုပ်ဆောင်ရန်များ - ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                    'SMT - PhoneSH ${duration} ဝယ်ယူရန်အတွက်၊ \nကျသင့်ငွေ ${price} ကျပ် အား၊ \nKbzpay or Wave 09xxxxxxxxx, \nKo Ye Htut Oo Acc အား လွဲပေးပါရန် နှင့် - '),
                SizedBox(
                  height: 20,
                ),
                Text('ငွေလွဲ ss ပို့ပေးပါရန်။'),
                SizedBox(
                  height: 30,
                ),
                Obx(
                  () => Center(
                    child: GFButton(
                      onPressed: controller.isSSImageChooseSuccess.value
                          ? null
                          : () {
                              controller.chooseImage();
                            },
                      blockButton: true,
                      icon: Icon(Icons.image),
                      child: Text('SS ထည့်မယ်'),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              left: 8,
              bottom: 0,
              child: Center(
                child: Obx(() => GFButton(
                      onPressed: controller.isSSImageChooseSuccess.value
                          ? () {
                              controller.sendSS(duration, price);
                            }
                          : null,
                      color: GFColors.SUCCESS,
                      blockButton: true,
                      icon: Icon(Icons.send),
                      child: Text(
                        'Send',
                        style: TextStyle(color: Colors.black),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
