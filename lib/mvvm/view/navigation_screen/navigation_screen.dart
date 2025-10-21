import 'package:collection/collection.dart';
import 'package:emoti_spend/core/design_system/app_text_style.dart';
import 'package:emoti_spend/mvvm/view/dashboard/dashboard_screen.dart';
import 'package:emoti_spend/mvvm/view/navigation_screen/data_class/nav_item.dart';
import 'package:emoti_spend/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final List<NavItem> _listFeatures = const [
    NavItem(icon: Icons.home, name: "Trang chủ"),
    NavItem(icon: Icons.savings, name: "6 hũ"),
    NavItem(icon: Icons.line_axis, name: "Báo cáo"),
    NavItem(icon: Icons.emoji_emotions, name: "Cảm xúc"),
    NavItem(icon: Icons.settings, name: "Cài đặt"),
  ];

  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).push(AppPages.addTransaction);
        },
        shape: const CircleBorder(),
        child: const Center(
          child: Icon(Icons.add, color: Colors.white, size: 36),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        height: 74,
        // notchMargin: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ..._listFeatures.mapIndexed(
              (index, item) => ValueListenableBuilder(
                valueListenable: _currentIndex,
                builder: (context, value, child) {
                  return _buildTabWidget(
                    context,
                    onPressed: () {
                      _currentIndex.value = index;
                    },
                    iconData: item.icon,
                    name: item.name,
                    color: _currentIndex.value == index
                        ? theme.primary
                        : theme.onBackground,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: _currentIndex,
        builder: (contex, value, child) {
          switch (_currentIndex.value) {
            case 0:
              return const DashboardScreen();
            case 1:
              return const DashboardScreen();
            case 2:
              return const DashboardScreen();
            case 3:
              return const DashboardScreen();
            case 4:
              return const DashboardScreen();
            default:
              return const DashboardScreen();
          }
        },
      ),
    );
  }

  Widget _buildTabWidget(
    BuildContext context, {
    required void Function() onPressed,
    required IconData iconData,
    required String name,
    required Color color,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Icon(iconData, color: color),
          const SizedBox(height: 4),
          Text(
            name,
            style: AppTextStyles.titleSmall.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
