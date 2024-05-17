import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showConfirmDialog(BuildContext context, String duration, String price) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('အတည်ပြုချက်'),
        content: Text(
            'လိုင်စင် ဝယ်ယူရန်အတွက် ကျသင့်ငွေကို Kpay (သို့မဟုတ်) Wave မှ လွဲပေးရပါမည်။ ၄င်းနောက် ScreenShoot (ss) ပို့ပေးရပါမည်။ \nAre You Ready?'),
        actions: <Widget>[
          TextButton(
            child: Text('နောက်မှ'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
          TextButton(
            child: Text('ယခုဘဲ ဝယ်ယူမည်!'),
            onPressed: () {
              // Perform delete operation
              //Get.snackbar("Success", "Key generated && copied");
              Navigator.of(context).pop(); // Close the dialog
              Get.toNamed('/buying', arguments: [duration, price]);
            },
          ),
        ],
      );
    },
  );
}
