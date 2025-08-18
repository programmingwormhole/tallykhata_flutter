import 'dart:async';
import 'package:tallykhata/app/widgets/snackbar.dart';
import 'package:tallykhata/exports.dart';

class AuthController extends GetxController {
  RxString number = RxString('');
  RxString numberWithCountryCode = RxString('');
  RxString otp = RxString('');
  final numberController = TextEditingController();
  RxBool isOTPVerifying = RxBool(false);

  // OTP
  final List<TextEditingController> otpControllers = List.generate(
    6,
    (_) => TextEditingController(),
  );

  RxInt seconds = 15.obs;
  RxBool isTimerActive = RxBool(false);

  Future loginOrRegister() async {
    // TODO:: Implement Firebase Login Register Functionalities

    Get.toNamed(Routes.OTP);
    startTimer();
  }

  void onOTPChanged(String value, int index, BuildContext context) {
    if (value.length == 1 && index < 5) {
      FocusScope.of(context).nextFocus();
    }

    if (value.isEmpty && index > 0) {
      FocusScope.of(context).previousFocus();
    }

    otp.value = otpControllers.map((controller) => controller.text).join();
  }

  void startTimer() {
    isTimerActive.value = true;
    seconds.value = 15;

    var timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (seconds.value > 0) {
          seconds.value--;
        } else {
          isTimerActive.value = false;
          timer.cancel();
        }
      },
    );
  }

  void resendOtp() {
    startTimer();
    snackBar('পুনরায় কোড পাঠানো হয়েছে।');
  }

  Future verifyOTP() async {
    isOTPVerifying.value = true;

    Timer(
      const Duration(seconds: 3),
      () => Get.offAllNamed(
        Routes.PROFILE_SETUP,
      ),
    );
  }
}
