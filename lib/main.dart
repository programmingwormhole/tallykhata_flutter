import 'exports.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync(() => FirebaseService().init());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryUtils.initialize(context);

    return GetMaterialApp(
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      title: AppConfig.APP_NAME,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
