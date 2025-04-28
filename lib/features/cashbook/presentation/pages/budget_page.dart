import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:taskmate/core/constants/app_sizes.dart';
import 'package:taskmate/core/constants/app_values.dart';
import 'package:taskmate/features/cashbook/data/models/budget_model.dart';

class BudgetPage extends StatelessWidget {
  const BudgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Budget"),
        forceMaterialTransparency: true,
      ),
      body: ListView.builder(
        itemCount: AppValues.budgetList.length + 1,
        padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingBody),
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          if (index == AppValues.budgetList.length) {
            return const SizedBox(height: 100); // Spacer at the bottom
          }

          final BudgetModel budget = AppValues.budgetList[index];
          final spentRatio = (budget.spent / budget.amount).clamp(0.0, 1.0);
          final isLowBudget = spentRatio >= 0.8;

          return Container(
            padding: EdgeInsets.all(AppSizes.paddingInside),
            margin: EdgeInsets.only(bottom: AppSizes.paddingInside),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.95),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Info Row
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: budget.category.color.withValues(alpha: 0.1),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: HugeIcon(
                        icon: budget.category.icon,
                        color: budget.category.color,
                        size: 20.0,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            budget.category.title,
                            style: TextStyle(
                              fontSize: AppSizes.fontSizeSmall,
                              color: budget.category.color,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            budget.title,
                            style: TextStyle(
                              fontSize: AppSizes.fontSizeLarge,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.end,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "${budget.amount.toStringAsFixed(0)} ",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: AppSizes.fontSizeExtraLarge,
                            ),
                          ),
                          TextSpan(
                            text: "BDT",
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                              fontSize: AppSizes.fontSizeExtraSmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Gradient Progress Indicator
                Stack(
                  children: [
                    Container(
                      height: 16,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: spentRatio,
                      child: Container(
                        height: 16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: _buildDynamicGradient(spentRatio),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Bottom Info Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${budget.spent.toStringAsFixed(0)} BDT spent",
                      style: TextStyle(color: Colors.black87, fontSize: 13),
                    ),
                    if (isLowBudget)
                      Row(
                        children: [
                          const Icon(Icons.warning_amber_rounded, color: Colors.redAccent, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            "Running low!",
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          );
        },
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //   },
      // ),
    );
  }

  // Dynamic gradient from light green → teal → dark teal with more faded effect
  LinearGradient _buildDynamicGradient(double ratio) {
    return LinearGradient(
      colors: [
        Colors.greenAccent.withValues(alpha: 0.5), // faded light green
        _calculateGreenVariantColor(ratio).withValues(alpha: 0.7), // faded variant
      ],
    );
  }


  Color _calculateGreenVariantColor(double ratio) {
    if (ratio <= 0.5) {
      return Color.lerp(Colors.greenAccent, Colors.teal, ratio / 0.5)!;
    } else {
      return Color.lerp(Colors.teal, Colors.teal[900]!, (ratio - 0.5) / 0.5)!;
    }
  }
}
