import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';

enum AppThemeMode { dark, light }

class ThemeProvider extends ChangeNotifier {
  AppThemeMode currentThemeValue = AppThemeMode.dark;
  ThemeData currentThemeData =
      ThemeData(scaffoldBackgroundColor: AppColors.mainDark);

  void applyDarkTheme() {
    currentThemeValue = AppThemeMode.dark;
    currentThemeData = darkTheme;
    notifyListeners();
  }

  void applyLightTheme() {
    currentThemeValue = AppThemeMode.light;
    currentThemeData = lightTheme;
    notifyListeners();
  }

  final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.mainDark,
    textTheme: const TextTheme(
        labelLarge: TextStyle(color: AppColors.mainTextClr),
        labelMedium: TextStyle(color: AppColors.mainTextClr),
        labelSmall: TextStyle(color: AppColors.mainTextClr),
        displayLarge: TextStyle(color: AppColors.mainTextClr),
        displayMedium: TextStyle(color: AppColors.mainTextClr),
        displaySmall: TextStyle(color: AppColors.mainTextClr),
        headlineLarge: TextStyle(color: AppColors.mainTextClr),
        headlineMedium: TextStyle(color: AppColors.mainTextClr),
        headlineSmall: TextStyle(color: AppColors.mainTextClr),
        titleLarge: TextStyle(color: AppColors.mainTextClr),
        titleMedium: TextStyle(color: AppColors.mainTextClr),
        bodyMedium: TextStyle(color: AppColors.mainTextClr),
        bodyLarge: TextStyle(color: AppColors.mainTextClr),
        bodySmall: TextStyle(color: AppColors.mainTextClr)),
  );
  final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.mainTextClr.withValues(alpha: 0.9),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppColors.mainDark),
    ),
  );
}
