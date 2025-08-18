import 'package:tallykhata/app/widgets/snackbar.dart';
import 'package:tallykhata/exports.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.PRIMARY.withOpacity(.150),
                    AppColors.WHITE,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [
                    0.0,
                    0.5,
                  ],
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            AppColors.WHITE,
                            AppColors.WHITE.withOpacity(.0),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: SvgPicture.asset(
                        SvgManager.onboardQrcode,
                        height: 150,
                        width: 150,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'সুপার QR-এ পেমেন্ট নিন বিকাশ, রকেট, সহ\nসকল ব্যাংক অ্যাপ থেকে।',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'রেজিস্ট্রেশন/লগিন করুন',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          controller: controller.numberController,
                          labelText: 'মোবাইল নাম্বার',
                          hintText: 'xxxxxxxxx',
                          prefixText: '+880',
                          leadingIcon: Icons.call,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            if (value.startsWith('0') ||
                                value.startsWith('8') ||
                                !value.startsWith('1')) {
                              snackBar('The number should be start with 1!');
                              controller.numberController.clear();
                              return;
                            }

                            controller.number.value = value;
                            controller.numberWithCountryCode.value = '+880$value';
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'রেজিস্ট্রেশন করতে আপনার ',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: AppColors.BLACK.withOpacity(.5),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const TextSpan(
                                text: 'NID দিয়ে নিবন্ধিত মোবাইল নম্বর',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: AppColors.BLACK,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              TextSpan(
                                text: ' ব্যাবহার করুন।',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: AppColors.BLACK.withOpacity(.5),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Obx(
                          () => CustomButton(
                            label: 'পরবর্তী',
                            buttonType: controller.number.isEmpty ||
                                    controller.number.value.length < 10
                                ? ButtonType.DISABLED
                                : ButtonType.ENABLED,
                            onTap: controller.loginOrRegister,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    'পরবর্তীতে যাওয়ার নির্দেশনার মাধ্যমে আপনি টালিখাতার ',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.BLACK.withOpacity(.5),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const TextSpan(
                                text: 'শর্তাবলীতে',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.PRIMARY,
                                  fontWeight: FontWeight.w800,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              TextSpan(
                                text: ' সম্মতি প্রদান করছেন।',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.BLACK.withOpacity(.5),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
