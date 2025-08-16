import 'dart:async';

import 'package:get/get.dart';
import 'package:tallykhata/app/routes/app_pages.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();

    Timer(
      const Duration(seconds: 3),
      () => Get.offAllNamed(Routes.AUTH),
    );
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
