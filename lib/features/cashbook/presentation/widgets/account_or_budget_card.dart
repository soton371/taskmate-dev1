
import 'package:flutter/material.dart';

import '../../../../core/constants/app_sizes.dart';
import 'infocard_widget.dart';

class AccountOrBudgetCard extends StatelessWidget {
  final String title;
  final List<(String, Color)> items;

  const AccountOrBudgetCard({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return InfoCardWidget(
      title: title,
      totalItems: items.length,
      children: items.take(3).map((e) {
        final (label, color) = e;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(AppSizes.paddingInside / 2),
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
            SizedBox(width: AppSizes.paddingInside),
            Text(
              label,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: AppSizes.fontSizeSmall, color: Colors.black54),
            )
          ],
        );
      }).toList(),
    );
  }
}
