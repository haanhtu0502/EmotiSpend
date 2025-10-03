import 'package:emoti_spend/core/components/intro_screen.dart';
import 'package:emoti_spend/core/extensions/context_extensions.dart';
import 'package:emoti_spend/mvvm/view/onboarding/pages/follow_emotion_page.dart';
import 'package:emoti_spend/mvvm/view/onboarding/pages/jars_methos_page.dart';
import 'package:emoti_spend/mvvm/view/onboarding/pages/welcome_page.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
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
                    child: IntroScreen(
                      onDone: () {},
                      pages: [
                        WelcomePage(),
                        FollowEmotionPage(),
                        JarsMethodPage(),
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
