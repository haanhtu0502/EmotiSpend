import 'package:emoti_spend/core/components/intro_screen.dart';
import 'package:emoti_spend/core/extensions/context_extensions.dart';
import 'package:emoti_spend/mvvm/view/onboarding/pages/follow_emotion_page.dart';
import 'package:emoti_spend/mvvm/view/onboarding/pages/jars_methos_page.dart';
import 'package:emoti_spend/mvvm/view/onboarding/pages/out_standing_features.dart';
import 'package:emoti_spend/mvvm/view/onboarding/pages/welcome_page.dart';
import 'package:emoti_spend/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: context.gradientBackground,
        child: SafeArea(
          child: Center(
            child: Container(
              width: double.infinity,
              height: 600,
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
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
                    child: IntroScreen(
                      onDone: () {
                        GoRouter.of(context).push(AppPages.home);
                      },
                      pages: const [
                        WelcomePage(),
                        FollowEmotionPage(),
                        JarsMethodPage(),
                        OutStandingFeaturesPage(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
