import 'package:flutter/material.dart';
import '../../data/models/account_model.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_colors.dart';

class AccountCardList extends StatelessWidget {
  final List<AccountModel> accounts;
  final ValueNotifier<int> currentIndex;
  final PageController pageController;

  const AccountCardList({
    super.key,
    required this.accounts,
    required this.currentIndex,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.height(context, 150),
      child: ValueListenableBuilder<int>(
        valueListenable: currentIndex,
        builder: (context, selectedIndex, _) {
          return PageView.builder(
            itemCount: accounts.length,
            controller: pageController,
            itemBuilder: (context, index) {
              final account = accounts[index];
              final isSelected = index == selectedIndex;
              return _buildCreditCard(context, account, isSelected);
            },
          );
        },
      ),
    );
  }

  Widget _buildCreditCard(BuildContext context, AccountModel account, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: AppSizes.paddingInside),
      decoration: BoxDecoration(
        color: isSelected ? null : AppColors.seed.withAlpha(50),
        gradient: isSelected ? AppColors.gradient() : null,
        borderRadius: BorderRadius.circular(AppSizes.cardRadius * 2),
        // border: isSelected ? null : Border.all(color: AppColors.seed, width: 0.5),
      ),
      padding: EdgeInsets.all(AppSizes.paddingInside),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Total Balance", style: TextStyle(color: Colors.white70, fontSize: 14)),
              PopupMenuButton<String>(
                icon: const Icon(Icons.more_horiz, color: Colors.white54),
                color: Colors.grey[900], // dark background
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                onSelected: (value) {
                  if (value == 'edit') {} 
                  else if (value == 'delete') {}
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'edit',
                    child: Row(
                      children: const [
                        Icon(Icons.edit, color: Colors.white70, size: 20),
                        SizedBox(width: 8),
                        Text('Edit', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'delete',
                    child: Row(
                      children: const [
                        Icon(Icons.delete_outline, color: Colors.redAccent, size: 20),
                        SizedBox(width: 8),
                        Text('Delete', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),

          // SizedBox(height: AppSizes.paddingInside),
          Text("৳${account.amount.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white)),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  _maskCardOrPhone(account),
                  style: const TextStyle(color: Colors.white60, letterSpacing: 2.0, fontSize: 16),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(account.title,
                        maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.end,
                        style: const TextStyle(color: Colors.white60, letterSpacing: 2.0, fontSize: 16)),
                    if (account.bankName != null)
                      Text(account.bankName!,
                          maxLines: 1, textAlign: TextAlign.end, overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.white60, fontSize: 16)),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  String _maskCardOrPhone(AccountModel account) {
    final number = account.accountNumber ?? account.phoneNumber ?? '0000000000000000';
    final masked = number.replaceAllMapped(RegExp(r".(?=.{4})"), (match) => "*");
    return masked.replaceAllMapped(RegExp(r".{4}"), (match) => "${match.group(0)} ");
  }
}
