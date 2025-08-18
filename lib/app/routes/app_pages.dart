import 'package:get/get.dart';

import '../modules/auth/auth/bindings/auth_binding.dart';
import '../modules/auth/auth/views/auth_view.dart';
import '../modules/auth/otp/bindings/otp_binding.dart';
import '../modules/auth/otp/views/otp_view.dart';
import '../modules/auth/profile_setup/bindings/profile_setup_binding.dart';
import '../modules/auth/profile_setup/views/profile_setup_view.dart';
import '../modules/auth/welcome/bindings/welcome_binding.dart';
import '../modules/auth/welcome/views/welcome_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

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
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
      children: [
        GetPage(
          name: _Paths.PROFILE_SETUP,
          page: () => const ProfileSetupView(),
          binding: ProfileSetupBinding(),
        ),
        GetPage(
          name: _Paths.WELCOME,
          page: () => const WelcomeView(),
          binding: WelcomeBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => const OtpView(),
      binding: OtpBinding(),
    ),
  ];
}
