import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smt_phonesh_dev/app/data/color_consts.dart';
import 'package:smt_phonesh_dev/app/data/string_consts.dart';
import 'package:smt_phonesh_dev/app/modules/splash/bindings/splash_binding.dart';
import 'package:smt_phonesh_dev/firebase_options.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringConsts.appName,
      initialRoute: AppPages.INITIAL,
      initialBinding: SplashBinding(),
      getPages: AppPages.routes,
      theme: ThemeData(
        primaryColor: ColorConsts.priColor,
        scaffoldBackgroundColor: ColorConsts.scaffoldBgColor,
        useMaterial3: true,
      ),
    ),
  );
}
