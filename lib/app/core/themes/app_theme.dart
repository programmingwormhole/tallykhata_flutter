import 'package:tallykhata/exports.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.PRIMARY,
      selectionColor: AppColors.PRIMARY,
      selectionHandleColor: AppColors.PRIMARY,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          width: 1.5,
          color: AppColors.BLACK.withOpacity(.6),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          width: 1.5,
          color: AppColors.PRIMARY,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: AppColors.BLACK.withOpacity(.6),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          width: 1.5,
          color: AppColors.RED,
        ),
      ),
    ),
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
  );
}
