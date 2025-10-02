import 'package:emoti_spend/core/components/build_button.dart';
import 'package:emoti_spend/core/components/build_text_input_field.dart';
import 'package:emoti_spend/core/design_system/app_constant.dart';
import 'package:emoti_spend/core/design_system/app_text_style.dart';
import 'package:emoti_spend/core/design_system/icon_constant.dart';
import 'package:emoti_spend/core/design_system/image_constant.dart';
import 'package:emoti_spend/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  bool isRemember = false;

  void _onLogin() {
    // if (_key.currentState!.validate()) {}
    GoRouter.of(context).go(AppPages.onboarding);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFF0FFFB), // xanh mint nhạt
                Color(0xFFFFFFFF), // trắng
              ],
            ),
          ),

          padding: EdgeInsets.only(top: 0, bottom: 20, left: 24, right: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  ImageConstant.appLogo,
                  fit: BoxFit.cover,
                  width: 180,
                  height: 150,
                ),
                // const SizedBox(height: 4),
                Text(
                  AppConstant.appName,
                  style: AppTextStyles.headLineText(context),
                ),
                const SizedBox(height: 8),
                Text(
                  "Chi tiêu thông minh, cảm xúc tích cực",
                  style: AppTextStyles.titleLarge.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                _buildEmojis(context),
                const SizedBox(height: 12),
                _buildFormInput(),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: BuildButton(
                    onPressed: _onLogin,
                    radius: 15,
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    content: Center(
                      child: Text(
                        "ĐĂNG NHẬP NGAY 🚀",
                        style: AppTextStyles.headlineSmall.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.pink.shade100,
                        endIndent: 10,
                      ),
                    ),
                    Text(
                      "Hoặc ",
                      style: AppTextStyles.titleLarge.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.pink.shade100,
                        endIndent: 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _buildSocialButtons(),
                const SizedBox(height: 12),
                RichText(
                  text: TextSpan(
                    style: AppTextStyles.titleLarge.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    children: [
                      const TextSpan(text: "Bạn chưa có tài khoản? "),
                      TextSpan(
                        text: "Đăng ký ngay",
                        style: AppTextStyles.titleLarge.copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.secondary, // xanh Google
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmojis(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFFFFF6E9), Color(0xFFFCEFFD)],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("😄", style: TextStyle(fontSize: 32)),
          Text("🥰", style: TextStyle(fontSize: 32)),
          Text("😎", style: TextStyle(fontSize: 32)),
          Text("🤩", style: TextStyle(fontSize: 32)),
          Text("🎉", style: TextStyle(fontSize: 32)),
        ],
      ),
    );
  }

  Widget _buildFormInput() {
    return Form(
      key: _key,
      child: Column(
        children: [
          BuildTextInputField(
            label: Text(
              "Email hoặc số điện thoại",
              style: AppTextStyles.titleLarge.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
            isRequired: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Color(0xFFFFD6DA),
                width: 2,
              ), // viền hồng
            ),
            hintText: "hello@emotispend.com",

            hintStyle: AppTextStyles.titleMedium.copyWith(
              color: Colors.grey.shade400,
            ),

            controller: _usernameController,
            onChange: (vaue) {},
          ),
          const SizedBox(height: 12),
          BuildTextInputField(
            label: Text(
              "Password",
              style: AppTextStyles.titleLarge.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
            isRequired: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Color(0xFFFFD6DA),
                width: 2,
              ), // viền hồng
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Color(0xFFFF8FA3),
                width: 2,
              ), // đậm hơn khi focus
            ),
            isPassword: true,
            hintText: "•••••••••••••",
            hintStyle: AppTextStyles.titleMedium.copyWith(
              color: Colors.grey.shade400,
            ),
            controller: _passwordController,
            onChange: (vaue) {},
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: isRemember,
                activeColor: Theme.of(context).primaryColor,
                onChanged: (value) {
                  setState(() {
                    isRemember = !isRemember;
                  });
                },
              ),
              Text(
                "Ghi nhớ đăng nhập",
                style: AppTextStyles.titleLarge.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Text(
                "Quên mật khẩu?",
                style: AppTextStyles.titleLarge.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButtons() {
    return Row(
      children: [
        Expanded(
          child: BuildButton(
            onPressed: () {},
            backgroundColor: Color(0xFFEAF3FF),
            border: BorderSide(width: 1, color: Color(0xFFD6E6FF)),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 0),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  IconConstant.facebookIcon,
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  "Facebook",
                  style: AppTextStyles.titleLarge.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: BuildButton(
            onPressed: () {},
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 0),
            border: BorderSide(width: 1, color: Color(0xFFFFE0D6)),
            backgroundColor: Color(0xFFFFF5F0),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  IconConstant.googleIcon,
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  "Google",
                  style: AppTextStyles.titleLarge.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
