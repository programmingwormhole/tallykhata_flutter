import 'dart:async';
import 'package:tallykhata/exports.dart';

class ProfileSetupController extends GetxController {
  RxString businessName = RxString('');
  RxBool isSettingUp = RxBool(false);

  Future finishSetup() async {
    isSettingUp.value = true;

    Timer(
      const Duration(seconds: 3),
      () {
        isSettingUp.value = false;
        Get.offAllNamed(Routes.WELCOME);
      },
    );
  }
}
