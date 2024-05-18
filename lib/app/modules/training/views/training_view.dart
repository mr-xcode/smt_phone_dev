import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smt_phonesh_dev/app/data/color_consts.dart';

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
      body: const Center(
        child: Text(
          'Coming Soon...',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
