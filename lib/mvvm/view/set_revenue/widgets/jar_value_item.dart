import 'package:emoti_spend/core/design_system/app_text_style.dart';
import 'package:emoti_spend/core/extensions/double_extension.dart';
import 'package:emoti_spend/mvvm/data/enum/jar.dart';
import 'package:flutter/material.dart';

class JarValueItem extends StatefulWidget {
  const JarValueItem({
    super.key,
    required this.jar,
    required this.amount,
    required this.percent,
  });
  final Jar jar;
  final double amount;
  final int percent;

  @override
  State<JarValueItem> createState() => _JarValueItemState();
}

class _JarValueItemState extends State<JarValueItem> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: theme.onSurfaceVariant,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                widget.jar.toEmoji,
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.jar.toName,
                style: AppTextStyles.titleMedium.copyWith(
                  color: theme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.amount.formatVND(),
                style: AppTextStyles.titleMedium.copyWith(color: Colors.green),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
