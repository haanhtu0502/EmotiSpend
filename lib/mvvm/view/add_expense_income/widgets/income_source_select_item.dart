import 'package:emoti_spend/core/design_system/app_text_style.dart';
import 'package:emoti_spend/mvvm/data/enum/income_source.dart';
import 'package:flutter/material.dart';

class IncomeSourceSelectItem extends StatefulWidget {
  const IncomeSourceSelectItem({
    super.key,
    required this.item,
    this.isSelected = false,
    required this.onSelect,
  });

  final IncomeSource item;
  final bool isSelected;
  final void Function(IncomeSource value) onSelect;

  @override
  State<IncomeSourceSelectItem> createState() => _IncomeSourceSelectItemState();
}

class _IncomeSourceSelectItemState extends State<IncomeSourceSelectItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onSelect(widget.item);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeIn,
        padding: const EdgeInsetsDirectional.symmetric(vertical: 12),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: widget.item.toLinearGradien,
          border: widget.isSelected
              ? Border.all(
                  width: 4,
                  color: Theme.of(context).colorScheme.primary,
                )
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(widget.item.toEmoji, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 4),
            Text(
              widget.item.toText,
              style: AppTextStyles.titleMedium.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
