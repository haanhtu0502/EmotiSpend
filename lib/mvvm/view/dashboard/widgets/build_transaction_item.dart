import 'package:emoti_spend/core/design_system/app_text_style.dart';
import 'package:emoti_spend/core/extensions/double_extension.dart';
import 'package:emoti_spend/mvvm/data/enum/emotion.dart';
import 'package:emoti_spend/mvvm/data/enum/jar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BuildTransactionItem extends StatelessWidget {
  const BuildTransactionItem({
    super.key,
    this.jar,
    this.emotion,
    required this.transactionName,
    required this.amount,
    this.isExspense = true,
    required this.date,
  }) : assert(
         !(isExspense && jar == null),
         "Jar is required if isExspense = true",
       ),
       assert(
         !(isExspense && emotion == null),
         "Emotion is required if isExspense = true",
       );

  final Jar? jar;
  final Emotion? emotion;
  final String transactionName;
  final double amount;
  final bool isExspense;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Row(
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
              isExspense ? jar!.toEmoji : "💸",
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              transactionName,
              style: AppTextStyles.titleMedium.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (isExspense) ...[
              const SizedBox(height: 4),
              Text(
                '${jar!.toName} · ${emotion!.toEmoji}',
                style: AppTextStyles.titleSmall.copyWith(
                  color: theme.onBackground,
                ),
              ),
            ],
          ],
        ),
        const Spacer(),
        Column(
          children: [
            Text(
              '${isExspense ? '-' : '+'} ${amount.formatVND()}',
              style: AppTextStyles.titleLarge.copyWith(
                color: isExspense ? Colors.red : Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),

            Text(
              DateFormat('dd/MM/yyyy hh:mm').format(date),
              style: AppTextStyles.titleSmall.copyWith(
                color: theme.onBackground,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
