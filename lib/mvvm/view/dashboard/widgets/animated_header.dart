import 'package:emoti_spend/core/components/build_glassmorphism.dart';
import 'package:emoti_spend/core/design_system/app_text_style.dart';
import 'package:flutter/material.dart';

class AnimatedHeaderBackground extends StatefulWidget {
  const AnimatedHeaderBackground({super.key});

  @override
  State<AnimatedHeaderBackground> createState() =>
      _AnimatedHeaderBackgroundState();
}

class _AnimatedHeaderBackgroundState extends State<AnimatedHeaderBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _alignmentAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    )..repeat(reverse: true);

    _alignmentAnimation = TweenSequence<Alignment>([
      TweenSequenceItem(
        tween: Tween(begin: Alignment.topLeft, end: Alignment.bottomRight),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(begin: Alignment.bottomRight, end: Alignment.topRight),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(begin: Alignment.topRight, end: Alignment.topLeft),
        weight: 1,
      ),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _alignmentAnimation,
      builder: (context, child) {
        return Container(
          height: 240,
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: _alignmentAnimation.value,
              end: Alignment(
                -_alignmentAnimation.value.x,
                -_alignmentAnimation.value.y,
              ),
              colors: const [Color(0xFFFA8BFF), Color(0xFFFECA57)],
            ),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Chào buổi sáng 👋",
                      style: AppTextStyles.titleLarge.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Anh Tú",
                      style: AppTextStyles.titleXLarge.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                BuildGlassmorphism(),
              ],
            ),
          ),
        );
      },
    );
  }
}
