import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/button/gf_button_bar.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/position/gf_position.dart';
import 'package:smt_phonesh_dev/app/data/color_consts.dart';
import 'package:smt_phonesh_dev/app/modules/training/views/widgets/training_widget.dart';

import '../controllers/training_controller.dart';

class TrainingView extends GetView<TrainingController> {
  const TrainingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Trainings',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: ColorConsts.priColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TrainingWidget(
              content: "မူလီ ဖြုတ်တပ်၊ \nမှန်ခွါ၊ မှန်ကပ်၊ \nအားသွင်း ပြန်ပေး။",
              title: 'Hardware Basic By YHO',
              imageUrl: 'assets/training/training_one.png',
            ),

            // second
            TrainingWidget(
              content: "ဘာညာ သာရကာ၊ \nနေကြာ ကွာစေ့။",
              title: 'Hardware Intermediate By YHO',
              imageUrl: 'assets/training/training_two.png',
            ),

            // third
            TrainingWidget(
              content: "မအိပ်မနေ အသက်ရှည်၊ \nပျက်အစဥ် ပြင်ခန။",
              title: 'Hardware Advance By YHO',
              imageUrl: 'assets/training/training_three.png',
            ),

            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
