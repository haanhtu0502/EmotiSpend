import 'package:collection/collection.dart';
import 'package:emoti_spend/core/design_system/app_text_style.dart';
import 'package:emoti_spend/mvvm/data/enum/emotion.dart';
import 'package:emoti_spend/mvvm/data/enum/jar.dart';
import 'package:emoti_spend/mvvm/view/dashboard/widgets/animated_header.dart';
import 'package:emoti_spend/mvvm/view/dashboard/widgets/build_expense_emo_item.dart';
import 'package:emoti_spend/mvvm/view/dashboard/widgets/build_jar_card.dart';
import 'package:emoti_spend/mvvm/view/dashboard/widgets/build_transaction_item.dart';
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            stretch: true,
            floating: false,
            pinned: true,
            leading: const SizedBox(),
            expandedHeight: 200,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraint) {
                final percent =
                    (constraint.maxHeight - kToolbarHeight) /
                    (250 - kToolbarHeight);
                return Stack(
                  fit: StackFit.expand,
                  clipBehavior: Clip.none,
                  children: [
                    const AnimatedHeaderBackground(),
                    if (percent > 0.3)
                      Positioned(
                        top: 110 * percent.clamp(0.0, 1.0),
                        left: 30,
                        right: 30,
                        child: _buildHeaderCard(context, theme),
                      ),
                  ],
                );
              },
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 90)),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
                  child: _buildJars(context, theme),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: _buildEmoExpense(context, theme),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
                  child: _buildHistoryTransaction(context, theme),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderCard(BuildContext context, ColorScheme theme) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.08),
            offset: Offset(0, 10),
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
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                decoration: const BoxDecoration(
                  color: Color(0xFFE6FFFA),
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_upward,
                      color: Color(0xFF00B894),
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
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  color: theme.onSurfaceVariant,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFF00B894), Color(0xFF00CEC9)],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: const Icon(Icons.trending_up, color: Colors.white),
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
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  color: theme.onSurfaceVariant,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFFF4757), // #ff4757
                            Color(0xFFFF6B9D), // #ff6b9d
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: const Icon(
                        Icons.trending_down,
                        color: Colors.white,
                      ),
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

  Widget _buildJars(BuildContext context, ColorScheme theme) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "6 Hũ tài chính",
              style: AppTextStyles.titleXLarge.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              child: Row(
                children: [
                  Text(
                    "Xem tất cả",
                    style: AppTextStyles.titleLarge.copyWith(
                      color: theme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: theme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: BuildJarCard(
                icon: Jar.nec.toEmoji,
                title: Jar.nec.toName,
                percent: Jar.nec.toPercent.toInt(),
                color: Jar.nec.toColor,
                remain: 6500000,
                amount: 8250000,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: BuildJarCard(
                icon: Jar.educ.toEmoji,
                title: Jar.educ.toName,
                percent: Jar.educ.toPercent.toInt(),
                color: Jar.educ.toColor,
                remain: 900000,
                amount: 1500000,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: BuildJarCard(
                icon: Jar.ltss.toEmoji,
                title: Jar.ltss.toName,
                percent: Jar.ltss.toPercent.toInt(),
                color: Jar.ltss.toColor,
                remain: 600000,
                amount: 1500000,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: BuildJarCard(
                icon: Jar.play.toEmoji,
                title: Jar.play.toName,
                percent: Jar.play.toPercent.toInt(),
                color: Jar.play.toColor,
                remain: 225000,
                amount: 1500000,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: BuildJarCard(
                icon: Jar.give.toEmoji,
                title: Jar.give.toName,
                percent: Jar.give.toPercent.toInt(),
                color: Jar.give.toColor,
                remain: 525123,
                amount: 750432,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: BuildJarCard(
                icon: Jar.ffa.toEmoji,
                title: Jar.ffa.toName,
                percent: Jar.ffa.toPercent.toInt(),
                color: Jar.ffa.toColor,
                remain: 750000,
                amount: 1500000,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildEmoExpense(BuildContext context, ColorScheme theme) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.08),
            offset: Offset(0, 10),
            blurRadius: 40,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Cảm xúc chi tiêu",
                style: AppTextStyles.titleXLarge.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                child: Row(
                  children: [
                    Text(
                      "Xem tất cả",
                      style: AppTextStyles.titleLarge.copyWith(
                        color: theme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: theme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 110,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...Emotion.values
                    .map((val) {
                      return BuildExpenseEmoItem(
                        emo: val.toEmoji,
                        amount: 3200000,
                        percent: 35,
                      );
                    })
                    .expandIndexed(
                      (i, item) => [
                        item,
                        SizedBox(width: i == Emotion.values.length - 1 ? 0 : 8),
                      ],
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryTransaction(BuildContext context, ColorScheme theme) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.08),
            offset: Offset(0, 10),
            blurRadius: 40,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Giao dịch gần đây",
                style: AppTextStyles.titleXLarge.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                child: Row(
                  children: [
                    Text(
                      "Xem tất cả",
                      style: AppTextStyles.titleLarge.copyWith(
                        color: theme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: theme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          BuildTransactionItem(
            jar: Jar.educ,
            emotion: Emotion.happy,
            transactionName: "Ăn trưa với bạn",
            amount: 125000,
            date: DateTime.now(),
            isExspense: true,
          ),
          const SizedBox(height: 8),
          Divider(color: theme.outline),
          const SizedBox(height: 8),
          BuildTransactionItem(
            transactionName: "Tiền lì xì",
            amount: 125000,
            date: DateTime.now(),
            isExspense: false,
          ),
          const SizedBox(height: 8),
          Divider(color: theme.outline),
          const SizedBox(height: 8),
          BuildTransactionItem(
            jar: Jar.ltss,
            emotion: Emotion.happy,
            transactionName: "Gửi ngân hàng",
            amount: 125000,
            date: DateTime.now(),
            isExspense: true,
          ),
        ],
      ),
    );
  }
}
