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
    Jar.ffa => "Tự do TC",
  };
}
