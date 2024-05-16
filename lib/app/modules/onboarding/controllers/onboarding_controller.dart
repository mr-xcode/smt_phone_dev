import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingController extends GetxController {
  //TODO: Implement OnboardingController
  final List<PageViewModel> onboardingPages = [
    PageViewModel(
      title: 'Welcome',
      body: 'Welcome to the onboarding screen!',
      image: Image.asset('assets/onboarding/one.webp'),
    ),
    PageViewModel(
      title: 'Features',
      body: 'Discover amazing features of our app.',
      image: Image.asset('assets/onboarding/two.webp'),
    ),
    PageViewModel(
      title: 'Get Started',
      body: 'Get started and enjoy using our app.',
      image: Image.asset('assets/onboarding/three.png'),
    ),
  ];

  void completeOnboarding() async {
    Get.offAllNamed('/home');
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
