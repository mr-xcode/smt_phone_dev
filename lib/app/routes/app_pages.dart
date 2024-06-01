import 'package:get/get.dart';

import '../modules/admin_add_new/bindings/admin_add_new_binding.dart';
import '../modules/admin_add_new/views/admin_add_new_view.dart';
import '../modules/admin_detailed_view/bindings/admin_detailed_view_binding.dart';
import '../modules/admin_detailed_view/views/admin_detailed_view_view.dart';
import '../modules/admin_panel/bindings/admin_panel_binding.dart';
import '../modules/admin_panel/views/admin_panel_view.dart';
import '../modules/approve_license/bindings/approve_license_binding.dart';
import '../modules/approve_license/views/approve_license_view.dart';
import '../modules/auth_gate/bindings/auth_gate_binding.dart';
import '../modules/auth_gate/views/auth_gate_view.dart';
import '../modules/buying/bindings/buying_binding.dart';
import '../modules/buying/views/buying_view.dart';
import '../modules/detailed_view/bindings/detailed_view_binding.dart';
import '../modules/detailed_view/views/detailed_view_view.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/premium/bindings/premium_binding.dart';
import '../modules/premium/views/premium_view.dart';
import '../modules/pricing/bindings/pricing_binding.dart';
import '../modules/pricing/views/pricing_view.dart';
import '../modules/request_missing/bindings/request_missing_binding.dart';
import '../modules/request_missing/views/request_missing_view.dart';
import '../modules/signin/bindings/signin_binding.dart';
import '../modules/signin/views/signin_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/training/bindings/training_binding.dart';
import '../modules/training/views/training_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.AUTH_GATE,
      page: () => const AuthGateView(),
      binding: AuthGateBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => const SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_PANEL,
      page: () => const AdminPanelView(),
      binding: AdminPanelBinding(),
    ),
    GetPage(
      name: _Paths.PREMIUM,
      page: () => PremiumView(),
      binding: PremiumBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_ADD_NEW,
      page: () => AdminAddNewView(),
      binding: AdminAddNewBinding(),
    ),
    GetPage(
      name: _Paths.PRICING,
      page: () => const PricingView(),
      binding: PricingBinding(),
    ),
    GetPage(
      name: _Paths.BUYING,
      page: () => const BuyingView(),
      binding: BuyingBinding(),
    ),
    GetPage(
      name: _Paths.APPROVE_LICENSE,
      page: () => const ApproveLicenseView(),
      binding: ApproveLicenseBinding(),
    ),
    GetPage(
      name: _Paths.TRAINING,
      page: () => const TrainingView(),
      binding: TrainingBinding(),
    ),
    GetPage(
      name: _Paths.REQUEST_MISSING,
      page: () => const RequestMissingView(),
      binding: RequestMissingBinding(),
    ),
    GetPage(
      name: _Paths.DETAILED_VIEW,
      page: () => const DetailedViewView(),
      binding: DetailedViewBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_DETAILED_VIEW,
      page: () => const AdminDetailedViewView(),
      binding: AdminDetailedViewBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
  ];
}
