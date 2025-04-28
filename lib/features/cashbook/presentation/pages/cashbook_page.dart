import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:taskmate/app/routes/app_routes.dart';
import 'package:taskmate/core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_values.dart';
import '../widgets/account_or_budget_card.dart';
import '../widgets/circular_action_button.dart';
import '../widgets/expense_earning_widget.dart';
import '../widgets/transaction_item.dart';

class CashbookPage extends StatelessWidget {
  const CashbookPage({super.key, required this.currency});
  final String currency;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cashbook"),
        forceMaterialTransparency: true,
        actions: [
          IconButton(
            onPressed: () {
              showDateRangePicker(
                context: context,
                firstDate: DateTime.now().subtract(const Duration(days: 30)),
                lastDate: DateTime.now(),
                initialDateRange: DateTimeRange(
                  start: DateTime.now().subtract(const Duration(days: 30)),
                  end: DateTime.now(),
                ),
              );
            },
            icon: Row(
              children: [
                const Text("April", style: TextStyle(color: Colors.black54)),
                SizedBox(width: AppSizes.paddingInside),
                HugeIcon(
                  icon: HugeIcons.strokeRoundedCalendar03,
                  color: Colors.black54,
                  size: 18,
                ),
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingBody),
        child: Column(
          children: [
            _buildBalanceSection(),
            SizedBox(height: AppSizes.paddingBody),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(AppSizes.cardRadius),
                    onTap: () => Navigator.pushNamed(context, AppRoutes.accountPage),
                    child: AccountOrBudgetCard(
                      title: "🏦 Accounts",
                      items: AppValues.accountList.map((e) => (e.title, e.color)).toList(),
                    ),
                  ),
                ),
                SizedBox(width: AppSizes.paddingInside),
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(AppSizes.cardRadius),
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.budgetPage);
                    },
                    child: AccountOrBudgetCard(
                      title: "💵 Budget",
                      items: AppValues.budgetList.map((e) => (e.title, e.category.color)).toList(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSizes.paddingBody),
            const SectionHeader(title: "Recent Transactions"),
            SizedBox(height: AppSizes.paddingInside),
            Expanded(
              child: Stack(
                children: [
                  ListView.builder(
                    itemCount: AppValues.transactionList.length + 1,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return index == AppValues.transactionList.length ? const SizedBox(height: 100) : TransactionItem(transaction: AppValues.transactionList[index]);
                    },
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: AppSizes.height(context, 100),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withValues(alpha: 0),
                            Colors.white.withValues(alpha: 0.8),
                            Colors.white
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter
                        )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircularActionButton(
                            onTap: () {
                              Navigator.pushNamed(context, AppRoutes.addExpenseEarningPage, arguments: "Earning");
                            },
                            gradientColors: const [Color.fromARGB(255, 9, 216, 223), Color(0xff00cdac)],
                            icon: HugeIcons.strokeRoundedArrowDown04,
                            size: 24.0,
                          ),
                          CircularActionButton(
                            onTap: () {
                              Navigator.pushNamed(context, AppRoutes.addExpenseEarningPage, arguments: "Expense");
                            },
                            gradientColors: const [Color(0xffe52d27), Color(0xffb31217)],
                            icon: HugeIcons.strokeRoundedArrowUp04,
                            size: 30.0,
                          ),
                          CircularActionButton(
                            onTap: () {
                              Navigator.pushNamed(context, AppRoutes.addTransferPage,);
                            },
                            gradientColors: const [Color(0xff4776e6), Color(0xff8e54e9)],
                            icon: HugeIcons.strokeRoundedShuffle,
                            size: 24.0,
                          ),
                        ],
                      ),),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceSection() {
    return Container(
      padding: EdgeInsets.all(AppSizes.paddingBody),
      width: double.maxFinite,
      decoration: BoxDecoration(
        gradient: AppColors.gradient(),
        borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Balance", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          Text("13,585 $currency",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: AppSizes.fontSizeMaxLarge,
                  fontWeight: FontWeight.bold)),
          RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.white, fontSize: AppSizes.fontSizeExtraSmall),
              children: [
                const TextSpan(text: "You are spending "),
                TextSpan(
                  text: "1,270 $currency ",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: "more than last month"),
              ],
            ),
          ),
          SizedBox(height: AppSizes.paddingInside * 2),
          Row(
            children: [
              Expanded(
                child: ExpenseEarningWidget(
                  icon: HugeIcon(icon: HugeIcons.strokeRoundedArrowDown05, color: Colors.greenAccent, size: 24.0),
                  title: "Earning",
                  value: '54,750 $currency',
                ),
              ),
              Expanded(
                child: ExpenseEarningWidget(
                  icon: HugeIcon(icon: HugeIcons.strokeRoundedArrowUp05, color: Colors.redAccent, size: 24.0),
                  title: "Expense",
                  value: '54,750 $currency',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: AppSizes.fontSizeLarge,
              color: Colors.black54,
            )),
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              Text("See All",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: AppSizes.fontSizeSmall,
                      color: Colors.black54)),
              const Icon(Icons.arrow_right_rounded, size: 24),
            ],
          ),
        )
      ],
    );
  }
}