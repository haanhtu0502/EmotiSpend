import 'package:emoti_spend/core/components/build_text_input_field.dart';
import 'package:emoti_spend/core/design_system/app_text_style.dart';
import 'package:emoti_spend/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class AddIncomeScreen extends StatefulWidget {
  const AddIncomeScreen({super.key});

  @override
  State<AddIncomeScreen> createState() => _AddIncomeScreenState();
}

class _AddIncomeScreenState extends State<AddIncomeScreen> {
  final TextEditingController _incomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: _buildInput(context, theme),
        ),
      ],
    );
  }

  Widget _buildInput(BuildContext context, ColorScheme theme) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: context.shadowMd,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Số tiền thu",
            style: AppTextStyles.titleLarge.copyWith(
              color: theme.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: BuildTextInputField(
                  controller: _incomeController,
                  onChange: (value) {},
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color(0xFFFFD6DA),
                      width: 3,
                    ), // viền hồng
                  ),
                  isNumber: true,
                  hintText: "đ",
                  textStyle: AppTextStyles.headlineLarge,
                  hintStyle: AppTextStyles.headlineLarge.copyWith(
                    color: Colors.grey.shade400,
                  ),
                  textAlign: TextAlign.start,
                  filledColor: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
