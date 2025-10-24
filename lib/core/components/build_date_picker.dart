import 'package:emoti_spend/core/design_system/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BuildDatePicker extends StatefulWidget {
  const BuildDatePicker({super.key, required this.onPickDate});

  final void Function(DateTime value) onPickDate;

  @override
  State<BuildDatePicker> createState() => _BuildDatePickerState();
}

class _BuildDatePickerState extends State<BuildDatePicker> {
  DateTime? _selectedDate;

  void _onPickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate:
          _selectedDate ?? DateTime.now(), // Initial date shown in the picker
      firstDate: DateTime(2000), // Earliest selectable date
      lastDate: DateTime(2100), // Latest selectable date
      helpText: 'Chọn ngày', // Text displayed at the top of the dialog
      cancelText: 'Đóng', // Text for the cancel button
      confirmText: 'OK', // Text for the confirm button
      fieldLabelText: 'Ngày giao dịch', // Label for the input field
      fieldHintText: 'dd/MM/YYYY', // Hint text for the input field
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            // Or Theme.of(context).copyWith()
            colorScheme: ColorScheme.light(
              primary: Theme.of(
                context,
              ).colorScheme.primary, // Header background color
              onPrimary: Colors.white, // Header text color
              onSurface: Colors.black, // Calendar text color
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      widget.onPickDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Ngày",
          style: AppTextStyles.titleMedium.copyWith(color: theme.onBackground),
        ),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: () => _onPickDate(),
          child: Container(
            padding: const EdgeInsetsDirectional.symmetric(
              vertical: 12,
              horizontal: 12,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xFFFAFAFA),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? ""
                        : DateFormat("dd/MM/yyyy").format(_selectedDate!),
                    style: AppTextStyles.titleMedium.copyWith(
                      color: theme.onSurface,
                    ),
                  ),
                ),
                const Icon(Icons.calendar_today, size: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
