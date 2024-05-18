import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final CollectionReference _collection =
      FirebaseFirestore.instance.collection('users');

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController licensekeyController = TextEditingController();

  var username = ''.obs;
  var email = ''.obs;
  var phone = ''.obs;
  var address = ''.obs;
  var role = ''.obs;
  var profileUrl = ''.obs;

  final Rx<bool> isChecked = true.obs;
  late StreamSubscription<DocumentSnapshot<Map<String, dynamic>>> _subscription;

  HomeController() {
    ever(isChecked, (_) => update());
  }

  @override
  void onInit() {
    super.onInit();
    _fetchIsChecked();
  }

  @override
  void onReady() async {
    super.onReady();
    DocumentSnapshot documentSnapshot =
        await _collection.doc(_auth.currentUser?.uid).get();

    username.value = documentSnapshot.get('username');
    email.value = documentSnapshot.get('email');
    phone.value = documentSnapshot.get('phoneNumber');
    address.value = documentSnapshot.get('address');
    role.value = documentSnapshot.get('role');
    profileUrl.value = documentSnapshot.get('imageUrl');
  }

  @override
  void onClose() {
    _subscription.cancel();
    super.onClose();
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    }
  }

  void _fetchIsChecked() {
    _subscription = FirebaseFirestore.instance
        .collection('buyingUsers')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .listen((snapshot) {
      isChecked.value = snapshot.data()?['isChecked'] ?? true;
    });
  }
}
