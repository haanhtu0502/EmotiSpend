import 'package:emoti_spend/core/design_system/app_colors.dart';
import 'package:flutter/material.dart';

enum Jar { nec, ltss, educ, play, give, ffa }

extension JarExtension on Jar {
  Color get toColor => switch (this) {
    Jar.nec => jarColors[0],
    Jar.ltss => jarColors[2],
    Jar.educ => jarColors[1],
    Jar.play => jarColors[3],
    Jar.give => jarColors[4],
    Jar.ffa => jarColors[5],
  };

  String get toEmoji => switch (this) {
    Jar.nec => "🏠",
    Jar.ltss => "💰",
    Jar.educ => "📚",
    Jar.play => "🎮",
    Jar.give => "💝",
    Jar.ffa => "🎯",
  };

  double get toPercent => switch (this) {
    Jar.nec => 55,
    Jar.ltss => 10,
    Jar.educ => 10,
    Jar.play => 10,
    Jar.give => 5,
    Jar.ffa => 10,
  };

  String get toName => switch (this) {
    Jar.nec => "Thiết yếu",
    Jar.ltss => "Tiết kiệm",
    Jar.educ => "Giáo dục",
    Jar.play => "Hưởng thụ",
    Jar.give => "Cho đi",
    Jar.ffa => "Đầu tư",
  };

  LinearGradient get toLinearGradient => switch (this) {
    Jar.nec => LinearGradient(
      colors: [
        const Color(0xFF4ADE80),
        toColor,
      ], // from-green-400 to-emerald-500
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    Jar.ltss => LinearGradient(
      colors: [const Color(0xFF60A5FA), toColor], // from-blue-400 to-indigo-500
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    Jar.educ => LinearGradient(
      colors: [
        const Color(0xFFFCD34D),
        toColor,
      ], // from-amber-300 to-yellow-500
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    Jar.play => LinearGradient(
      colors: [
        const Color(0xFFA78BFA),
        toColor,
      ], // from-violet-400 to-purple-500
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    Jar.give => LinearGradient(
      colors: [const Color(0xFFF472B6), toColor], // from-pink-400 to-rose-500
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    Jar.ffa => LinearGradient(
      colors: [const Color(0xFFF87171), toColor], // from-red-400 to-orange-500
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  };
}
