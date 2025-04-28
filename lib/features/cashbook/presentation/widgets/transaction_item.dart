
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/utilities/app_date_time.dart';
import '../../data/models/transaction_model.dart';

class TransactionItem extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.paddingInside),
      margin: EdgeInsets.only(bottom: AppSizes.paddingInside),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: const Color.fromARGB(10, 0, 0, 0), blurRadius: 10, offset: Offset(0, 2))],
        borderRadius: BorderRadius.circular(AppSizes.cardRadius),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(AppSizes.paddingInside),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: transaction.category.color, width: 0.5),
            ),
            child: HugeIcon(icon: transaction.category.icon, color: transaction.category.color, size: 20.0),
          ),
          SizedBox(width: AppSizes.paddingInside),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(transaction.category.title,
                    style: TextStyle(fontSize: AppSizes.fontSizeSmall, color: transaction.category.color, fontWeight: FontWeight.bold)),
                Text(transaction.title,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: AppSizes.fontSizeLarge)),
                Text(formatDateTime(dateTime: transaction.dateTime) ?? "",
                    style: TextStyle(color: AppColors.subtitle, fontSize: AppSizes.fontSizeExtraSmall)),
              ],
            ),
          ),
          SizedBox(width: AppSizes.paddingInside),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "${transaction.amount} ",
                      style: TextStyle(
                        color: transaction.amount < 0 ? Colors.redAccent : const Color.fromARGB(255, 88, 206, 92),
                        fontWeight: FontWeight.bold,
                        fontSize: AppSizes.fontSizeExtraLarge,
                      ),
                    ),
                    TextSpan(
                      text: transaction.currency.code,
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: AppSizes.fontSizeExtraSmall,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSizes.paddingInside / 2),
              Container(
                decoration: BoxDecoration(
                  color: transaction.account.color.withAlpha(150),
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                child: Text(transaction.account.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: AppSizes.fontSizeExtraSmall,
                        fontWeight: FontWeight.w900)),
              )
            ],
          )
        ],
      ),
    );
  }
}
