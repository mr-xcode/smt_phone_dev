import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:smt_phonesh_dev/app/modules/admin_panel/controllers/admin_panel_controller.dart';

class AdminDetailedViewController extends GetxController {
  //TODO: Implement AdminDetailedViewController

  final storageRef = FirebaseStorage.instance.ref();

  RxList<dynamic> stringSubModelList = [].obs;
  RxList<dynamic> stringDetailedlList = [].obs;

  RxList<dynamic> myList = [].obs;
  String result = '';

  final mController = Get.put(AdminPanelController());

  var isLoading = true.obs;

  @override
  void onInit() async {
    super.onInit();
    isLoading.value = true;
    try {
      await getSubModelList();
    } catch (e) {
      print(e);
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

  Future<void> getSubModelList() async {
    final listResult = await storageRef
        .child(
            '${mController.selectedBrand.value}/${mController.modelDetailedTapped.value}')
        .listAll();

    for (var prefix in listResult.prefixes) {
      stringSubModelList.value.add(
        prefix.name.toString(),
      );
      await getDetailedlList(prefix.name.toString());
    }
    isLoading.value = false;
  }

  Future<void> getDetailedlList(String title) async {
    final listResult = await storageRef
        .child(
            '${mController.selectedBrand.value}/${mController.modelDetailedTapped.value}/${title}')
        .listAll();
    stringDetailedlList.clear();
    result = '';
    for (var prefix in listResult.items) {
      result += prefix.name.toString() + ',\n';
    }
    myList.add(result);
  }

  Future<void> deleteFolderRecursive(String folderPath) async {
    final storage = FirebaseStorage.instance;
    final ListResult result = await storage.ref(folderPath).listAll();
    for (final Reference ref in result.items) {
      await ref.delete();
    }

    // Recursively delete subfolders
    for (final Reference ref in result.prefixes) {
      await deleteFolderRecursive(ref.fullPath);
    }
  }
}
