import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tallykhata/exports.dart';

class SplashController extends GetxController {

  final user = FirebaseService.to.auth.currentUser;
  final firestore = FirebaseService.to.firestore;

  @override
  void onInit() {
    super.onInit();
    _checkAuthAndNavigate();
  }

  Future _checkAuthAndNavigate () async {

    await Future.delayed(const Duration(seconds: 3));

    if (user == null) {
      Get.offAllNamed(Routes.AUTH);
      return;
    }

    DocumentSnapshot userDoc = await firestore.collection('users').doc(user!.phoneNumber).get();

    if (userDoc.exists) {

      Get.offAllNamed(
        Routes.HOME,
      );

    } else {

      Get.offAllNamed(
        Routes.PROFILE_SETUP,
      );
    }

  }

}
