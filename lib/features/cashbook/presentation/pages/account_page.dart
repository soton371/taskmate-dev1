import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:taskmate/core/constants/app_sizes.dart';
import 'package:taskmate/features/cashbook/presentation/widgets/expense_earning_widget.dart';
import '../../../../core/constants/app_values.dart';
import '../widgets/account_card_list.dart';
import '../widgets/transaction_item.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);
  final PageController _pageController = PageController(viewportFraction: 0.9);

  @override
  void dispose() {
    _pageController.dispose();
    _currentIndex.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _pageController.addListener(() {
      final page = _pageController.page?.round() ?? 0;
      if (_currentIndex.value != page) {
        _currentIndex.value = page;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Accounts")),
      body: Column(
        children: [
          AccountCardList(
            accounts: AppValues.accountList,
            currentIndex: _currentIndex,
            pageController: _pageController,
          ),
          const SizedBox(height: 12),
          ValueListenableBuilder<int>(
            valueListenable: _currentIndex,
            builder: (context, index, _) {
              final selectedAccount = AppValues.accountList[index];
              final accountTransactions = AppValues.transactionList.where((t) => t.account == selectedAccount).toList();
              final totalEarnings = accountTransactions.where((t) => t.amount > 0).fold<double>(0, (sum, t) => sum + t.amount);
              final totalExpenses = accountTransactions.where((t) => t.amount < 0).fold<double>(0, (sum, t) => sum + t.amount);

              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(AppSizes.paddingInside),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text("Total Earnings: ৳${totalEarnings.toStringAsFixed(2)}",
                      //     style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                      // Text("Total Expenses: ৳${totalExpenses.abs().toStringAsFixed(2)}",
                      //     style: const TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          Expanded(
                            child: ExpenseEarningWidget2(
                              icon: HugeIcon(icon: HugeIcons.strokeRoundedArrowDown05, color: Colors.greenAccent, size: 24.0),
                              title: "Earning",
                              value: '${totalEarnings.toStringAsFixed(2)} BDT',
                            ),
                          ),
                          Expanded(
                            child: ExpenseEarningWidget2(
                              icon: HugeIcon(icon: HugeIcons.strokeRoundedArrowUp05, color: Colors.redAccent, size: 24.0),
                              title: "Expense",
                              value: '${totalExpenses.toStringAsFixed(2)} BDT',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: ListView.builder(
                          itemCount: accountTransactions.length,
                          itemBuilder: (context, index) {
                            return TransactionItem(transaction: accountTransactions[index]);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
