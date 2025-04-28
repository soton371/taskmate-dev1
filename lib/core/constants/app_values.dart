
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:taskmate/features/cashbook/data/models/account_model.dart';

import '../../features/cashbook/data/models/budget_model.dart';
import '../../features/cashbook/data/models/category_model.dart';
import '../../features/cashbook/data/models/currency_model.dart';
import '../../features/cashbook/data/models/transaction_model.dart';

class AppValues {
  static final List<Map<String, String>> currencies = [
    {'code': 'USD', 'symbol': '\$', 'name': 'United States Dollar'},
    {'code': 'EUR', 'symbol': '€', 'name': 'Euro'},
    {'code': 'JPY', 'symbol': '¥', 'name': 'Japanese Yen'},
    {'code': 'GBP', 'symbol': '£', 'name': 'British Pound Sterling'},
    {'code': 'AUD', 'symbol': 'A\$', 'name': 'Australian Dollar'},
    {'code': 'CAD', 'symbol': 'C\$', 'name': 'Canadian Dollar'},
    {'code': 'CHF', 'symbol': 'CHF', 'name': 'Swiss Franc'},
    {'code': 'CNY', 'symbol': '¥', 'name': 'Chinese Yuan'},
    {'code': 'SEK', 'symbol': 'kr', 'name': 'Swedish Krona'},
    {'code': 'NZD', 'symbol': 'NZ\$', 'name': 'New Zealand Dollar'},
    {'code': 'INR', 'symbol': '₹', 'name': 'Indian Rupee'},
    {'code': 'RUB', 'symbol': '₽', 'name': 'Russian Ruble'},
    {'code': 'BRL', 'symbol': 'R\$', 'name': 'Brazilian Real'},
    {'code': 'ZAR', 'symbol': 'R', 'name': 'South African Rand'},
    {'code': 'SGD', 'symbol': 'S\$', 'name': 'Singapore Dollar'},
    {'code': 'HKD', 'symbol': 'HK\$', 'name': 'Hong Kong Dollar'},
    {'code': 'NOK', 'symbol': 'kr', 'name': 'Norwegian Krone'},
    {'code': 'KRW', 'symbol': '₩', 'name': 'South Korean Won'},
    {'code': 'MXN', 'symbol': '\$', 'name': 'Mexican Peso'},
    {'code': 'TRY', 'symbol': '₺', 'name': 'Turkish Lira'},
    {'code': 'AED', 'symbol': 'د.إ', 'name': 'United Arab Emirates Dirham'},
    {'code': 'SAR', 'symbol': '﷼', 'name': 'Saudi Riyal'},
    {'code': 'EGP', 'symbol': '£', 'name': 'Egyptian Pound'},
    {'code': 'THB', 'symbol': '฿', 'name': 'Thai Baht'},
    {'code': 'IDR', 'symbol': 'Rp', 'name': 'Indonesian Rupiah'},
    {'code': 'MYR', 'symbol': 'RM', 'name': 'Malaysian Ringgit'},
    {'code': 'PKR', 'symbol': '₨', 'name': 'Pakistani Rupee'},
    {'code': 'BDT', 'symbol': '৳', 'name': 'Bangladeshi Taka'},
    {'code': 'NGN', 'symbol': '₦', 'name': 'Nigerian Naira'},
    {'code': 'KES', 'symbol': 'KSh', 'name': 'Kenyan Shilling'},
    {'code': 'GHS', 'symbol': '₵', 'name': 'Ghanaian Cedi'},
    {'code': 'VND', 'symbol': '₫', 'name': 'Vietnamese Dong'},
    {'code': 'PLN', 'symbol': 'zł', 'name': 'Polish Zloty'},
    {'code': 'CZK', 'symbol': 'Kč', 'name': 'Czech Koruna'},
    {'code': 'HUF', 'symbol': 'Ft', 'name': 'Hungarian Forint'},
    {'code': 'ILS', 'symbol': '₪', 'name': 'Israeli New Shekel'},
    {'code': 'DKK', 'symbol': 'kr', 'name': 'Danish Krone'},
    {'code': 'RON', 'symbol': 'lei', 'name': 'Romanian Leu'},
    {'code': 'UAH', 'symbol': '₴', 'name': 'Ukrainian Hryvnia'},
    {'code': 'CLP', 'symbol': '\$', 'name': 'Chilean Peso'},
    {'code': 'COP', 'symbol': '\$', 'name': 'Colombian Peso'},
    {'code': 'ARS', 'symbol': '\$', 'name': 'Argentine Peso'},
    {'code': 'PEN', 'symbol': 'S/', 'name': 'Peruvian Sol'},
    {'code': 'DZD', 'symbol': 'د.ج', 'name': 'Algerian Dinar'},
  ];

  static final List<AccountModel> accountList = [
    AccountModel(
      title: 'Savings',
      type: AccountType.bank,
      color: Color(0xFF4CAF50),
      amount: 2500.00,
      accountNumber: 'SA-102934857',
      bankName: 'Dutch-Bangla Bank',
    ),
    AccountModel(
      title: 'Checking',
      type: AccountType.bank,
      color: Color(0xFF2196F3),
      amount: 1340.75,
      accountNumber: 'CH-203948576',
      bankName: 'Brac Bank Ltd.',
    ),
    AccountModel(
      title: 'Business',
      type: AccountType.bank,
      color: Color(0xFFFFC107),
      amount: 12000.50,
      accountNumber: 'BA-309845762',
      bankName: 'Standard Chartered Bank',
    ),
    AccountModel(
      title: 'Mobile Banking (bKash)',
      type: AccountType.mobileBanking,
      color: Color(0xFF00BCD4),
      amount: 760.50,
      phoneNumber: '01700123456',
    ),
    AccountModel(
      title: 'Mobile Banking (Nagad)',
      type: AccountType.mobileBanking,
      color: Color(0xFFFF5722),
      amount: 850.75,
      phoneNumber: '01812345678',
    ),
    AccountModel(
      title: 'Mobile Banking (Rocket)',
      type: AccountType.mobileBanking,
      color: Color(0xFF9C27B0),
      amount: 1125.30,
      phoneNumber: '01634567890',
    ),
    AccountModel(
      title: 'Visa Credit Card',
      type: AccountType.creditCard,
      color: Color(0xFFF44336),
      amount: 5520.90,
      accountNumber: '9878 8798 5465 4321',
    ),
    AccountModel(
      title: 'MasterCard Credit',
      type: AccountType.creditCard,
      color: Color(0xFF4CAF50),
      amount: 2000.50,
      accountNumber: '4879 7487 7497 9876',
    ),
    AccountModel(
      title: 'American Express',
      type: AccountType.creditCard,
      color: Color(0xFF2196F3),
      amount: 3200.40,
      accountNumber: '7878 5454 4541 5678',
    ),
    AccountModel(
      title: 'Emergency Fund',
      type: AccountType.bank,
      color: Color(0xFF9C27B0),
      amount: 1200.00,
      accountNumber: 'EM-509384756',
      bankName: 'City Bank Ltd.',
    ),
    AccountModel(
      title: 'Travel Wallet',
      type: AccountType.bank,
      color: Color(0xFF00BCD4),
      amount: 760.50,
      accountNumber: 'TW-609384756',
      bankName: 'HSBC',
    ),
    AccountModel(
      title: 'Crypto Wallet',
      type: AccountType.bank,
      color: Color(0xFFFF5722),
      amount: 3150.90,
      accountNumber: 'CR-709384756',
      bankName: 'Crypto.com',
    ),
  ];

  static final bdtCurrency = CurrencyModel(code: 'BDT', name: 'Bangladeshi Taka', symbol: '৳');

  static final List<BudgetModel> budgetList = [
    BudgetModel(category: categoryList[3], title: "Eid", amount: 500.0, spent: 430.0),
    BudgetModel(category: categoryList[6], title: "Medicine", amount: 400.0, spent: 280.0),
    BudgetModel(category: categoryList[7], title: "Varsity Fee", amount: 600.0, spent: 300.0),
    BudgetModel(category: categoryList[0], title: "Snacks", amount: 300.0, spent: 220.0),
    BudgetModel(category: categoryList[1], title: "Rickshaw Fare", amount: 150.0, spent: 90.0),
    BudgetModel(category: categoryList[2], title: "Movie", amount: 200.0, spent: 180.0),
    BudgetModel(category: categoryList[4], title: "Household utilities", amount: 250.0, spent: 240.0),
  ];


  static final List<CategoryModel> categoryList = [
    CategoryModel(icon: HugeIcons.strokeRoundedHamburger01, title: 'Food', color: Colors.orange),
    CategoryModel(icon: HugeIcons.strokeRoundedBus03, title: 'Transport', color: Colors.blue),
    CategoryModel(icon: HugeIcons.strokeRoundedTv01, title: 'Entertainment', color: Colors.redAccent),
    CategoryModel(icon: HugeIcons.strokeRoundedShoppingBag03, title: 'Shopping', color: Colors.purple),
    CategoryModel(icon: HugeIcons.strokeRoundedTools, title: 'Utilities', color: Colors.teal),
    CategoryModel(icon: HugeIcons.strokeRoundedDollar01, title: 'Salary', color: Colors.greenAccent),
    CategoryModel(icon: HugeIcons.strokeRoundedHealtcare, title: 'Health', color: Colors.pinkAccent),
    CategoryModel(icon: HugeIcons.strokeRoundedBook01, title: 'Education', color: Colors.deepPurpleAccent),
    CategoryModel(icon: HugeIcons.strokeRoundedGlobe02, title: 'Travel', color: Colors.cyan),
  ];


  static final List<TransactionModel> transactionList = [
    TransactionModel(title: 'Bus Fare', category: categoryList[1], currency: bdtCurrency, amount: -1554.55, dateTime: DateTime(2025, 4, 24, 20, 40), account: accountList[0]),
    TransactionModel(title: 'Netflix', category: categoryList[2], currency: bdtCurrency, amount: -650.00, dateTime: DateTime(2025, 4, 24, 19, 45), account: accountList[1]),
    TransactionModel(title: 'Spotify Subscription', category: categoryList[2], currency: bdtCurrency, amount: -199.00, dateTime: DateTime(2025, 4, 24, 17, 30), account: accountList[0]),
    TransactionModel(title: 'Freelance Payout', category: categoryList[5], currency: bdtCurrency, amount: 12544.52, dateTime: DateTime(2025, 4, 23, 22, 10), account: accountList[1]),
    TransactionModel(title: 'Crypto Staking', category: categoryList[5], currency: bdtCurrency, amount: 980.00, dateTime: DateTime(2025, 4, 23, 21, 15), account: accountList[3]),
    TransactionModel(title: 'Uber Ride', category: categoryList[1], currency: bdtCurrency, amount: -230.45, dateTime: DateTime(2025, 4, 23, 20, 30), account: accountList[5]),
    TransactionModel(title: 'Gas Fees', category: categoryList[4], currency: bdtCurrency, amount: -120.00, dateTime: DateTime(2025, 4, 22, 20, 50), account: accountList[0]),
    TransactionModel(title: 'Groceries', category: categoryList[0], currency: bdtCurrency, amount: -903.79, dateTime: DateTime(2025, 4, 22, 18, 10), account: accountList[1]),
    TransactionModel(title: 'Gas Bill', category: categoryList[4], currency: bdtCurrency, amount: -586.49, dateTime: DateTime(2025, 4, 22, 16, 30), account: accountList[1]),
    TransactionModel(title: 'Electric Bill', category: categoryList[4], currency: bdtCurrency, amount: -875.00, dateTime: DateTime(2025, 4, 22, 15, 25), account: accountList[2]),
    TransactionModel(title: 'Mobile Recharge', category: categoryList[0], currency: bdtCurrency, amount: -88.43, dateTime: DateTime(2025, 4, 21, 21, 00), account: accountList[3]),
    TransactionModel(title: 'Crypto Cashback', category: categoryList[5], currency: bdtCurrency, amount: 520.00, dateTime: DateTime(2025, 4, 21, 19, 45), account: accountList[0]),
    TransactionModel(title: 'Taxi Fare', category: categoryList[1], currency: bdtCurrency, amount: -160.34, dateTime: DateTime(2025, 4, 21, 18, 10), account: accountList[2]),
    TransactionModel(title: 'Vegetables', category: categoryList[0], currency: bdtCurrency, amount: -370.55, dateTime: DateTime(2025, 4, 21, 17, 20), account: accountList[1]),
    TransactionModel(title: 'Tuition Fee', category: categoryList[7], currency: bdtCurrency, amount: 7790.36, dateTime: DateTime(2025, 4, 20, 20, 15), account: accountList[3]),
    TransactionModel(title: 'Friend Repayment', category: categoryList[5], currency: bdtCurrency, amount: 2500.00, dateTime: DateTime(2025, 4, 20, 19, 30), account: accountList[4]),
    TransactionModel(title: 'Project Bonus', category: categoryList[5], currency: bdtCurrency, amount: 6709.47, dateTime: DateTime(2025, 4, 20, 18, 10), account: accountList[5]),
    TransactionModel(title: 'Solana Buy', category: categoryList[5], currency: bdtCurrency, amount: -700.00, dateTime: DateTime(2025, 4, 20, 16, 50), account: accountList[0]),
    TransactionModel(title: 'ETH Buy', category: categoryList[5], currency: bdtCurrency, amount: -1500.00, dateTime: DateTime(2025, 4, 19, 22, 00), account: accountList[6]),
    TransactionModel(title: 'Hospital Fee', category: categoryList[6], currency: bdtCurrency, amount: -1159.85, dateTime: DateTime(2025, 4, 18, 19, 40), account: accountList[8]),
    TransactionModel(title: 'Medicine Purchase', category: categoryList[6], currency: bdtCurrency, amount: -532.30, dateTime: DateTime(2025, 4, 18, 18, 30), account: accountList[9]),
    TransactionModel(title: 'BTC Buy', category: categoryList[5], currency: bdtCurrency, amount: -2500.00, dateTime: DateTime(2025, 4, 18, 16, 00), account: accountList[11]),
    TransactionModel(title: 'Electric Bill', category: categoryList[4], currency: bdtCurrency, amount: -317.38, dateTime: DateTime(2025, 4, 17, 22, 00), account: accountList[7]),
    TransactionModel(title: 'Clothing', category: categoryList[3], currency: bdtCurrency, amount: -1461.68, dateTime: DateTime(2025, 4, 17, 20, 10), account: accountList[8]),
    TransactionModel(title: 'Return Flight Refund', category: categoryList[5], currency: bdtCurrency, amount: 1800.00, dateTime: DateTime(2025, 4, 16, 21, 30), account: accountList[10]),
    TransactionModel(title: 'Souvenirs', category: categoryList[3], currency: bdtCurrency, amount: -950.00, dateTime: DateTime(2025, 4, 15, 16, 00), account: accountList[10]),
    TransactionModel(title: 'Airport Taxi', category: categoryList[1], currency: bdtCurrency, amount: -550.00, dateTime: DateTime(2025, 4, 14, 19, 30), account: accountList[6]),
    TransactionModel(title: 'Travel Food', category: categoryList[0], currency: bdtCurrency, amount: -800.00, dateTime: DateTime(2025, 4, 13, 20, 45), account: accountList[5]),
    TransactionModel(title: 'Chittagong Hotel', category: categoryList[8], currency: bdtCurrency, amount: -2100.00, dateTime: DateTime(2025, 4, 12, 22, 15), account: accountList[4]),
    TransactionModel(title: 'Sylhet Trip', category: categoryList[8], currency: bdtCurrency, amount: -3000.00, dateTime: DateTime(2025, 4, 10, 19, 45), account: accountList[10]),
  ];
}



enum CategoryType { session, project, communication }