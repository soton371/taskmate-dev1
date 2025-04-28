import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmate/features/cashbook/presentation/pages/account_page.dart';
import 'package:taskmate/features/cashbook/presentation/pages/add_expense_earning_page.dart';

import '../../features/cashbook/presentation/pages/add_transfer_page.dart';
import '../../features/cashbook/presentation/pages/budget_page.dart';
import '../../features/cashbook/presentation/pages/cashbook_page.dart';
import '../../features/cashbook/presentation/pages/currency_selection_page.dart';
import 'app_routes.dart';

class AppRouter {
  static Route<dynamic>generateRoute (RouteSettings settings){
    switch(settings.name){
      case AppRoutes.currencySelectionPage:
        return CupertinoPageRoute(builder: (context) => CurrencySelectionPage());
      case AppRoutes.cashbookPage:
        final args = settings.arguments as String;
        return CupertinoPageRoute(builder: (context) => CashbookPage(currency: args,));
      case AppRoutes.budgetPage:
        return CupertinoPageRoute(builder: (context) => BudgetPage());
      case AppRoutes.accountPage:
        return CupertinoPageRoute(builder: (context) => AccountPage());
      case AppRoutes.addTransferPage:
        return CupertinoPageRoute(builder: (context) => AddExchangePage());
      case AppRoutes.addExpenseEarningPage:
        final args = settings.arguments as String;
        return CupertinoPageRoute(builder: (context) => AddExpenseEarningPage(title: args,));
      default:
        return CupertinoPageRoute(builder: (context) => Scaffold(body: Center(child: Text("Route Not Found"),),));
    }
  }
}