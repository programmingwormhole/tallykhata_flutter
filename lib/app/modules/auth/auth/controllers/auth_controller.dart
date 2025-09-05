import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tallykhata/app/widgets/snackbar.dart';
import 'package:tallykhata/exports.dart';

class AuthController extends GetxController {
  RxString number = RxString('');
  RxString numberWithCountryCode = RxString('');

  RxString otp = RxString('');

  final numberController = TextEditingController();
  RxBool isOTPVerifying = RxBool(false);
  RxBool isOTPSending = RxBool(false);
  RxString verificationID = RxString('');

  // OTP
  final List<TextEditingController> otpControllers = List.generate(
    6,
    (_) => TextEditingController(),
  );

  RxInt seconds = 15.obs;
  RxBool isTimerActive = RxBool(false);

  FirebaseAuth auth = FirebaseService.to.auth;

  FirebaseFirestore firestore = FirebaseService.to.firestore;

  Future loginOrRegister() async {
    isOTPSending.value = true;

    try {
      await auth.verifyPhoneNumber(
        phoneNumber: numberWithCountryCode.value,
        verificationCompleted: (credential) async {
          await _signInWithInfo(credential);
        },
        verificationFailed: (FirebaseAuthException error) {
          isOTPSending.value = false;

          snackBar(error.message!);

          print(error.message!);

          if (error.code == 'invalid-phone-number') {
            snackBar('আপনার মোবাইল নাম্বারটি সঠিক নয়।');
          }
        },
        codeSent: (String id, int? resendToken) {
          isOTPSending.value = false;

          verificationID.value = id;

          snackBar('আপনার মোবাইলের ভেরিফিকেশন কোড পাঠানো হয়েছে');

          Get.toNamed(Routes.OTP);
          startTimer();
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          isOTPSending.value = false;

          print('Code auth retrieval timeout');
        },
      );
    } catch (e) {
      isOTPSending.value = false;
      print(e.toString());
    }
  }

  Future verifyOTP() async {
    isOTPVerifying.value = true;

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID.value,
        smsCode: otp.value,
      );

      _signInWithInfo(credential);

      isOTPVerifying.value = false;
    } on FirebaseAuthException catch (e) {
      isOTPVerifying.value = false;
      snackBar(e.message!);
    } catch (e) {
      isOTPVerifying.value = false;
      snackBar('একটি সমস্যা হয়েছে। ${e.toString()}');
    }
  }

  Future<UserCredential> _signInWithInfo(AuthCredential credential) async {
    isOTPVerifying.value = true;

    UserCredential userData = await auth.signInWithCredential(credential);

    if (userData.user != null) {
      User user = userData.user!;

      isOTPVerifying.value = false;
      snackBar('আপনার ভেরিফিকেশন সফল হয়েছে!');

      DocumentSnapshot userDoc = await firestore.collection('users').doc(user.phoneNumber).get();

      if (userDoc.exists) {

        Get.offAllNamed(
          Routes.HOME,
        );

      } else {

        Get.offAllNamed(
          Routes.PROFILE_SETUP,
        );
      }

      return userData;
    }

    isOTPVerifying.value = false;
    snackBar('User not found after sign-in.');

    return userData;
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
}
