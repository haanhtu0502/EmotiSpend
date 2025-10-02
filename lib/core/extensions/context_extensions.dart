import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  Decoration get gradientBackground => const BoxDecoration(
    gradient: LinearGradient(
      colors: [Color(0xFFFA8BFF), Color(0xFF2BD2FF), Color(0xFF2BFF88)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );

  double get heightDevice => MediaQuery.sizeOf(this).height;
  double get widthDevice => MediaQuery.sizeOf(this).width;
}
