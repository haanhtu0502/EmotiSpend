import 'package:emoti_spend/core/design_system/app_text_style.dart';
import 'package:emoti_spend/core/extensions/double_extension.dart';
import 'package:flutter/material.dart';

class BuildExpenseEmoItem extends StatelessWidget {
  const BuildExpenseEmoItem({
    super.key,
    required this.emo,
    required this.amount,
    required this.percent,
  });

  final String emo;
  final double amount;
  final int percent;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      width: 90,
      decoration: BoxDecoration(
        color: theme.onSurfaceVariant,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(emo, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 8),
          Text(
            amount.formatMoney(),
            style: AppTextStyles.titleMedium.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '$percent%',
            style: AppTextStyles.titleSmall.copyWith(color: theme.onBackground),
          ),
        ],
      ),
    );
  }
}
