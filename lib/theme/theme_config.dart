import 'package:emoti_spend/core/design_system/app_colors.dart';
import 'package:flutter/material.dart';

class ThemeConfig {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(elevation: 0.0),
    colorScheme: lightColorScheme,
  );
}
