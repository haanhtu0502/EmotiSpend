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
      builder: (context, state) => const Placeholder(),
    ),
    GoRoute(
      parentNavigatorKey: appNavigationKey,
      path: AppPages.login,
      builder: (context, state) => const Placeholder(),
    ),
  ],
);
