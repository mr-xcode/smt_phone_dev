import 'package:flutter/material.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/button/gf_button_bar.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:smt_phonesh_dev/app/modules/pricing/widgets/show_confirm_dialog.dart';

GFCard pricingCard(BuildContext context, String duration, String pricing) {
  return GFCard(
    padding: EdgeInsets.only(bottom: 8),
    color: Colors.white60,
    title: GFListTile(
      avatar: GFAvatar(
        backgroundImage: AssetImage('assets/logo/logo.png'),
      ),
      title: Text(
        '${duration}:',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
      subTitle: Text(
        '${pricing} MMK',
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900),
      ),
    ),
    content: const Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'Key: ',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Text(
          '* * * * * * * * * *',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        Icon(
          Icons.check,
          color: Colors.green,
        ),
      ],
    ),
    buttonBar: GFButtonBar(
      children: <Widget>[
        GFButton(
          color: GFColors.FOCUS,
          onPressed: () {
            showConfirmDialog(context, duration, pricing);
          },
          text: 'ရယူရန်',
        ),
      ],
    ),
  );
}
