import 'package:emoti_spend/core/design_system/app_text_style.dart';
import 'package:flutter/material.dart';

class OutStandingFeaturesPage extends StatelessWidget {
  const OutStandingFeaturesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildFeatureItem(
          context,
          icon: "📊",
          title: "Phân tích thông minh",
          description: "Biểu đồ trực quan, dễ hiểu",
        ),
        const SizedBox(height: 16),
        _buildFeatureItem(
          context,
          icon: "🎯",
          title: "Mục tiêu tài chính",
          description: "Đặt và theo dõi mục tiêu",
        ),
        const SizedBox(height: 16),
        _buildFeatureItem(
          context,
          icon: "⚡️",
          title: "Thêm chi tiêu mạnh",
          description: "Chỉ vài thao tác đơn giản",
        ),
        const SizedBox(height: 20),
        Text(
          "Tính năng nổi bật",
          style: AppTextStyles.headLineText(context).copyWith(fontSize: 32),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Text(
          "Mọi thứ bạn cần để quản lý tài chính hiệu quả!",
          style: AppTextStyles.titleLarge.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
            // fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildFeatureItem(
    BuildContext context, {
    required String icon,
    required String title,
    required String description,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: const Color(0xFFFFD6E8), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              gradient: LinearGradient(
                colors: [Color(0xFFFA8BFF), Color(0xFF2BD2FF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(child: Text(icon, style: TextStyle(fontSize: 24))),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: AppTextStyles.titleLarge.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: AppTextStyles.titleMedium.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
