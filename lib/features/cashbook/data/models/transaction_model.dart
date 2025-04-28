import 'package:taskmate/features/cashbook/data/models/account_model.dart';
import 'package:taskmate/features/cashbook/data/models/currency_model.dart';

import 'category_model.dart';

class TransactionModel {
  final String title;
  final CategoryModel category;
  final CurrencyModel currency;
  final double amount;
  final DateTime dateTime;
  final AccountModel account;

  TransactionModel({required this.title, required this.currency, required this.category, required this.amount, required this.dateTime, required this.account});
}