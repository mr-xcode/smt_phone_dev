import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:smt_phonesh_dev/app/modules/admin_add_new/controllers/admin_add_new_controller.dart';
import 'package:smt_phonesh_dev/app/modules/admin_panel/controllers/admin_panel_controller.dart';

class GridviewControllController extends GetxController {
  //TODO: Implement GridviewControllController

  late File uploadFile;
  late String filename;
  late String fileext;
  final storageRef = FirebaseStorage.instance.ref();
  final selectedFile = [].obs;
  final isLoader = false.obs;

  // Upload Buttons
  final isChargerEnabled = false.obs;
  final isAudioEnabled = false.obs;
  final isEarEnabled = false.obs;
  final isMicEnabled = false.obs;
  final isSpeakerEnabled = false.obs;

  final isSimcardEnabled = false.obs;
  final isSdcardEnabled = false.obs;
  final isLcdEnabled = false.obs;
  final isBacklightEnabled = false.obs;
  final isTouchEnabled = false.obs;

  final isNetworkEnabled = false.obs;
  final isWifiEnabled = false.obs;
  final isBackcamEnabled = false.obs;
  final isFrontcamEnabled = false.obs;
  final isCpuvolEnabled = false.obs;

  final isEmmcvolEnabled = false.obs;
  final isFingerEnabled = false.obs;
  final isHandfreeEnabled = false.obs;
  final isFlashEnabled = false.obs;
  final isSensorEnabled = false.obs;

  final ismtk9008Enabled = false.obs;
  final isBlockDragramEnabled = false.obs;
  final ispcbboardEnabled = false.obs;

  // File Choose Buttons
  final isChargerChooseEnabled = true.obs;
  final isAudioChooseEnabled = true.obs;
  final isEarChooseEnabled = true.obs;
  final isMicChooseEnabled = true.obs;
  final isSpeakerChooseEnabled = true.obs;

  final isSimcardChooseEnabled = true.obs;
  final isSdcardChooseEnabled = true.obs;
  final isLcdChooseEnabled = true.obs;
  final isBacklightChooseEnabled = true.obs;
  final isTouchChooseEnabled = true.obs;

  final isNetworkChooseEnabled = true.obs;
  final isWifiChooseEnabled = true.obs;
  final isBackcamChooseEnabled = true.obs;
  final isFrontcamChooseEnabled = true.obs;
  final isCpuvolChooseEnabled = true.obs;

  final isEmmcvolChooseEnabled = true.obs;
  final isFingerChooseEnabled = true.obs;
  final isHandfreeChooseEnabled = true.obs;
  final isFlashChooseEnabled = true.obs;
  final isSensorChooseEnabled = true.obs;

  final ismtk9008ChooseEnabled = true.obs;
  final isBlockDragramChooseEnabled = true.obs;
  final ispcbboardChooseEnabled = true.obs;

  // Upload Button Text
  final chargerUplodText = "Upload".obs;
  final audioUploadText = "Upload".obs;
  final earUploadText = "Upload".obs;
  final micUploadText = "Upload".obs;
  final speakerUploadText = "Upload".obs;

  final simcardUploadText = "Upload".obs;
  final sdcardUploadText = "Upload".obs;
  final lcdUploadText = "Upload".obs;
  final backlightUploadText = "Upload".obs;
  final touchUploadText = "Upload".obs;

  final networkUploadText = "Upload".obs;
  final wifiUploadText = "Upload".obs;
  final backcamUploadText = "Upload".obs;
  final frontcamUploadText = "Upload".obs;
  final cpuvolUploadText = "Upload".obs;

  final emmcvolUploadText = "Upload".obs;
  final fingerUploadText = "Upload".obs;
  final handfreeUploadText = "Upload".obs;
  final flashUploadText = "Upload".obs;
  final sensorUploadText = "Upload".obs;

  final mtk9008UploadText = "Upload".obs;
  final blockDragramUploadText = "Upload".obs;
  final pcbboardUploadText = "Upload".obs;

  // Choose File Button Text
  final chargerFileText = "Choose Files...".obs;
  final audioFileText = "Choose Files...".obs;
  final earFileText = "Choose Files...".obs;
  final micFileText = "Choose Files...".obs;
  final speakerFileText = "Choose Files...".obs;

  final simcardFileText = "Choose Files...".obs;
  final sdcardFileText = "Choose Files...".obs;
  final lcdFileText = "Choose Files...".obs;
  final backlightFileText = "Choose Files...".obs;
  final touchFileText = "Choose Files...".obs;

  final networkFileText = "Choose Files...".obs;
  final wifiFileText = "Choose Files...".obs;
  final backcamFileText = "Choose Files...".obs;
  final frontcamFileText = "Choose Files...".obs;
  final cpuvolFileText = "Choose Files...".obs;

  final emmcvolFileText = "Choose Files...".obs;
  final fingerFileText = "Choose Files...".obs;
  final handfreeFileText = "Choose Files...".obs;
  final flashFileText = "Choose Files...".obs;
  final sensorFileText = "Choose Files...".obs;

  final mtk9008FileText = "Choose File...".obs;
  final blockDragramFileText = "Choose File...".obs;
  final pcbboardFileText = "Choose File...".obs;

  final _home_controller = Get.put(AdminAddNewController());

  void handleChooseFile(String title) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc', 'jpeg', 'png'],
    );

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();

      selectedFile.value = files;

      switch (title) {
        case "Charger":
          // Enableing Upload button
          isChargerEnabled.value = true;

          // Choose File Button text change and Disable
          isChargerChooseEnabled.value = false;
          chargerFileText.value = "Choosen...";
          break;
        case "Audio":
          isAudioEnabled.value = true;

          // Choose File Button text change and Disable
          isAudioChooseEnabled.value = false;
          audioFileText.value = "Choosen...";
          break;
        case "Ear":
          isEarEnabled.value = true;

          // Choose File Button text change and Disable
          isEarChooseEnabled.value = false;
          earFileText.value = "Choosen...";
          break;
        case "Mic":
          isMicEnabled.value = true;

          // Choose File Button text change and Disable
          isMicChooseEnabled.value = false;
          micFileText.value = "Choosen...";
          break;
        case "Speaker":
          isSpeakerEnabled.value = true;

          // Choose File Button text change and Disable
          isSpeakerChooseEnabled.value = false;
          speakerFileText.value = "Choosen...";
          break;
        case "Sim Card":
          isSimcardEnabled.value = true;

          // Choose File Button text change and Disable
          isSimcardChooseEnabled.value = false;
          simcardFileText.value = "Choosen...";
          break;
        case "SD Card":
          isSdcardEnabled.value = true;

          // Choose File Button text change and Disable
          isSdcardChooseEnabled.value = false;
          sdcardFileText.value = "Choosen...";
          break;
        case "LCD":
          isLcdEnabled.value = true;

          // Choose File Button text change and Disable
          isLcdChooseEnabled.value = false;
          lcdFileText.value = "Choosen...";
          break;
        case "Backlight":
          isBacklightEnabled.value = true;

          // Choose File Button text change and Disable
          isBacklightChooseEnabled.value = false;
          backlightFileText.value = "Choosen...";
          break;
        case "Touch":
          isTouchEnabled.value = true;

          // Choose File Button text change and Disable
          isTouchChooseEnabled.value = false;
          touchFileText.value = "Choosen...";
          break;
        case "Network":
          isNetworkEnabled.value = true;

          // Choose File Button text change and Disable
          isNetworkChooseEnabled.value = false;
          networkFileText.value = "Choosen...";
          break;
        case "Wifi Bt Gps":
          isWifiEnabled.value = true;

          // Choose File Button text change and Disable
          isWifiChooseEnabled.value = false;
          wifiFileText.value = "Choosen...";
          break;
        case "Back Cam":
          isBackcamEnabled.value = true;

          // Choose File Button text change and Disable
          isBackcamChooseEnabled.value = false;
          backcamFileText.value = "Choosen...";
          break;
        case "Front Cam":
          isFrontcamEnabled.value = true;

          // Choose File Button text change and Disable
          isFrontcamChooseEnabled.value = false;
          frontcamFileText.value = "Choosen...";
          break;
        case "CPU Vol":
          isCpuvolEnabled.value = true;

          // Choose File Button text change and Disable
          isCpuvolChooseEnabled.value = false;
          cpuvolFileText.value = "Choosen...";
          break;
        case "EMMC Vol":
          isEmmcvolEnabled.value = true;

          // Choose File Button text change and Disable
          isEmmcvolChooseEnabled.value = false;
          emmcvolFileText.value = "Choosen...";
          break;
        case "Finger Print":
          isFingerEnabled.value = true;

          // Choose File Button text change and Disable
          isFingerChooseEnabled.value = false;
          fingerFileText.value = "Choosen...";
          break;
        case "Hand Free":
          isHandfreeEnabled.value = true;

          // Choose File Button text change and Disable
          isHandfreeChooseEnabled.value = false;
          handfreeFileText.value = "Choosen...";
          break;
        case "Flash":
          isFlashEnabled.value = true;

          // Choose File Button text change and Disable
          isFlashChooseEnabled.value = false;
          flashFileText.value = "Choosen...";
          break;
        case "Sensor":
          isSensorEnabled.value = true;

          // Choose File Button text change and Disable
          isSensorChooseEnabled.value = false;
          sensorFileText.value = "Choosen...";
          break;

        case "9008 & MTK Mode":
          ismtk9008Enabled.value = true;

          // Choose File Button text change and Disable
          ismtk9008ChooseEnabled.value = false;
          mtk9008FileText.value = "Choosen...";
          break;

        case "Block Diagram":
          isBlockDragramEnabled.value = true;

          // Choose File Button text change and Disable
          isBlockDragramChooseEnabled.value = false;
          blockDragramFileText.value = "Choosen...";
          break;

        case "PCB Board":
          ispcbboardEnabled.value = true;

          // Choose File Button text change and Disable
          ispcbboardChooseEnabled.value = false;
          pcbboardFileText.value = "Choosen...";
          break;
      }
    } else {
      Get.snackbar("Error", "File Pick Error");
    }
  }

  Future fileUplod(String Brand, String Model, String title) async {
    final brandRef = storageRef.child('${Brand}');
    final modelRef = brandRef.child(_home_controller.selectedModel.value);
    isLoader.value = true;
    try {
      for (File file in selectedFile) {
        filename = file.path.split('/').last;
        uploadFile = File(file.path);
        await modelRef.child("/${title}/${filename}").putFile(uploadFile);
        uploadFile.delete();
      }

      Get.snackbar(
        "Success",
        "Upload done!",
        duration: Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: GFColors.SUCCESS,
      );
      isLoader.value = false;

      switch (title) {
        case "Charger":
          // Upload Button text change and Disable
          isChargerEnabled.value = false;
          chargerUplodText.value = "Done";
          break;
        case "Audio":
          isAudioEnabled.value = false;
          audioUploadText.value = "Done";
          break;
        case "Ear":
          isEarEnabled.value = false;
          earUploadText.value = "Done";
          break;
        case "Mic":
          isMicEnabled.value = false;
          micUploadText.value = "Done";
          break;
        case "Speaker":
          isSpeakerEnabled.value = false;
          speakerUploadText.value = "Done";
          break;
        case "Sim Card":
          isSimcardEnabled.value = false;
          simcardUploadText.value = "Done";
          break;
        case "SD Card":
          isSdcardEnabled.value = false;
          sdcardUploadText.value = "Done";
          break;
        case "LCD":
          isLcdEnabled.value = false;
          lcdUploadText.value = "Done";
          break;
        case "Backlight":
          isBacklightEnabled.value = false;
          backlightUploadText.value = "Done";
          break;
        case "Touch":
          isTouchEnabled.value = false;
          touchUploadText.value = "Done";
          break;
        case "Network":
          isNetworkEnabled.value = false;
          networkUploadText.value = "Done";
          break;
        case "Wifi Bt Gps":
          isWifiEnabled.value = false;
          wifiUploadText.value = "Done";
          break;
        case "Back Cam":
          isBackcamEnabled.value = false;
          backcamUploadText.value = "Done";
          break;
        case "Front Cam":
          isFrontcamEnabled.value = false;
          frontcamUploadText.value = "Done";
          break;
        case "CPU Vol":
          isCpuvolEnabled.value = false;
          cpuvolUploadText.value = "Done";
          break;
        case "EMMC Vol":
          isEmmcvolEnabled.value = false;
          emmcvolUploadText.value = "Done";
          break;
        case "Finger Print":
          isFingerEnabled.value = false;
          fingerUploadText.value = "Done";
          break;
        case "Hand Free":
          isHandfreeEnabled.value = false;
          handfreeUploadText.value = "Done";
          break;
        case "Flash":
          isFlashEnabled.value = false;
          flashUploadText.value = "Done";
          break;
        case "Sensor":
          isSensorEnabled.value = false;
          sensorUploadText.value = "Done";
          break;
        case "9008 & MTK Mode":
          ismtk9008Enabled.value = false;
          mtk9008UploadText.value = "Done";
          break;
        case "Block Diagram":
          isBlockDragramEnabled.value = false;
          blockDragramUploadText.value = "Done";
          break;
        case "PCB Board":
          ispcbboardEnabled.value = false;
          pcbboardUploadText.value = "Done";
          break;
      }
    } catch (e) {
      Get.snackbar("Upload Error", e.toString());
    }
  }
}
