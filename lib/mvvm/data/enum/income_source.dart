import 'package:flutter/material.dart';

enum IncomeSource { salary, bonus, invest, other }

extension IncomeSourceExtension on IncomeSource {
  String get toText => switch (this) {
    IncomeSource.salary => "Lương",
    IncomeSource.bonus => "Thưởng",
    IncomeSource.invest => "Đầu tư",
    IncomeSource.other => "Khác",
  };

  String get toEmoji => switch (this) {
    IncomeSource.salary => '💼',
    IncomeSource.bonus => '💵',
    IncomeSource.invest => '📈',
    IncomeSource.other => '🎁',
  };

  LinearGradient get toLinearGradien => switch (this) {
    IncomeSource.salary => const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF4ADE80), // from-green-400
        Color(0xFF22C55E), // to-green-500
      ],
    ),
    IncomeSource.bonus => const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF60A5FA), // blue-400
        Color(0xFF3B82F6), // blue-500
      ],
    ),
    IncomeSource.invest => const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFC084FC), // from-purple-400
        Color(0xFFA855F7), // to-purple-500
      ],
    ),
    IncomeSource.other => const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFFBBF24), // orange-400
        Color(0xFFF97316), // orange-500
      ],
    ),
  };
}
