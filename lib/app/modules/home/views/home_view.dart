import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:smt_phonesh_dev/app/data/color_consts.dart';
import 'package:smt_phonesh_dev/app/modules/home/views/widgets/user_drawer.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text(
          'SMT - PhoneSH',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: ColorConsts.priColor,
        actions: [
          IconButton(
            onPressed: () {
              controller.signOut();
            },
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),
      drawer: UserDrawer(),
      body: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Text(
                  "ဆော့ဝဲ အသုံးပြုရန်အတွက် ",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: ColorConsts.priColor),
                )),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: Text(
                  "လိုင်စင် ဝယ်ယူရန် လိုပါတယ်။",
                  style: TextStyle(color: ColorConsts.blackColor),
                )),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: GFButton(
                    blockButton: true,
                    onPressed: () {
                      Get.toNamed('/pricing');
                    },
                    color: ColorConsts.priColor,
                    child: Text("ဝယ်ယူရန်"),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'လိုင်စင်ကီး ရယူထားပြီးပါက - ',
                    style: TextStyle(color: GFColors.ALT),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      label: Text(
                        "Activation Key:",
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: GFButton(
                      onPressed: () {},
                      color: GFColors.ALT,
                      blockButton: true,
                      child: Text("Activate"),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 10,
              left: 0,
              right: 0,
              child: Center(
                  child: Text("မဂ်လာပါ၊ SMT - PhoneSH မှ ကြိုဆိုပါတယ်။ ")),
            ),
          ],
        ),
      ),
    );
  }
}
