import 'package:flutter/material.dart';

enum AccountType {
  bank,
  mobileBanking,
  creditCard,
}

class AccountModel {
  final String title;
  final AccountType type;
  final Color color;
  final double amount;
  final String? accountNumber;
  final String? phoneNumber;
  final String? bankName;

  const AccountModel({
    required this.title,
    required this.type,
    required this.color,
    required this.amount,
    this.accountNumber,
    this.phoneNumber,
    this.bankName,
  });
}
