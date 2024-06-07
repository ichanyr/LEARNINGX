import 'package:get/get.dart';
import 'package:capstone_vocalavida/app/modules/home/bindings/home_binding.dart';
import 'package:capstone_vocalavida/app/modules/home/views/home_view.dart';
import 'package:capstone_vocalavida/app/modules/latihan/bindings/latihan_binding.dart';
import 'package:capstone_vocalavida/app/modules/latihan/views/latihan_view.dart';
import 'package:capstone_vocalavida/app/modules/login/controllers/login_controller.dart';
import 'package:capstone_vocalavida/app/modules/login/views/login_view.dart';
import 'package:capstone_vocalavida/app/modules/main/views/main_view.dart';
import 'package:capstone_vocalavida/app/modules/materi/bindings/materi_binding.dart';
import 'package:capstone_vocalavida/app/modules/materi/views/materi_view.dart';
import 'package:capstone_vocalavida/app/modules/onBoarding/bindings/on_boarding_binding.dart';
import 'package:capstone_vocalavida/app/modules/profile/bindings/profile_binding.dart';
import 'package:capstone_vocalavida/app/modules/profile/views/profile_view.dart';
import 'package:capstone_vocalavida/app/modules/register/bindings/register_binding.dart';
import 'package:capstone_vocalavida/app/modules/register/views/register_view.dart';
import '../modules/main/controllers/main_controller.dart';
import '../modules/onBoarding/views/on_boarding_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<LoginController>(() => LoginController());
      }),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => MainController());
      }),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.LATIHAN,
      page: () => LatihanView(),
      binding: LatihanBinding(),
    ),
    GetPage(
      name: _Paths.MATERI,
      page: () => MateriView(),
      binding: MateriBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ON_BOARDING,
      page: () => OnboardingView(),
      binding: OnBoardingBinding(),
    ),
  ];
}
