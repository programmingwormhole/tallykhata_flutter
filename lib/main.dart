import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tallykhata/app/core/helpers/media_query_helpers.dart';
import 'package:tallykhata/app/core/themes/app_theme.dart';
import 'app/routes/app_pages.dart';

void main() {
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
      title: "TallyKhata",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
