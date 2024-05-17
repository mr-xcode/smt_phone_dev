import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';

class ApproveLicenseController extends GetxController {
  QuerySnapshot? buyingUsersQuerySnapshot;
  QuerySnapshot? usersQuerySnapshot;
  var isLoaded = false.obs;
  var isUserLoaded = false.obs;

  var username = ''.obs;
  var email = ''.obs;
  var phone = ''.obs;
  var profileUrl = ''.obs;

  @override
  void onInit() {
    super.onInit();
    refreshData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fetchUserData(String userId) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    if (documentSnapshot.exists) {
      Map<String, dynamic> data = documentSnapshot.data()!;
      // Access the data fields
      username.value = data['username'];
      email.value = data['email'];
      phone.value = data['phoneNumber'];
      profileUrl.value = data['imageUrl'];
      isUserLoaded.value = true;
      update();
    } else {
      Get.snackbar("Error", "loading error.");
    }
  }

  void updateIsChecked(String userId) async {
    try {
      final DocumentReference userRef =
          FirebaseFirestore.instance.collection('buyingUsers').doc(userId);

      await userRef.update({'isChecked': true});

      Get.snackbar("Removed request", "-", backgroundColor: GFColors.DANGER);
      Get.offAllNamed('/admin-panel');
    } catch (error) {
      //print('Failed to update isChecked');
      Get.snackbar("Error", "Try again later");
    }
  }

  void approveUser(String userId, int duration) async {
    DateTime now = DateTime.now();
    int day = now.day;
    int month = now.month;
    int year = now.year;

    if (month + duration > 12) {
      month = month + duration - 12;
      year = year + 1;
    } else {
      month = month + duration;
    }
    DateTime expireDate = DateTime(year, month, day);

    try {
      // update role and expire date on users collection
      final DocumentReference userRef =
          FirebaseFirestore.instance.collection('users').doc(userId);
      await userRef.update({'expireOn': expireDate});
      await userRef.update({'role': 'premium'});

      // update buyingUser collection
      final DocumentReference buyingUserRef =
          FirebaseFirestore.instance.collection('buyingUsers').doc(userId);
      await buyingUserRef.update({'isChecked': true});

      Get.snackbar("License Approved", "-", backgroundColor: GFColors.SUCCESS);
      Get.offAllNamed('/admin-panel');
    } catch (e) {
      Get.snackbar("Error", "Try again later");
    }
  }

  void refreshData() async {
    try {
      buyingUsersQuerySnapshot = await FirebaseFirestore.instance
          .collection('buyingUsers')
          .where('isChecked', isEqualTo: false)
          .get();

      isLoaded.value = true;
    } catch (e) {
      Get.snackbar("Error", "Try again later");
    }
  }
}
