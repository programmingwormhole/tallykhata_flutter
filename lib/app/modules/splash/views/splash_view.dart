import 'package:tallykhata/exports.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ImageManager.logo.image(
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}