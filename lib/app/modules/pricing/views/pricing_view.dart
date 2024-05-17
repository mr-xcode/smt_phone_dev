import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smt_phonesh_dev/app/data/color_consts.dart';
import 'package:smt_phonesh_dev/app/modules/pricing/widgets/pricing_card.dart';

import '../controllers/pricing_controller.dart';

class PricingView extends GetView<PricingController> {
  const PricingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text(
          'Pricing',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: ColorConsts.priColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // One Months
              pricingCard(context, '1 Month', '2,000'),

              // Three Months
              pricingCard(context, '3 Months', '5,000'),

              // Six Months
              pricingCard(context, '6 Months', '10,000'),

              // One Year
              pricingCard(context, '1 Year', '20,000'),
            ],
          ),
        ),
      ),
    );
  }
}
