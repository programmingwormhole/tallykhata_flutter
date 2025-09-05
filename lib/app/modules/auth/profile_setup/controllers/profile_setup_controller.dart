import 'dart:async';
import 'package:tallykhata/app/widgets/snackbar.dart';
import 'package:tallykhata/exports.dart';

class ProfileSetupController extends GetxController {
  RxString businessName = RxString('');
  RxBool isSettingUp = RxBool(false);

  final user = FirebaseService.to.auth.currentUser;
  final firestore = FirebaseService.to.firestore;


  Future finishSetup() async {

    if (user == null) {
      snackBar('কোন ব্যবহারকারী পাওয়া যায়নি');
      return;
    }

    isSettingUp.value = true;

    final profileData = {
      'business_name' : businessName.value,
      'phone_number' : user!.phoneNumber,
    };

    await firestore.collection('users').doc(user!.phoneNumber).set(profileData);

    isSettingUp.value = false;
    snackBar('প্রোফাইল সফলভাবে সংরক্ষণ করা হয়েছে!');

    Get.offAllNamed(Routes.WELCOME);

  }
}
