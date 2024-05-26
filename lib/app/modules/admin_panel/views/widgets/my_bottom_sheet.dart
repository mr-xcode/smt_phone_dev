import 'package:flutter/material.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/bottom_sheet/gf_bottom_sheet.dart';
import 'package:smt_phonesh_dev/app/modules/admin_panel/controllers/admin_panel_controller.dart';

class myBottomSheet extends StatelessWidget {
  const myBottomSheet({
    super.key,
    required this.controller,
  });

  final AdminPanelController controller;

  @override
  Widget build(BuildContext context) {
    return GFBottomSheet(
      controller: controller.myGFController,
      maxContentHeight: 150,
      stickyHeaderHeight: 100,
      contentBody: Container(
        height: 200,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          children: const [
            Center(
                child: Text(
              'SMT - PhoneSH \n A schematic diagram tool for Myanmar Phone Service Technicians, \ndeveloped by Mr. Xcode in collaboration with Co-founder Mr. Ye Htut Oo.',
              style:
                  TextStyle(fontSize: 15, wordSpacing: 0.3, letterSpacing: 0.2),
            ))
          ],
        ),
      ),
      stickyFooter: Container(
        color: GFColors.SUCCESS,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Get in touch',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              'info@tech4mm.com',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ],
        ),
      ),
      stickyFooterHeight: 50,
    );
  }
}
