import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/components/loader/gf_loader.dart';

import '../controllers/auth_gate_controller.dart';

class AuthGateView extends GetView<AuthGateController> {
  const AuthGateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: GFLoader(),
      ),
    );
  }
}
