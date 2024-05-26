import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:smt_phonesh_dev/app/modules/admin_add_new/controllers/admin_add_new_controller.dart';
import 'package:smt_phonesh_dev/app/modules/admin_add_new/controllers/gridview_controll_controller.dart';

class MyGridview {
  final _gridview_controller = Get.put(GridviewControllController());
  final _home_controller = Get.find<AdminAddNewController>();
  GridView showMyGridview() {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      childAspectRatio: 2 / 1,
      mainAxisSpacing: 30,
      crossAxisSpacing: 20,
      children: [
        // 1
        const Text("9008 & MTK Mode:"),
        Obx(
          () => GFButton(
              onPressed: _gridview_controller.ismtk9008ChooseEnabled.value
                  ? () {
                      _gridview_controller.handleChooseFile('9008 & MTK Mode');
                    }
                  : null,
              text: _gridview_controller.mtk9008FileText.value,
              color: GFColors.INFO),
        ),
        Obx(
          () => GFButton(
            onPressed: _gridview_controller.ismtk9008Enabled.value
                ? () {
                    _gridview_controller.fileUplod(
                        _home_controller.selectedBrand.value,
                        _home_controller.selectedModel.value,
                        "9008 & MTK Mode");
                  }
                : null,
            text: _gridview_controller.mtk9008UploadText.value,
            color: GFColors.FOCUS,
          ),
        ),

        // 2
        const Text("Audio:"),
        Obx(
          () => GFButton(
              onPressed: _gridview_controller.isAudioChooseEnabled.value
                  ? () {
                      _gridview_controller.handleChooseFile("Audio");
                    }
                  : null,
              text: _gridview_controller.audioFileText.value,
              color: GFColors.INFO),
        ),
        Obx(
          () => GFButton(
            onPressed: _gridview_controller.isAudioEnabled.value
                ? () {
                    _gridview_controller.fileUplod(
                        _home_controller.selectedBrand.value,
                        _home_controller.selectedModel.value,
                        "Audio");
                  }
                : null,
            text: _gridview_controller.audioUploadText.value,
            color: GFColors.FOCUS,
          ),
        ),

        // 3
        const Text("Back Cam:"),
        Obx(
          () => GFButton(
              onPressed: _gridview_controller.isBackcamChooseEnabled.value
                  ? () {
                      _gridview_controller.handleChooseFile('Back Cam');
                    }
                  : null,
              text: _gridview_controller.backcamFileText.value,
              color: GFColors.INFO),
        ),
        Obx(
          () => GFButton(
            onPressed: _gridview_controller.isBackcamEnabled.value
                ? () {
                    _gridview_controller.fileUplod(
                        _home_controller.selectedBrand.value,
                        _home_controller.selectedModel.value,
                        "Back Cam");
                  }
                : null,
            text: _gridview_controller.backcamUploadText.value,
            color: GFColors.FOCUS,
          ),
        ),

        // 4
        const Text("Backlight:"),
        Obx(
          () => GFButton(
              onPressed: _gridview_controller.isBacklightChooseEnabled.value
                  ? () {
                      _gridview_controller.handleChooseFile('Backlight');
                    }
                  : null,
              text: _gridview_controller.backcamFileText.value,
              color: GFColors.INFO),
        ),
        Obx(
          () => GFButton(
            onPressed: _gridview_controller.isBacklightEnabled.value
                ? () {
                    _gridview_controller.fileUplod(
                        _home_controller.selectedBrand.value,
                        _home_controller.selectedModel.value,
                        "Backlight");
                  }
                : null,
            text: _gridview_controller.backlightUploadText.value,
            color: GFColors.FOCUS,
          ),
        ),

        // 5
        const Text("Block Diagram:"),
        Obx(
          () => GFButton(
              onPressed: _gridview_controller.isBlockDragramChooseEnabled.value
                  ? () {
                      _gridview_controller.handleChooseFile('Block Diagram');
                    }
                  : null,
              text: _gridview_controller.blockDragramFileText.value,
              color: GFColors.INFO),
        ),
        Obx(
          () => GFButton(
            onPressed: _gridview_controller.isBlockDragramEnabled.value
                ? () {
                    _gridview_controller.fileUplod(
                        _home_controller.selectedBrand.value,
                        _home_controller.selectedModel.value,
                        "Block Diagram");
                  }
                : null,
            text: _gridview_controller.blockDragramUploadText.value,
            color: GFColors.FOCUS,
          ),
        ),

        // 6
        const Text("Charger:"),
        Obx(
          () => GFButton(
              onPressed: _gridview_controller.isChargerChooseEnabled.value
                  ? () {
                      _gridview_controller.handleChooseFile("Charger");
                    }
                  : null,
              text: _gridview_controller.chargerFileText.value,
              color: GFColors.INFO),
        ),
        Obx(
          () => GFButton(
            onPressed: _gridview_controller.isChargerEnabled.value
                ? () {
                    _gridview_controller.fileUplod(
                        _home_controller.selectedBrand.value,
                        _home_controller.selectedModel.value,
                        "Charger");
                  }
                : null,
            text: _gridview_controller.chargerUplodText.value,
            color: GFColors.FOCUS,
          ),
        ),

        // 7
        const Text("CPU Vol:"),
        Obx(
          () => GFButton(
              onPressed: _gridview_controller.isCpuvolChooseEnabled.value
                  ? () {
                      _gridview_controller.handleChooseFile('CPU Vol');
                    }
                  : null,
              text: _gridview_controller.cpuvolFileText.value,
              color: GFColors.INFO),
        ),
        Obx(
          () => GFButton(
            onPressed: _gridview_controller.isCpuvolEnabled.value
                ? () {
                    _gridview_controller.fileUplod(
                        _home_controller.selectedBrand.value,
                        _home_controller.selectedModel.value,
                        "CPU Vol");
                  }
                : null,
            text: _gridview_controller.cpuvolUploadText.value,
            color: GFColors.FOCUS,
          ),
        ),

        // 8
        const Text("Ear:"),
        Obx(
          () => GFButton(
              onPressed: _gridview_controller.isEarChooseEnabled.value
                  ? () {
                      _gridview_controller.handleChooseFile('Ear');
                    }
                  : null,
              text: _gridview_controller.earFileText.value,
              color: GFColors.INFO),
        ),
        Obx(
          () => GFButton(
            onPressed: _gridview_controller.isEarEnabled.value
                ? () {
                    _gridview_controller.fileUplod(
                        _home_controller.selectedBrand.value,
                        _home_controller.selectedModel.value,
                        "Ear");
                  }
                : null,
            text: _gridview_controller.earUploadText.value,
            color: GFColors.FOCUS,
          ),
        ),

        // 9
        const Text("EMMC-Vol:"),
        Obx(
          () => GFButton(
              onPressed: _gridview_controller.isEmmcvolChooseEnabled.value
                  ? () {
                      _gridview_controller.handleChooseFile('EMMC Vol');
                    }
                  : null,
              text: _gridview_controller.emmcvolFileText.value,
              color: GFColors.INFO),
        ),
        Obx(
          () => GFButton(
            onPressed: _gridview_controller.isEmmcvolEnabled.value
                ? () {
                    _gridview_controller.fileUplod(
                        _home_controller.selectedBrand.value,
                        _home_controller.selectedModel.value,
                        "EMMC Vol");
                  }
                : null,
            text: _gridview_controller.emmcvolUploadText.value,
            color: GFColors.FOCUS,
          ),
        ),

        // 10
        const Text("Finger Print:"),
        Obx(
          () => GFButton(
              onPressed: _gridview_controller.isFingerChooseEnabled.value
                  ? () {
                      _gridview_controller.handleChooseFile("Finger Print");
                    }
                  : null,
              text: _gridview_controller.fingerFileText.value,
              color: GFColors.INFO),
        ),
        Obx(
          () => GFButton(
            onPressed: _gridview_controller.isFingerEnabled.value
                ? () {
                    _gridview_controller.fileUplod(
                        _home_controller.selectedBrand.value,
                        _home_controller.selectedModel.value,
                        "Finger Print");
                  }
                : null,
            text: _gridview_controller.fingerUploadText.value,
            color: GFColors.FOCUS,
          ),
        ),

        // 11
        Text("Flash:"),
        Obx(
          () => GFButton(
              onPressed: _gridview_controller.isFlashChooseEnabled.value
                  ? () {
                      _gridview_controller.handleChooseFile('Flash');
                    }
                  : null,
              text: _gridview_controller.flashFileText.value,
              color: GFColors.INFO),
        ),
        Obx(
          () => GFButton(
            onPressed: _gridview_controller.isFlashEnabled.value
                ? () {
                    _gridview_controller.fileUplod(
                        _home_controller.selectedBrand.value,
                        _home_controller.selectedModel.value,
                        "Flash");
                  }
                : null,
            text: _gridview_controller.flashUploadText.value,
            color: GFColors.FOCUS,
          ),
        ),
        // 12
        const Text("Front Cam:"),
        Obx(
          () => GFButton(
              onPressed: _gridview_controller.isFrontcamChooseEnabled.value
                  ? () {
                      _gridview_controller.handleChooseFile('Front Cam');
                    }
                  : null,
              text: _gridview_controller.frontcamFileText.value,
              color: GFColors.INFO),
        ),
        Obx(
          () => GFButton(
            onPressed: _gridview_controller.isFrontcamEnabled.value
                ? () {
                    _gridview_controller.fileUplod(
                        _home_controller.selectedBrand.value,
                        _home_controller.selectedModel.value,
                        "Front Cam");
                  }
                : null,
            text: _gridview_controller.frontcamUploadText.value,
            color: GFColors.FOCUS,
          ),
        ),

        // 13
        const Text("Hand Free:"),
        Obx(
          () => GFButton(
              onPressed: _gridview_controller.isHandfreeChooseEnabled.value
                  ? () {
                      _gridview_controller.handleChooseFile('Hand Free');
                    }
                  : null,
              text: _gridview_controller.handfreeFileText.value,
              color: GFColors.INFO),
        ),
        Obx(
          () => GFButton(
            onPressed: _gridview_controller.isHandfreeEnabled.value
                ? () {
                    _gridview_controller.fileUplod(
                        _home_controller.selectedBrand.value,
                        _home_controller.selectedModel.value,
                        "Hand Free");
                  }
                : null,
            text: _gridview_controller.handfreeUploadText.value,
            color: GFColors.FOCUS,
          ),
        ),

        // 14
        const Text("LCD:"),
        Obx(
          () => GFButton(
              onPressed: _gridview_controller.isLcdChooseEnabled.value
                  ? () {
                      _gridview_controller.handleChooseFile('LCD');
                    }
                  : null,
              text: _gridview_controller.lcdFileText.value,
              color: GFColors.INFO),
        ),
        Obx(
          () => GFButton(
            onPressed: _gridview_controller.isLcdEnabled.value
                ? () {
                    _gridview_controller.fileUplod(
                        _home_controller.selectedBrand.value,
                        _home_controller.selectedModel.value,
                        "LCD");
                  }
                : null,
            text: _gridview_controller.lcdUploadText.value,
            color: GFColors.FOCUS,
          ),
        ),

        // 15
        const Text("Mic:"),
        Obx(
          () => GFButton(
              onPressed: _gridview_controller.isMicChooseEnabled.value
                  ? () {
                      _gridview_controller.handleChooseFile('Mic');
                    }
                  : null,
              text: _gridview_controller.micFileText.value,
              color: GFColors.INFO),
        ),
        Obx(
          () => GFButton(
            onPressed: _gridview_controller.isMicEnabled.value
                ? () {
                    _gridview_controller.fileUplod(
                        _home_controller.selectedBrand.value,
                        _home_controller.selectedModel.value,
                        "Mic");
                  }
                : null,
            text: _gridview_controller.micUploadText.value,
            color: GFColors.FOCUS,
          ),
        ),
        // 16
        const Text("Network:"),
        Obx(
          () => GFButton(
              onPressed: _gridview_controller.isNetworkChooseEnabled.value
                  ? () {
                      _gridview_controller.handleChooseFile('Network');
                    }
                  : null,
              text: _gridview_controller.networkFileText.value,
              color: GFColors.INFO),
        ),
        Obx(
          () => GFButton(
            onPressed: _gridview_controller.isNetworkEnabled.value
                ? () {
                    _gridview_controller.fileUplod(
                        _home_controller.selectedBrand.value,
                        _home_controller.selectedModel.value,
                        "Network");
                  }
                : null,
            text: _gridview_controller.networkUploadText.value,
            color: GFColors.FOCUS,
          ),
        ),

        // 17
        const Text("PCB Board:"),
        Obx(
          () => GFButton(
              onPressed: _gridview_controller.ispcbboardChooseEnabled.value
                  ? () {
                      _gridview_controller.handleChooseFile('PCB Board');
                    }
                  : null,
              text: _gridview_controller.pcbboardFileText.value,
              color: GFColors.INFO),
        ),
        Obx(
          () => GFButton(
            onPressed: _gridview_controller.ispcbboardEnabled.value
                ? () {
                    _gridview_controller.fileUplod(
                        _home_controller.selectedBrand.value,
                        _home_controller.selectedModel.value,
                        "PCB Board");
                  }
                : null,
            text: _gridview_controller.pcbboardUploadText.value,
            color: GFColors.FOCUS,
          ),
        ),

        // 18
        const Text("SD Card:"),
        Obx(
          () => GFButton(
              onPressed: _gridview_controller.isSdcardChooseEnabled.value
                  ? () {
                      _gridview_controller.handleChooseFile('SD Card');
                    }
                  : null,
              text: _gridview_controller.sdcardFileText.value,
              color: GFColors.INFO),
        ),
        Obx(
          () => GFButton(
            onPressed: _gridview_controller.isSdcardEnabled.value
                ? () {
                    _gridview_controller.fileUplod(
                        _home_controller.selectedBrand.value,
                        _home_controller.selectedModel.value,
                        "SD Card");
                  }
                : null,
            text: _gridview_controller.sdcardUploadText.value,
            color: GFColors.FOCUS,
          ),
        ),

        // 19
        const Text("Sensor:"),
        Obx(
          () => GFButton(
              onPressed: _gridview_controller.isSensorChooseEnabled.value
                  ? () {
                      _gridview_controller.handleChooseFile('Sensor');
                    }
                  : null,
              text: _gridview_controller.sensorFileText.value,
              color: GFColors.INFO),
        ),
        Obx(
          () => GFButton(
            onPressed: _gridview_controller.isSensorEnabled.value
                ? () {
                    _gridview_controller.fileUplod(
                        _home_controller.selectedBrand.value,
                        _home_controller.selectedModel.value,
                        "Sensor");
                  }
                : null,
            text: _gridview_controller.sensorUploadText.value,
            color: GFColors.FOCUS,
          ),
        ),

        // 20
        const Text("Sim Card:"),
        Obx(
          () => GFButton(
              onPressed: _gridview_controller.isSimcardChooseEnabled.value
                  ? () {
                      _gridview_controller.handleChooseFile('Sim Card');
                    }
                  : null,
              text: _gridview_controller.simcardFileText.value,
              color: GFColors.INFO),
        ),
        Obx(
          () => GFButton(
            onPressed: _gridview_controller.isSimcardEnabled.value
                ? () {
                    _gridview_controller.fileUplod(
                        _home_controller.selectedBrand.value,
                        _home_controller.selectedModel.value,
                        "Sim Card");
                  }
                : null,
            text: _gridview_controller.simcardUploadText.value,
            color: GFColors.FOCUS,
          ),
        ),

        // 21
        const Text("Speaker:"),
        Obx(
          () => GFButton(
              onPressed: _gridview_controller.isSpeakerChooseEnabled.value
                  ? () {
                      _gridview_controller.handleChooseFile('Speaker');
                    }
                  : null,
              text: _gridview_controller.speakerFileText.value,
              color: GFColors.INFO),
        ),
        Obx(
          () => GFButton(
            onPressed: _gridview_controller.isSpeakerEnabled.value
                ? () {
                    _gridview_controller.fileUplod(
                        _home_controller.selectedBrand.value,
                        _home_controller.selectedModel.value,
                        "Speaker");
                  }
                : null,
            text: _gridview_controller.speakerUploadText.value,
            color: GFColors.FOCUS,
          ),
        ),

        // 22
        const Text("Touch:"),
        Obx(
          () => GFButton(
              onPressed: _gridview_controller.isTouchChooseEnabled.value
                  ? () {
                      _gridview_controller.handleChooseFile('Touch');
                    }
                  : null,
              text: _gridview_controller.touchFileText.value,
              color: GFColors.INFO),
        ),
        Obx(
          () => GFButton(
            onPressed: _gridview_controller.isTouchEnabled.value
                ? () {
                    _gridview_controller.fileUplod(
                        _home_controller.selectedBrand.value,
                        _home_controller.selectedModel.value,
                        "Touch");
                  }
                : null,
            text: _gridview_controller.touchUploadText.value,
            color: GFColors.FOCUS,
          ),
        ),

        // 23
        const Text("Wifi Bt Gps:"),
        Obx(
          () => GFButton(
              onPressed: _gridview_controller.isWifiChooseEnabled.value
                  ? () {
                      _gridview_controller.handleChooseFile('Wifi Bt Gps');
                    }
                  : null,
              text: _gridview_controller.wifiFileText.value,
              color: GFColors.INFO),
        ),
        Obx(
          () => GFButton(
            onPressed: _gridview_controller.isWifiEnabled.value
                ? () {
                    _gridview_controller.fileUplod(
                        _home_controller.selectedBrand.value,
                        _home_controller.selectedModel.value,
                        "Wifi Bt Gps");
                  }
                : null,
            text: _gridview_controller.wifiUploadText.value,
            color: GFColors.FOCUS,
          ),
        ),
      ],
    );
  }
}
