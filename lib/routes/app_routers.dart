import 'package:emoti_spend/mvvm/view/login/login_screen.dart';
import 'package:emoti_spend/mvvm/view/navigation_screen/navigation_screen.dart';
import 'package:emoti_spend/mvvm/view/onboarding/oboarding_screen.dart';
import 'package:emoti_spend/mvvm/view/splash/splash_screen.dart';
import 'package:emoti_spend/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final appNavigationKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  initialLocation: AppPages.splash,
  navigatorKey: appNavigationKey,
  redirect: (context, state) {
    debugPrint('Current location: ${state.uri.path}');
    return null; // Ensure no unintended redirects happen
  },
  routes: [
    GoRoute(
      parentNavigatorKey: appNavigationKey,
      path: AppPages.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      parentNavigatorKey: appNavigationKey,
      path: AppPages.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      parentNavigatorKey: appNavigationKey,
      path: AppPages.onboarding,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      parentNavigatorKey: appNavigationKey,
      path: AppPages.home,
      builder: (context, state) => const NavigationScreen(),
    ),
  ],
);
