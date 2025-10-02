import 'dart:math';

import 'package:emoti_spend/core/design_system/app_text_style.dart';
import 'package:emoti_spend/mvvm/data/enum/emotion.dart';
import 'package:flutter/material.dart';

class FollowEmotionPage extends StatefulWidget {
  const FollowEmotionPage({super.key});

  @override
  State<FollowEmotionPage> createState() => _FollowEmotionPageState();
}

class _FollowEmotionPageState extends State<FollowEmotionPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double size = 240; // tổng kích thước widget
    double radius = 90; // bán kính vòng tròn
    double center = size / 2;
    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: size,
          width: size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Emoji ở giữa
              Text("💝", style: TextStyle(fontSize: 40)),
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _controller.value * 2 * pi,
                    child: SizedBox(
                      width: size,
                      height: size,
                      child: Stack(
                        children: [
                          ...List.generate(Emotion.values.length, (index) {
                            double angle =
                                (2 * pi / Emotion.values.length) * index;
                            double x = center + radius * cos(angle) - 25;
                            double y = center + radius * sin(angle) - 25;
                            return Positioned(
                              left: x,
                              top: y,
                              child: _buildEmojiItem(
                                Emotion.values[index].toEmoji,
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        Text(
          "Theo dõi cảm xúc chi tiêu",
          style: AppTextStyles.headLineText(context),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Text(
          "Ghi nhận cảm xúc khi chi tiêu để phân tích và cải thiện thói quen tài chính. Hiểu rõ khi nào bạn chi tiêu nhiều nhất!",
          style: AppTextStyles.titleLarge.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
            // fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildEmojiItem(String emoji) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // màu bóng
            blurRadius: 12, // độ mờ
            spreadRadius: 2, // lan rộng
            offset: Offset(0, 4), // dịch chuyển bóng
          ),
        ],
      ),
      child: Center(child: Text(emoji, style: TextStyle(fontSize: 28))),
    );
  }
}
