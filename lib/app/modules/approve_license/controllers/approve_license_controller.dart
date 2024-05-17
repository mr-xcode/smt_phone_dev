import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

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
  void onInit() async {
    super.onInit();

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
}
