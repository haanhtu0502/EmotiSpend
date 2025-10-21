import 'package:emoti_spend/core/utils/number_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BuildTextInputField extends StatelessWidget {
  const BuildTextInputField({
    super.key,
    required this.controller,
    required this.onChange,
    this.hintStyle,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.border,
    this.isNumber = false,
    this.contentPadding,
    this.label,
    this.isPassword = false,
    this.focusedBorder,
    this.isRequired = false,
    this.validateText,
    this.textStyle,
    this.textAlign,
    this.filledColor,
    this.maxLine,
  });

  final TextEditingController controller;
  final void Function(String? value) onChange;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final bool isNumber;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? label;
  final bool isPassword;
  final bool isRequired;
  final String? validateText;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final Color? filledColor;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (label != null) ...[
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [label!]),
          const SizedBox(height: 8),
        ],
        TextFormField(
          style: textStyle,
          maxLines: maxLine,
          textAlign: textAlign ?? TextAlign.start,
          obscureText: isPassword,
          controller: controller,
          onChanged: onChange,
          validator: (value) {
            if (isRequired && (value == null || value.isEmpty)) {
              return validateText ?? "Vui lòng không để trống!";
            }
            return null;
          },
          keyboardType: isNumber ? TextInputType.number : null,
          inputFormatters: isNumber
              ? [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  FilteringTextInputFormatter.digitsOnly,
                  NumberInputFormatter(),
                ]
              : null,
          decoration: InputDecoration(
            hintText: hintText,

            filled: true,
            fillColor: filledColor ?? const Color(0xFFFFF5F7),
            hintStyle: hintStyle,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            border: border,
            enabledBorder: border,
            focusedBorder: focusedBorder,
            disabledBorder: border,
            isDense: true,
            contentPadding: contentPadding,
          ),
        ),
      ],
    );
  }
}
