import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  Decoration get gradientBackground => const BoxDecoration(
    gradient: LinearGradient(
      colors: [Color(0xFFFA8BFF), Color(0xFF2BD2FF), Color(0xFF2BFF88)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );

  List<BoxShadow> get shadowMd => [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      offset: const Offset(0, 4),
      blurRadius: 6,
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.06),
      offset: const Offset(0, 2),
      blurRadius: 4,
    ),
  ];

  double get heightDevice => MediaQuery.sizeOf(this).height;
  double get widthDevice => MediaQuery.sizeOf(this).width;
}
