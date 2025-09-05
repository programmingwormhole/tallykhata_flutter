import 'dart:async';
import 'package:get/get.dart';
import 'package:tallykhata/app/routes/app_pages.dart';

class WelcomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(
      const Duration(seconds: 3),
      () {
        Get.offAllNamed(Routes.HOME);
      },
    );
  }
}
