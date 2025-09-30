import 'package:flutter/material.dart';

const TextTheme appTextTheme = TextTheme(
  displayLarge: AppTextStyles.displayLarge,
  displayMedium: AppTextStyles.displayMedium,
  displaySmall: AppTextStyles.displaySmall,
  headlineLarge: AppTextStyles.headlineLarge,
  headlineMedium: AppTextStyles.headlineMedium,
  headlineSmall: AppTextStyles.headlineSmall,
  titleLarge: AppTextStyles.titleLarge,
  titleMedium: AppTextStyles.titleMedium,
  titleSmall: AppTextStyles.titleSmall,
  labelLarge: AppTextStyles.labelLarge,
  labelMedium: AppTextStyles.labelMedium,
  labelSmall: AppTextStyles.labelSmall,
  bodyLarge: AppTextStyles.bodyLarge,
  bodyMedium: AppTextStyles.bodyMedium,
  bodySmall: AppTextStyles.bodySmall,
);

class AppTextStyles {
  // display
  static const TextStyle displayLarge = TextStyle(
    fontSize: 57,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    height: 1.12, // 64
    letterSpacing: -0.25,
  );

  static const TextStyle displayMedium = TextStyle(
    fontSize: 45,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    height: 1.156, // 52
    letterSpacing: -1,
  );

  static const TextStyle displaySmall = TextStyle(
    fontSize: 36,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    height: 1.222, // 44
  );

  // headline
  static const TextStyle headlineXLarge = TextStyle(
    fontSize: 36,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    height: 1.222, // 44
    letterSpacing: -1,
  );

  static const TextStyle headlineLarge = TextStyle(
    fontSize: 28,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    height: 1.286, // 36
    letterSpacing: -0.5,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontSize: 24,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    height: 1.333, // 32,
    letterSpacing: -.5,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontSize: 20,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    height: 1.4, // 28,
    letterSpacing: -0.25,
  );

  // title
  static const TextStyle titleXLarge = TextStyle(
    fontSize: 18,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    height: 1.333, // 24,
    letterSpacing: -0.2,
  );

  static const TextStyle titleLarge = TextStyle(
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    height: 1.5, // 24,
    letterSpacing: -0.1,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: 14,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    height: 1.429, // 20,
    letterSpacing: 0,
  );

  static const TextStyle titleSmall = TextStyle(
    fontSize: 13,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    height: 1.231, // 16,
    letterSpacing: 0,
  );

  // label
  static const TextStyle labelLarge = TextStyle(
    fontSize: 14,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    height: 1.429, // 20,
    letterSpacing: 0,
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: 12,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    height: 1.333, // 16,
    letterSpacing: 0,
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: 11,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    height: 1.231, // 16,
    letterSpacing: 0.25,
  );

  // body
  static const TextStyle bodyXLarge = TextStyle(
    fontSize: 18,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    height: 1.5556, // 28,
    letterSpacing: -0.1,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    height: 1.5, // 24,
    letterSpacing: -0.1,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    height: 1.429, // 20,
    letterSpacing: 0,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 13,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    height: 1.231, // 16,
    letterSpacing: 0,
  );
}
