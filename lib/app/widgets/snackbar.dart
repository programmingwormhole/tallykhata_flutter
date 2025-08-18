import 'package:tallykhata/exports.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBar(
  String message,
) =>
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.BLACK,
        duration: const Duration(milliseconds: 1500),
        behavior: SnackBarBehavior.floating,
        content: Text(
          message,
        ),
      ),
    );
