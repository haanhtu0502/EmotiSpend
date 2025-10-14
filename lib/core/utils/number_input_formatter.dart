import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class NumberInputFormatter extends TextInputFormatter {
  final NumberFormat _formatter = NumberFormat.decimalPattern('vi_VN');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Loại bỏ dấu phẩy cũ
    final value = newValue.text.replaceAll('.', '');

    // Nếu không phải số thì giữ nguyên
    if (double.tryParse(value) == null) return oldValue;

    final newText = _formatter.format(int.parse(value));

    // Giữ nguyên vị trí con trỏ ở cuối
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
