import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tallykhata/app/core/themes/colors.dart';
import 'package:tallykhata/app/modules/auth/auth/controllers/auth_controller.dart';
import 'package:tallykhata/app/widgets/custom_button.dart';
import 'package:tallykhata/app/widgets/custom_otp_field.dart';

class OtpView extends GetView<AuthController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'ভেরিফিকেশন কোড দিন',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${controller.numberWithCountryCode.value} নম্বরে ৪ ডিজিটের ভেরিফিকেশন কোড পাঠানো হয়েছে। অনুগ্রহ করে নিচের ঘরে কোডটি লিখুন।',
                      style: TextStyle(
                        color: Colors.black.withOpacity(.5),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        6,
                        (index) => OtpField(
                          controller: controller.otpControllers[index],
                          onChanged: (otp) =>
                              controller.onOTPChanged(otp, index, context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Obx(
                () => Column(
                  children: [
                    controller.isTimerActive.value
                        ? Text(
                            'সময় অবশিষ্ট আছে ${controller.seconds.value} সেকেন্ড',
                            style: TextStyle(
                              color: AppColors.BLACK.withOpacity(.5),
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        : TextButton(
                            onPressed: () => controller.resendOtp(),
                            child: const Text(
                              'পুনরায় কোড পাঠান',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      label: 'ভেরিফাই করুন',
                      buttonType: controller.otp.isEmpty ||
                              controller.otp.value.length < 6
                          ? ButtonType.DISABLED
                          : ButtonType.ENABLED,
                      isLoading: controller.isOTPVerifying.value,
                      onTap: () => controller.verifyOTP(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
