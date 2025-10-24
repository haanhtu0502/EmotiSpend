import 'package:collection/collection.dart';
import 'package:emoti_spend/core/components/build_button.dart';
import 'package:emoti_spend/core/components/build_date_picker.dart';
import 'package:emoti_spend/core/components/build_text_input_field.dart';
import 'package:emoti_spend/core/components/build_time_picker.dart';
import 'package:emoti_spend/core/design_system/app_text_style.dart';
import 'package:emoti_spend/core/extensions/context_extensions.dart';
import 'package:emoti_spend/mvvm/data/enum/income_source.dart';
import 'package:emoti_spend/mvvm/view/add_expense_income/widgets/income_source_select_item.dart';
import 'package:flutter/material.dart';

class AddIncomeScreen extends StatefulWidget {
  const AddIncomeScreen({super.key});

  @override
  State<AddIncomeScreen> createState() => _AddIncomeScreenState();
}

class _AddIncomeScreenState extends State<AddIncomeScreen> {
  final TextEditingController _incomeController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final ValueNotifier _selectedIncomeSource = ValueNotifier<IncomeSource?>(
    null,
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: _buildInput(context, theme),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: _buildSelectIncomeSource(context, theme),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: _buildDateSelect(context, theme),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: _buildDescriptionInput(context, theme),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: _buildSaveButton(context, theme),
        ),
        const SizedBox(height: 20),
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

  Widget _buildSelectIncomeSource(BuildContext context, ColorScheme theme) {
    return ValueListenableBuilder(
      valueListenable: _selectedIncomeSource,
      builder: (context, val, child) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: context.shadowMd,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nguồn thu nhập",
                style: AppTextStyles.titleLarge.copyWith(
                  color: theme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...IncomeSource.values
                      .whereIndexed((index, e) => index <= 1)
                      .map(
                        (e) => Expanded(
                          child: IncomeSourceSelectItem(
                            item: e,
                            onSelect: (value) {
                              _selectedIncomeSource.value = value;
                            },
                            isSelected: _selectedIncomeSource.value == e,
                          ),
                        ),
                      )
                      .expandIndexed(
                        (i, e) => [e, SizedBox(width: i == 1 ? 0 : 8)],
                      ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...IncomeSource.values
                      .whereIndexed((index, e) => index > 1)
                      .map(
                        (e) => Expanded(
                          child: IncomeSourceSelectItem(
                            item: e,
                            onSelect: (value) {
                              _selectedIncomeSource.value = value;
                            },
                            isSelected: _selectedIncomeSource.value == e,
                          ),
                        ),
                      )
                      .expandIndexed(
                        (i, e) => [e, SizedBox(width: i == 1 ? 0 : 8)],
                      ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDateSelect(BuildContext context, ColorScheme theme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: context.shadowMd,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Thời gian",
            style: AppTextStyles.titleLarge.copyWith(
              color: theme.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: BuildDatePicker(onPickDate: (value) {})),
              const SizedBox(width: 12),
              Expanded(child: BuildTimePicker(onPickTime: (value) {})),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionInput(BuildContext context, ColorScheme theme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: context.shadowMd,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ghi chú",
            style: AppTextStyles.titleLarge.copyWith(
              color: theme.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          BuildTextInputField(
            controller: _descController,
            onChange: (value) {},
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xFFFFD6DA),
                width: 3,
              ), // viền hồng
            ),
            maxLine: 3,
            isNumber: false,
            hintText: "Thêm mô tả ...",
            textStyle: AppTextStyles.titleMedium,
            hintStyle: AppTextStyles.titleMedium.copyWith(
              color: Colors.grey.shade400,
            ),
            textAlign: TextAlign.start,
            filledColor: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButton(BuildContext context, ColorScheme theme) {
    return Row(
      children: [
        Expanded(
          child: BuildButton(
            padding: const EdgeInsets.symmetric(vertical: 12),
            backgroundColor: theme.primary,
            radius: 9999,
            onPressed: () {},
            content: Center(
              child: Text(
                "Thêm thu nhập 🚀",
                style: AppTextStyles.titleLarge.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
