import 'package:emoti_spend/core/design_system/app_text_style.dart';
import 'package:flutter/material.dart';

class BuildChoiceItem extends StatelessWidget {
  const BuildChoiceItem({
    super.key,
    required this.text,
    required this.amount,
    this.isSelected = false,
    required this.onPress,
  });

  final String text;
  final double amount;
  final bool isSelected;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: isSelected
              ? const LinearGradient(
                  begin: Alignment
                      .topLeft, // 135° tương ứng với từ trên trái -> dưới phải
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFFF6B9D), // Hồng
                    Color(0xFF66D3FA), // Xanh dương nhạt
                  ],
                )
              : null,
          border: Border.all(width: 1, color: const Color(0xFFFFD6DA)),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            text,
            style: AppTextStyles.titleMedium.copyWith(
              color: isSelected ? Colors.white : const Color(0xFF64748B),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
