import 'package:collection/collection.dart';
import 'package:emoti_spend/core/components/build_button.dart';
import 'package:emoti_spend/core/components/build_date_picker.dart';
import 'package:emoti_spend/core/components/build_text_input_field.dart';
import 'package:emoti_spend/core/components/build_time_picker.dart';
import 'package:emoti_spend/core/design_system/app_text_style.dart';
import 'package:emoti_spend/core/extensions/context_extensions.dart';
import 'package:emoti_spend/mvvm/data/enum/emotion.dart';
import 'package:emoti_spend/mvvm/data/enum/jar.dart';
import 'package:emoti_spend/mvvm/view/add_expense_income/widgets/emoji_select_item.dart';
import 'package:emoti_spend/mvvm/view/add_expense_income/widgets/jar_select_item.dart';
import 'package:flutter/material.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final ValueNotifier<Emotion?> _selectedEmotion = ValueNotifier(null);
  final ValueNotifier<Jar?> _selectedJar = ValueNotifier(null);
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _descController = TextEditingController();

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
          child: _buildSelectJar(context, theme),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: _buildSelectEmoji(context, theme),
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
            "Số tiền chi",
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
                  controller: _controller,
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

  Widget _buildSelectJar(BuildContext context, ColorScheme theme) {
    return ValueListenableBuilder(
      valueListenable: _selectedJar,
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
                "Chọn hũ chi tiêu",
                style: AppTextStyles.titleLarge.copyWith(
                  color: theme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...Jar.values
                      .whereIndexed((index, e) => index <= 2)
                      .map(
                        (e) => Expanded(
                          child: JarSelectItem(
                            item: e,
                            onSelect: (value) {
                              _selectedJar.value = value;
                            },
                            isSelected: _selectedJar.value == e,
                          ),
                        ),
                      )
                      .expandIndexed(
                        (i, e) => [e, SizedBox(width: i == 2 ? 0 : 8)],
                      ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...Jar.values
                      .whereIndexed((index, e) => index > 2)
                      .map(
                        (e) => Expanded(
                          child: JarSelectItem(
                            item: e,
                            onSelect: (value) {
                              _selectedJar.value = value;
                            },
                            isSelected: _selectedJar.value == e,
                          ),
                        ),
                      )
                      .expandIndexed(
                        (i, e) => [e, SizedBox(width: i == 2 ? 0 : 8)],
                      ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSelectEmoji(BuildContext context, ColorScheme theme) {
    return ValueListenableBuilder(
      valueListenable: _selectedEmotion,
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
                "Cảm xúc của bạn",
                style: AppTextStyles.titleLarge.copyWith(
                  color: theme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  ...Emotion.values
                      .whereIndexed((i, e) => i < 3)
                      .map(
                        (item) => Expanded(
                          child: EmojiSelectItem(
                            item: item,
                            onSelect: (value) {
                              _selectedEmotion.value = value;
                            },
                            isSelect: _selectedEmotion.value == item,
                          ),
                        ),
                      )
                      .expandIndexed(
                        (i, e) => [e, SizedBox(width: i == 3 ? 0 : 12)],
                      ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  ...Emotion.values
                      .whereIndexed((i, e) => i >= 3 && i < 6)
                      .map(
                        (item) => Expanded(
                          child: EmojiSelectItem(
                            item: item,
                            onSelect: (value) {
                              _selectedEmotion.value = value;
                            },
                            isSelect: _selectedEmotion.value == item,
                          ),
                        ),
                      )
                      .expandIndexed(
                        (i, e) => [e, SizedBox(width: i == 3 ? 0 : 12)],
                      ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: EmojiSelectItem(
                      item: Emotion.neutral,
                      onSelect: (value) {
                        _selectedEmotion.value = value;
                      },
                      isSelect: _selectedEmotion.value == Emotion.neutral,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(child: SizedBox()),
                  const SizedBox(width: 12),
                  const Expanded(child: SizedBox()),
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
                "Thêm chi tiêu 🚀",
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
