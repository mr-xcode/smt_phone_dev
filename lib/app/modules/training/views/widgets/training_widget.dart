// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/button/gf_button_bar.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/size/gf_size.dart';

class TrainingWidget extends StatelessWidget {
  String title;
  String content;
  String imageUrl;

  TrainingWidget({
    Key? key,
    required this.title,
    required this.content,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GFCard(
      content: Text(
        content,
        textAlign: TextAlign.justify,
      ),
      image: Image.asset(
        imageUrl,
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      showImage: true,
      title: GFListTile(
        padding: EdgeInsets.symmetric(horizontal: 0),
        margin: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
        titleText: title,
      ),
      buttonBar: GFButtonBar(
        children: <Widget>[
          GFButton(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            elevation: 2.0,
            shape: GFButtonShape.pills,
            size: GFSize.LARGE,
            onPressed: () {
              Get.snackbar(
                "Notice",
                "Comming soon...",
                backgroundColor: GFColors.SUCCESS,
                snackPosition: SnackPosition.BOTTOM,
                duration: Duration(seconds: 3),
              );
            },
            color: GFColors.FOCUS,
            child: Text(
              'Start Learning',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          GFAvatar(
            size: GFSize.SMALL,
            backgroundColor: GFColors.PRIMARY,
            child: Icon(
              Icons.thumb_up,
              color: Colors.white,
            ),
          ),
          GFAvatar(
            size: GFSize.SMALL,
            backgroundColor: GFColors.SECONDARY,
            child: Icon(
              Icons.message,
              color: Colors.white,
            ),
          ),
          GFAvatar(
            size: GFSize.SMALL,
            backgroundColor: GFColors.SUCCESS,
            child: Icon(
              Icons.share,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
