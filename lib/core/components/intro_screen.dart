import 'dart:math';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:emoti_spend/core/components/build_button.dart';
import 'package:emoti_spend/core/design_system/app_text_style.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({
    super.key,
    required this.pages,
    this.onPageChange,
    required this.onDone,
  });

  final List<Widget> pages;
  final void Function(int)? onPageChange;
  final void Function() onDone;

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late PageController _pageController;
  int _currentPage = 0;
  bool _isScrolling = false;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _animateScroll(int page) async {
    // bool isValidToProgress = widget.canProgress(getCurrentPage());

    _isScrolling = true;
    await _pageController.animateToPage(
      max(min(page, widget.pages.length - 1), 0),
      duration: Duration(milliseconds: 350),
      curve: Curves.easeIn,
    );
    if (mounted) {
      _isScrolling = false;
    }
  }

  void _next() {
    if (_isScrolling) return;
    _animateScroll(_currentPage + 1);
    FocusScope.of(context).unfocus();
  }

  void _previous() {
    if (_isScrolling) return;
    _animateScroll(_currentPage - 1);
    FocusScope.of(context).unfocus();
  }

  bool _onScroll(ScrollNotification notification) {
    final metrics = notification.metrics;
    if (metrics is PageMetrics && metrics.page != null) {
      if (mounted) {
        setState(() => _currentPage = metrics.page!.toInt());
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: NotificationListener<ScrollNotification>(
            onNotification: _onScroll,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.pages.length,
              onPageChanged: widget.onPageChange,
              itemBuilder: (context, index) => NotificationListener(
                onNotification: (_) => true,
                child: widget.pages[index],
              ),
            ),
          ),
        ),
        DotsIndicator(
          reversed: false,
          dotsCount: widget.pages.length,
          position: _pageController.page ?? 0,
          decorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(25.0, 10.0),
            activeColor: Theme.of(context).colorScheme.secondary,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
          onTap: _animateScroll,
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            if (_currentPage != 0) ...[
              Expanded(
                child: BuildButton(
                  onPressed: _previous,
                  content: Text(
                    "Quay lại",
                    style: AppTextStyles.titleLarge.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: Colors.white,
                  border: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  radius: 12,
                ),
              ),
              SizedBox(width: 12),
            ],

            Expanded(
              child: BuildButton(
                onPressed: _next,
                content: Text(
                  "Tiếp theo",
                  style: AppTextStyles.titleLarge.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: Theme.of(context).colorScheme.primary,
                radius: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
