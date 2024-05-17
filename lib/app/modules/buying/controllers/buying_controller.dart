import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:smt_phonesh_dev/app/data/user.model.dart';

class BuyingController extends GetxController {
  var isSSImageChooseSuccess = false.obs;
  late File file;
  Rx<UserModel>? user;

  @override
  void onInit() async {
    super.onInit();
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .get();
    Map<String, dynamic> data = documentSnapshot.data()!;
    user = UserModel(
      userName: data['username'],
      userEmail: data['email'],
      userPhoneNumber: data['phoneNumber'],
      userAddress: data['address'],
      userProfileUrl: data['imageUrl'],
    ).obs;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> chooseImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      file = File(result.files.single.path!);
      isSSImageChooseSuccess.value = true;
      Get.snackbar("Success", "Image Choosen...",
          backgroundColor: GFColors.SUCCESS);
    } else {
      // User canceled the picker
      Get.snackbar("Cancel", "No Image", backgroundColor: GFColors.DANGER);
    }
  }

  Future<void> sendSS(String duration, String price) async {
    User? currentUser = await FirebaseAuth.instance.currentUser;
    String userId = currentUser!.uid;
    String imageUrl = await uploadProfileImage(file);

    createUserInDb(userId, imageUrl, duration, price);
    Get.snackbar("Success",
        "လုပ်ဆောင်ချက်အောင်မြင်ပါသည်။ \nAdmin Team မှ ငွေလွဲအတည်ပြုပြီးပါက \nလိုင်စင်ကီးကို ထည့်သွင်းထားပေးပါမည်။ \nအတည်ပြုရန် ကြာချိန် \nနာရီဝက်မှ ၁၂ နာရီအထိကြာနိုင်ပါသည်။",
        duration: Duration(seconds: 30));
    Get.offAllNamed('/home');
  }

  Future<String> uploadProfileImage(File imageFile) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference storageRef = storage.ref();
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference imageRef = storageRef.child('moneyTransferSS/$fileName');

    UploadTask uploadTask = imageRef.putFile(imageFile);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

    String imageUrl = await taskSnapshot.ref.getDownloadURL();
    return imageUrl;
  }

  Future<void> createUserInDb(
      String userId, String imageUrl, String duration, String price) async {
    int _duration = 0;
    switch (duration) {
      case '1 Month':
        _duration = 1;
        break;
      case '3 Months':
        _duration = 3;
        break;
      case '6 Months':
        _duration = 6;
        break;
      case '1 Year':
        _duration = 12;
        break;
    }
    try {
      await FirebaseFirestore.instance
          .collection('buyingUsers')
          .doc(userId)
          .set(
        {
          'userId': userId,
          'imageUrl': imageUrl,
          'duration': _duration,
          'price': price,
          'isChecked': false,
          'profileUrl': user?.value.userProfileUrl,
          'userName': user?.value.userName,
          'phoneNumber': user?.value.userPhoneNumber,
          'email': user?.value.userEmail,
        },
      );
    } catch (e) {
      Get.snackbar("Error", "Cannot create document!");
    }
  }
}
