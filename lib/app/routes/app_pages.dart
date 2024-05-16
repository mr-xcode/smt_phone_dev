import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/is_firsttime/bindings/is_firsttime_binding.dart';
import '../modules/is_firsttime/views/is_firsttime_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.IS_FIRSTTIME,
      page: () => const IsFirsttimeView(),
      binding: IsFirsttimeBinding(),
    ),
  ];
}
