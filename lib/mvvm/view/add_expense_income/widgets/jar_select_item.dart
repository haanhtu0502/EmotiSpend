import 'package:emoti_spend/core/design_system/app_text_style.dart';
import 'package:emoti_spend/mvvm/data/enum/jar.dart';
import 'package:flutter/material.dart';

class JarSelectItem extends StatefulWidget {
  const JarSelectItem({
    super.key,
    required this.item,
    this.isSelected = false,
    required this.onSelect,
  });

  final Jar item;
  final bool isSelected;
  final void Function(Jar value) onSelect;

  @override
  State<JarSelectItem> createState() => _JarSelectItemState();
}

class _JarSelectItemState extends State<JarSelectItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onSelect(widget.item);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeIn,
        padding: const EdgeInsetsDirectional.symmetric(vertical: 12),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: widget.item.toLinearGradient,
          border: widget.isSelected
              ? Border.all(
                  width: 6,
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
              widget.item.toName,
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
