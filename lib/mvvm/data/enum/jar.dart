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
    Jar.nec => 0.55,
    Jar.ltss => 0.1,
    Jar.educ => 0.1,
    Jar.play => 0.1,
    Jar.give => 0.05,
    Jar.ffa => 0.1,
  };
}
