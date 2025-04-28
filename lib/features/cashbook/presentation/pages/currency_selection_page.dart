import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:taskmate/app/routes/app_routes.dart';
import 'package:taskmate/core/constants/app_colors.dart';
import 'package:taskmate/core/constants/app_sizes.dart';
import 'package:taskmate/core/widgets/app_dialogs.dart';

import '../../data/data_sources/fetch_currency_model.dart';
import '../../data/models/currency_model.dart';

class CurrencySelectionPage extends StatefulWidget {
  const CurrencySelectionPage({super.key,});

  @override
  State<CurrencySelectionPage> createState() => _CurrencySelectionPageState();
}

class _CurrencySelectionPageState extends State<CurrencySelectionPage> {
  final TextEditingController _searchController = TextEditingController();
  List<CurrencyModel> _filteredCurrencies = [];
  List<CurrencyModel> currencyModels = [];

  @override
  void initState() {
    super.initState();
    currencyModels = getCurrencyModels();
    _filteredCurrencies = currencyModels;
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredCurrencies = currencyModels.where((currency) {
        return currency.code.toLowerCase().contains(query.toLowerCase()) || currency.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Select Primary Currency", style: TextStyle(fontWeight: FontWeight.w600)),
        forceMaterialTransparency: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(AppSizes.paddingInside, 10, AppSizes.paddingInside, 4),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppSizes.textFieldRadius),
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search currency',
                  prefixIcon: HugeIcon(
                    icon: HugeIcons.strokeRoundedSearch01,
                    color: AppColors.border,
                    size: 22,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: _filteredCurrencies.isEmpty
            ? const Center(
                child: Text("No matching currencies", style: TextStyle(color: Colors.grey)),
              )
            : ListView.builder(
                itemCount: _filteredCurrencies.length,
                padding: const EdgeInsets.fromLTRB(AppSizes.paddingInside, 8, AppSizes.paddingInside, 16),
                itemBuilder: (context, index) {
                  final currency = _filteredCurrencies[index];
                  return GestureDetector(
                    // onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.cashbookPage, arguments: currency['code']),
                    onTap: () => appAlertDialog(
                      context,
                      title: currency.name,
                      content: "Are you sure you want to set ${currency.name} as your primary currency?\nOnce selected, you have to change it from App Settings.",
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushReplacementNamed(context, AppRoutes.cashbookPage, arguments: currency.code);
                          },
                          child: const Text("Yes"),
                        )
                      ]
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.03),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.seed.withValues(alpha: 0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              currency.symbol,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currency.name,
                                  style: const TextStyle(fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  currency.code,
                                  style: TextStyle(fontSize: 12, color: AppColors.subtitle),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
          ),
        ],
      ),
    );
  }
}
