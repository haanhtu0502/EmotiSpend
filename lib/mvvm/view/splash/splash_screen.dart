import 'package:emoti_spend/core/design_system/app_constant.dart';
import 'package:emoti_spend/core/design_system/app_text_style.dart';
import 'package:emoti_spend/core/design_system/image_constant.dart';
import 'package:emoti_spend/mvvm/data/enum/jar.dart';
import 'package:emoti_spend/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _progressController;
  late Animation<double> _animation;

  final List<String> loadingTexts = [
    "Đang khởi động...",
    "Chuẩn bị hũ tiết kiệm...",
    "Tải dữ liệu cảm xúc...",
    "Phân tích chi tiêu...",
    "Sắp xong rồi...",
    "Chào mừng bạn!",
  ];
  int textIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    _progressController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_progressController);
    _progressController.forward();

    // đổi text
    Future.doWhile(() async {
      await Future.delayed(const Duration(milliseconds: 600));
      if (mounted && textIndex < loadingTexts.length - 1) {
        setState(() {
          textIndex++;
        });
        return true;
      }
      return false;
    });

    // done splash
    Future.delayed(const Duration(seconds: 4), () {
      // Navigate sang Login/Home
      if (mounted) GoRouter.of(context).go(AppPages.login);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFA8BFF), Color(0xFF2BD2FF), Color(0xFF2BFF88)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 20),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    ImageConstant.appLogo,
                    fit: BoxFit.contain,
                    width: 180,
                    height: 180,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppConstant.appName,
                    style: AppTextStyles.headLineText(context),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Chi tiêu thông minh, cảm xúc tích cực",
                    style: AppTextStyles.titleLarge.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: Jar.values
                        .map(
                          (item) => Container(
                            width: 40,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: const [
                                BoxShadow(color: Colors.black12, blurRadius: 4),
                              ],
                            ),
                            child: FractionallySizedBox(
                              alignment: Alignment.bottomCenter,
                              heightFactor: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      item.toColor,
                                      item.toColor.withOpacity(0.7),
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    item.toEmoji,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 28),
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return LinearProgressIndicator(
                        value: _progressController.value,

                        minHeight: 6,
                        borderRadius: BorderRadius.circular(10),
                        // backgroundColor: Colors.grey.shade200,
                        valueColor: AlwaysStoppedAnimation(
                          Theme.of(context).colorScheme.primary,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 28),
                  Text(
                    loadingTexts[textIndex],
                    style: AppTextStyles.titleLarge.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    "Version 1.0.0",
                    style: AppTextStyles.titleMedium.copyWith(
                      color: Theme.of(context).hintColor,
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
