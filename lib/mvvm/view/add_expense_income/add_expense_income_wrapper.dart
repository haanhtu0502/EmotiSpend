import 'package:emoti_spend/core/components/build_tab_bar.dart';
import 'package:emoti_spend/core/components/static_header.dart';
import 'package:emoti_spend/core/design_system/app_text_style.dart';
import 'package:emoti_spend/mvvm/view/add_expense_income/tabs/add_expense_screen.dart';
import 'package:emoti_spend/mvvm/view/add_expense_income/tabs/add_income_screen.dart';
import 'package:flutter/material.dart';

class AddExpenseIncomeWrapper extends StatefulWidget {
  const AddExpenseIncomeWrapper({super.key});

  @override
  State<AddExpenseIncomeWrapper> createState() =>
      _AddExpenseIncomeWrapperState();
}

class _AddExpenseIncomeWrapperState extends State<AddExpenseIncomeWrapper> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          StaticHeader(
            padding: const EdgeInsetsGeometry.only(
              left: 16,
              right: 16,
              bottom: 16,
            ),
            child: SafeArea(
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
                    'Giao dịch mới',
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
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
                    child: BuildTabBar(
                      tabItems: const ["Chi tiêu 💸", "Thu nhập 💰"],
                      onTap: (value) {
                        setState(() {
                          _currentIndex = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  switch (_currentIndex) {
                    0 => const AddExpenseScreen(),
                    1 => const AddIncomeScreen(),
                    _ => const SizedBox(),
                  },
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
