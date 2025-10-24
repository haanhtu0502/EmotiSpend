import 'package:emoti_spend/core/components/build_button.dart';
import 'package:emoti_spend/core/components/build_text_input_field.dart';
import 'package:emoti_spend/core/components/static_header.dart';
import 'package:emoti_spend/core/design_system/app_colors.dart';
import 'package:emoti_spend/core/design_system/app_text_style.dart';
import 'package:emoti_spend/core/extensions/double_extension.dart';
import 'package:emoti_spend/mvvm/data/enum/jar.dart';
import 'package:emoti_spend/mvvm/view/set_revenue/data_class/jar_amount_item.dart';
import 'package:emoti_spend/mvvm/view/set_revenue/widgets/build_choice_item.dart';
import 'package:emoti_spend/mvvm/view/set_revenue/widgets/jar_value_item.dart';
import 'package:flutter/material.dart';

class SetRevenueScreen extends StatefulWidget {
  const SetRevenueScreen({super.key});

  @override
  State<SetRevenueScreen> createState() => _SetRevenueScreenState();
}

class _SetRevenueScreenState extends State<SetRevenueScreen> {
  final TextEditingController _revenueController = TextEditingController();
  int? _currentIndex;
  List<JarAmountItem> _listJarAmountItems = Jar.values
      .map(
        (e) => JarAmountItem(jar: e, amount: 0, percent: e.toPercent.toInt()),
      )
      .toList();

  // void _updatePercent(int index, int newPercent) {
  //   _listJarAmountItems = _listJarAmountItems
  //       .mapIndexed((i, e) => i == index ? e.copyWith(percent: newPercent) : e)
  //       .toList();
  // }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      // backgroundColor: const Color.fromRGBO(255, 255, 255, 0.95),
      body: Column(
        children: [
          StaticHeader(
            padding: const EdgeInsetsGeometry.only(
              left: 16,
              right: 16,
              bottom: 16,
            ),
            child: Column(
              children: [
                SafeArea(
                  bottom: false,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Thiết lập số dư',
                        style: AppTextStyles.headlineMedium.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(),
                    ],
                  ),
                ),
                // const SizedBox(height: 12),
                // Text(
                //   "Nhập số dư của bạn, EmotiSpend sẽ tự động chia thành 6 hũ theo phương pháp quản lý tài chính thông minh",
                //   style: AppTextStyles.titleMedium.copyWith(
                //     color: Colors.white,
                //   ),
                //   textAlign: TextAlign.center,
                // ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Container(
                    //   width: 150,
                    //   height: 150,
                    //   decoration: const BoxDecoration(
                    //     image: DecorationImage(
                    //       image: AssetImage(ImageConstant.appLogo),
                    //       fit: BoxFit.contain,
                    //     ),
                    //   ),
                    // ),
                    Row(
                      children: [
                        Text(
                          "Số dư hiện tại của bạn",
                          style: AppTextStyles.titleLarge.copyWith(
                            color: theme.onSurface,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,

                      child: BuildTextInputField(
                        controller: _revenueController,
                        onChange: (value) {},
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFFFFD6DA),
                            width: 3,
                          ), // viền hồng
                        ),
                        isNumber: true,
                        hintText: "10.000.000đ",
                        textStyle: AppTextStyles.headlineLarge,
                        hintStyle: AppTextStyles.headlineLarge.copyWith(
                          color: Colors.grey.shade400,
                        ),
                        textAlign: TextAlign.center,
                        filledColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildChoices(context),
                    const SizedBox(height: 16),
                    _buildJarsAmount(context),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: BuildButton(
                        radius: 9999,
                        backgroundColor: theme.primary,
                        onPressed: () {},
                        content: Text(
                          "Lưu thay đổi",
                          style: AppTextStyles.titleLarge.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 36),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChoices(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: BuildChoiceItem(
                text: "5 triệu",
                amount: 5000000,
                onPress: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                  _revenueController.text = 5000000.0.formatVND(
                    isShowCurrency: false,
                  );
                },
                isSelected: _currentIndex == 0,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: BuildChoiceItem(
                text: "10 triệu",
                amount: 10000000,
                onPress: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                  _revenueController.text = 10000000.0.formatVND(
                    isShowCurrency: false,
                  );
                },
                isSelected: _currentIndex == 1,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: BuildChoiceItem(
                text: "15 triệu",
                amount: 15000000,
                onPress: () {
                  setState(() {
                    _currentIndex = 2;
                  });
                  _revenueController.text = 15000000.0.formatVND(
                    isShowCurrency: false,
                  );
                },
                isSelected: _currentIndex == 2,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: BuildChoiceItem(
                text: "20 triệu",
                amount: 20000000,
                onPress: () {
                  setState(() {
                    _currentIndex = 3;
                  });
                  _revenueController.text = 20000000.0.formatVND(
                    isShowCurrency: false,
                  );
                },
                isSelected: _currentIndex == 3,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: BuildChoiceItem(
                text: "30 triệu",
                amount: 30000000,
                onPress: () {
                  setState(() {
                    _currentIndex = 4;
                  });
                  _revenueController.text = 30000000.0.formatVND(
                    isShowCurrency: false,
                  );
                },
                isSelected: _currentIndex == 4,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: BuildChoiceItem(
                text: "50 triệu",
                amount: 50000000,
                onPress: () {
                  setState(() {
                    _currentIndex = 5;
                  });
                  _revenueController.text = 50000000.0.formatVND(
                    isShowCurrency: false,
                  );
                },
                isSelected: _currentIndex == 5,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildJarsAmount(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(255, 215, 61, 0.1),
            Color.fromRGBO(255, 107, 157, 0.1),
          ],
        ),
      ),
      child: Column(
        children: [
          Text(
            "Phân chia 6 hũ của bạn",
            style: AppTextStyles.titleXLarge.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ..._listJarAmountItems
              .map(
                (e) => JarValueItem(
                  jar: e.jar,
                  amount: e.amount,
                  percent: e.percent,
                ),
              )
              .expand((e) => [e, const SizedBox(height: 12)]),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tổng cộng",
                style: AppTextStyles.titleLarge.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "100%",
                style: AppTextStyles.titleLarge.copyWith(
                  color: 100 == 100 ? jarColors[0] : jarColors[5],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: LinearProgressIndicator(
              value: 100 / 100,
              backgroundColor: Colors.grey.shade200,
              color: 100 == 100 ? jarColors[0] : jarColors[5],
              minHeight: 10,
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
