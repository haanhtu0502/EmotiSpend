import 'package:emoti_spend/core/design_system/app_text_style.dart';
import 'package:emoti_spend/core/design_system/image_constant.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(ImageConstant.appLogo, width: 180, height: 180),
        Text(
          "Chào mừng đến EmotiSpend!",
          style: AppTextStyles.headLineText(context),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Text(
          "Ứng dụng quản lý chi tiêu thông minh kết hợp cảm xúc - Giúp bạn hiểu rõ hơn về thói quen chi tiêu của mình",
          style: AppTextStyles.titleLarge.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
            // fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
