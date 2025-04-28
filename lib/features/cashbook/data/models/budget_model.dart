import 'package:taskmate/features/cashbook/data/models/category_model.dart';

class BudgetModel {
  final CategoryModel category;
  final String title;
  final double amount, spent;
  const BudgetModel({required this.category, required this.spent, required this.title, required this.amount});
}