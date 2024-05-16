import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/is_firsttime_controller.dart';

class IsFirsttimeView extends GetView<IsFirsttimeController> {
  const IsFirsttimeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IsFirsttimeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'IsFirsttimeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
