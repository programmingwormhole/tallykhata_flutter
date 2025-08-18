import 'dart:async';
import 'package:get/get.dart';

class WelcomeController extends GetxController {

  @override
  void onInit() {
    super.onInit();

    // TODO:: Go to home screen

    Timer(const Duration(seconds: 3), () {
      print('Go to Home Screen');
    });
  }

}
