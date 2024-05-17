import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:smt_phonesh_dev/app/modules/admin_add_new/controllers/admin_add_new_controller.dart';

class MyGFDrawer {
  final _auth = FirebaseAuth.instance;
  final controller = Get.put(AdminAddNewController());
  GFDrawer showMyGFDrawer() {
    return GFDrawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          GFDrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff0C89CE),
            ),
            currentAccountPicture: const GFAvatar(
              backgroundImage: NetworkImage(
                  "https://zipmex.com/static/d1af016df3c4adadee8d863e54e82331/1bbe7/Twitter-NFT-profile.jpg"),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 8,
                ),
                Text(
                  'UserName: ${_auth.currentUser?.displayName ?? 'SMT Admin'}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Email: ${_auth.currentUser?.email}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ...controller.brandList.map(
            (item) => ListTile(
              title: Text(
                item,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                controller.handleListTileTap(item);
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),

          //secondary
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 21),
            child: GFButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.signOut();
                  SystemNavigator.pop();
                } catch (e) {
                  Get.snackbar("Error", "Signout error. Try again later!");
                }
              },
              text: "SignOut && Close",
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
              blockButton: true,
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              color: Color(0xff454E54),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
