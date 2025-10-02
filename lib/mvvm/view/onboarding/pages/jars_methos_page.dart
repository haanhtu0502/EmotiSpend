import 'package:emoti_spend/core/design_system/app_text_style.dart';
import 'package:emoti_spend/mvvm/data/enum/jar.dart';
import 'package:flutter/material.dart';

class JarsMethodPage extends StatelessWidget {
  const JarsMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildJarItem(
              context,
              icon: Jar.nec.toEmoji,
              color: Jar.nec.toColor,
              percent: Jar.nec.toPercent.toInt().toString(),
            ),
            const SizedBox(width: 12),
            _buildJarItem(
              context,
              icon: Jar.educ.toEmoji,
              color: Jar.educ.toColor,
              percent: Jar.educ.toPercent.toInt().toString(),
            ),
            const SizedBox(width: 12),
            _buildJarItem(
              context,
              icon: Jar.ltss.toEmoji,
              color: Jar.ltss.toColor,
              percent: Jar.ltss.toPercent.toInt().toString(),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildJarItem(
              context,
              icon: Jar.play.toEmoji,
              color: Jar.play.toColor,
              percent: Jar.play.toPercent.toInt().toString(),
            ),
            const SizedBox(width: 12),
            _buildJarItem(
              context,
              icon: Jar.give.toEmoji,
              color: Jar.give.toColor,
              percent: Jar.give.toPercent.toInt().toString(),
            ),
            const SizedBox(width: 12),
            _buildJarItem(
              context,
              icon: Jar.ffa.toEmoji,
              color: Jar.ffa.toColor,
              percent: Jar.ffa.toPercent.toInt().toString(),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          "Phương pháp 6 hũ",
          style: AppTextStyles.headLineText(context),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Text(
          "Tự động phân chia thu nhập thành 6 hũ: Thiết yếu, Giáo dục, Tiết kiệm, Hưởng thụ, Cho đi và Tự do tài chính",
          style: AppTextStyles.titleLarge.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
            // fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildJarItem(
    BuildContext context, {
    required String icon,
    required Color color,
    required String percent,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(icon, style: TextStyle(fontSize: 32)),
          const SizedBox(height: 4),
          Text(
            "$percent%",
            style: AppTextStyles.titleLarge.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
