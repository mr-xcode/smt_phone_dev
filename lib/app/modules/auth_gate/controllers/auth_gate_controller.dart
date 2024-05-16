import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthGateController extends GetxController {
  //TODO: Implement AuthGateController

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?> get authStateChanges => _auth.authStateChanges();
  @override
  void onInit() {
    super.onInit();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Get.offNamed('/signin');
      } else {
        String userId = user.uid;
        DocumentReference userDocRef =
            FirebaseFirestore.instance.collection('users').doc(userId);

        userDocRef.get().then((DocumentSnapshot userDoc) {
          if (userDoc.exists) {
            // Get the data from the document
            Map<String, dynamic>? userData =
                userDoc.data() as Map<String, dynamic>?;
            if (userData != null) {
              if (userData['role'] == 'admin') {
                Get.offAllNamed('/admin-panel');
              } else if (userData['role'] == 'premium') {
                Get.offAllNamed('/premium');
              } else {
                Get.offAllNamed('/home');
              }
            }
          } else {
            print('User document does not exist');
          }
        }).catchError((error) {
          print('Error getting user document: $error');
        });
        //Get.offNamed('/home');
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
