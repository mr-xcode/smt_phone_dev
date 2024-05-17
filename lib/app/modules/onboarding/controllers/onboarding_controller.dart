import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingController extends GetxController {
  final List<PageViewModel> onboardingPages = [
    PageViewModel(
      title: 'Welcome',
      body: 'SMT - PhoneSH မှ ကြိုဆိုပါတယ်!',
      image: Image.asset('assets/onboarding/_one.png'),
    ),
    PageViewModel(
      title: 'Features',
      body: 'အစုံလင်ဆုံးသော Schematic Diagram များ။',
      image: Image.asset('assets/onboarding/_two.png'),
    ),
    PageViewModel(
      title: 'Get Started',
      body: 'စတင် လုပ်ဆောင်လိုက်ရအောင်ပါ။',
      image: Image.asset('assets/onboarding/_three.png'),
    ),
  ];

  void completeOnboarding() async {
    Get.offAllNamed('/auth-gate');
  }

  @override
  void onInit() {
    super.onInit();
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
