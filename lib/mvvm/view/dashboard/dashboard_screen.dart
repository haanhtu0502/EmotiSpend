import 'package:emoti_spend/core/design_system/app_text_style.dart';
import 'package:emoti_spend/mvvm/view/dashboard/widgets/animated_header.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              AnimatedHeaderBackground(),
              Positioned(
                top: 100,
                left: 30,
                right: 30,
                child: _buildHeaderCard(context, theme),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderCard(BuildContext context, ColorScheme theme) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.08),
            offset: const Offset(0, 10),
            blurRadius: 40,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "SỐ DƯ KHẢ DỤNG",
                style: AppTextStyles.titleMedium.copyWith(
                  color: theme.onBackground,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6FFFA),
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_upward,
                      color: const Color(0xFF00B894),
                      size: 18,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "12%",
                      style: AppTextStyles.titleMedium.copyWith(
                        color: const Color(0xFF00B894),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "16.000.000",
                style: AppTextStyles.headlineLarge.copyWith(
                  color: theme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  color: theme.onSurfaceVariant,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFF00B894), Color(0xFF00CEC9)],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Icon(Icons.trending_up, color: Colors.white),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Thu nhập",
                          style: AppTextStyles.titleMedium.copyWith(
                            color: theme.onBackground,
                          ),
                        ),
                        Text(
                          "15.0M",
                          style: AppTextStyles.titleLarge.copyWith(
                            color: theme.onSurface,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  color: theme.onSurfaceVariant,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFFF4757), // #ff4757
                            Color(0xFFFF6B9D), // #ff6b9d
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Icon(Icons.trending_down, color: Colors.white),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Chi tiêu",
                          style: AppTextStyles.titleMedium.copyWith(
                            color: theme.onBackground,
                          ),
                        ),
                        Text(
                          "2.15M",
                          style: AppTextStyles.titleLarge.copyWith(
                            color: theme.onSurface,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
