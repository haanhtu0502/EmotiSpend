import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {
  String to24hours() {
    final hour = this.hour.toString().padLeft(2, "0");
    final min = minute.toString().padLeft(2, "0");
    return "$hour:$min";
  }

  String to12hoursWithAmPm() {
    final hour = hourOfPeriod;
    final min = minute.toString().padLeft(2, "0");
    final amPm = period == DayPeriod.am ? 'AM' : 'PM';
    return "$hour:$min $amPm";
  }
}
