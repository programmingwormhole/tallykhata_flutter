import 'package:tallykhata/exports.dart';
import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              SvgManager.crown,
              height: 80,
              width: 80,
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'টালিখাতায় অভিনন্দন!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'টালিখাতায় যুক্ত হবার জন্য আপনাকে ধন্যবাদ!',
              style: TextStyle(
                color: AppColors.BLACK.withOpacity(.5),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 15,
              width: 15,
              child: CircularProgressIndicator(
                color: AppColors.PRIMARY,
                strokeWidth: 1.5,
              ),
            )
          ],
        ),
      )),
    );
  }
}
