import 'package:emoti_spend/core/design_system/app_text_style.dart';
import 'package:emoti_spend/core/extensions/time_of_day_extension.dart';
import 'package:flutter/material.dart';

class BuildTimePicker extends StatefulWidget {
  const BuildTimePicker({super.key, required this.onPickTime});

  final void Function(TimeOfDay value) onPickTime;

  @override
  State<BuildTimePicker> createState() => _BuildTimePickerState();
}

class _BuildTimePickerState extends State<BuildTimePicker> {
  TimeOfDay? _selectedTime;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(), // Set initial time
      helpText: "Chọn giờ",
      cancelText: 'Đóng', // Text for the cancel button
      confirmText: 'OK', // Text for the confirm button

      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(
                context,
              ).colorScheme.primary, // Header background color
              onPrimary: Colors.white, // Header text color
              surface: Colors.white, // Dialog background color
              onSurface: Colors.black, // Text color in dialog
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(
                  context,
                ).colorScheme.primary, // Button text color
              ),
            ),
            timePickerTheme: TimePickerThemeData(
              backgroundColor: Colors.white, // Clock background color
              hourMinuteColor: WidgetStateColor.resolveWith(
                (states) => states.contains(WidgetState.selected)
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey[200]!,
              ),
              hourMinuteTextColor: WidgetStateColor.resolveWith(
                (states) => states.contains(WidgetState.selected)
                    ? Colors.white
                    : Colors.black,
              ),
              dialHandColor: Theme.of(
                context,
              ).colorScheme.primary, // Clock hand color
              dialBackgroundColor: Colors.teal.shade50, // Clock dial background
              entryModeIconColor: Theme.of(
                context,
              ).colorScheme.primary, // Icon color for entry mode switch
              dayPeriodColor: Theme.of(context).colorScheme.primary,
              dayPeriodTextColor: WidgetStateColor.resolveWith(
                (states) => states.contains(WidgetState.selected)
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
      widget.onPickTime;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Giờ",
          style: AppTextStyles.titleMedium.copyWith(color: theme.onBackground),
        ),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: () => _selectTime(context),
          child: Container(
            padding: const EdgeInsetsDirectional.symmetric(
              vertical: 12,
              horizontal: 12,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color.fromARGB(255, 247, 243, 245),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedTime == null
                        ? ""
                        : _selectedTime!.to12hoursWithAmPm(),
                    style: AppTextStyles.titleMedium.copyWith(
                      color: theme.onSurface,
                    ),
                  ),
                ),
                const Icon(Icons.access_time, size: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
