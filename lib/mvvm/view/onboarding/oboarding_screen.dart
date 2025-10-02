import 'package:emoti_spend/core/components/build_button.dart';
import 'package:emoti_spend/core/design_system/app_text_style.dart';
import 'package:emoti_spend/core/extensions/context_extensions.dart';
import 'package:emoti_spend/mvvm/view/onboarding/pages/follow_emotion_page.dart';
import 'package:emoti_spend/mvvm/view/onboarding/pages/jars_methos_page.dart';
import 'package:emoti_spend/mvvm/view/onboarding/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);
  final _introKey = GlobalKey<IntroductionScreenState>();

  void _onNextPage() {
    _introKey.currentState!.next();
    _currentPage.value++;
  }

  void _onPrevPage() {
    _introKey.currentState!.previous();
    _currentPage.value--;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          decoration: context.gradientBackground,
          child: Center(
            child: Container(
              width: double.infinity,
              height: 600,
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFF0FFFB), // xanh mint nhạt
                    Color(0xFFFFFFFF), // trắng
                  ],
                ),

                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 20),
                ],
              ),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: IntroductionScreen(
                      key: _introKey,
                      rawPages: [
                        WelcomePage(),
                        FollowEmotionPage(),
                        JarsMethodPage(),
                      ],
                      showDoneButton: false,
                      showNextButton: false,
                      dotsDecorator: DotsDecorator(
                        size: const Size.square(10.0),
                        activeSize: const Size(25.0, 10.0),
                        activeColor: Theme.of(context).colorScheme.secondary,
                        color: Colors.black26,
                        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      // initialPage: 0,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildButtons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Row(
      children: [
        ValueListenableBuilder(
          valueListenable: _currentPage,
          builder: (context, value, child) {
            if (_currentPage.value == 0) return const SizedBox.shrink();
            return Expanded(
              child: BuildButton(
                onPressed: _onPrevPage,
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
            );
          },
        ),
        ValueListenableBuilder(
          valueListenable: _currentPage,
          builder: (context, value, child) {
            return SizedBox(width: _currentPage.value == 0 ? 0 : 12);
          },
        ),
        Expanded(
          child: BuildButton(
            onPressed: _onNextPage,
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
    );
  }
}
