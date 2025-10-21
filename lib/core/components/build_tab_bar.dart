import 'package:collection/collection.dart';
import 'package:emoti_spend/core/design_system/app_text_style.dart';
import 'package:emoti_spend/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class BuildTabBar extends StatefulWidget {
  const BuildTabBar({super.key, required this.tabItems, required this.onTap});

  final List<String> tabItems;
  final void Function(int index) onTap;

  @override
  State<BuildTabBar> createState() => _BuildTabBarState();
}

class _BuildTabBarState extends State<BuildTabBar> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: context.shadowMd,
      ),
      child: Row(
        children: [
          ...widget.tabItems.mapIndexed(
            (index, item) => Expanded(
              child: GestureDetector(
                onTap: () => setState(() {
                  _currentIndex = index;
                  widget.onTap(index);
                }),
                child: _buildItem(context, item, index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, String value, int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        gradient: index == _currentIndex
            ? const LinearGradient(
                colors: [Color(0xFFEC6F8F), Color(0xFFEB8C69)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(
          value,
          style: AppTextStyles.titleMedium.copyWith(
            color: index == _currentIndex ? Colors.white : Colors.grey[800],
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
