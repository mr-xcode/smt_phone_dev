import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:smt_phonesh_dev/app/modules/request_missing/controllers/request_missing_controller.dart';

class BrandOptionWidget extends StatelessWidget {
  const BrandOptionWidget({
    super.key,
    required this.controller,
  });

  final RequestMissingController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => DropdownButton<String>(
          value: controller.selectedItem.value,
          onChanged: (String? newValue) {
            controller.selectedItem.value = newValue ?? '';
          },
          items: controller.items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ));
  }
}
