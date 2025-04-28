
import 'package:flutter/material.dart';

import '../../../../core/constants/app_sizes.dart';

class ExpenseEarningWidget extends StatelessWidget {
  const ExpenseEarningWidget({
    super.key, required this.icon, required this.title, required this.value,
  });
  final Widget icon;
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(55, 255, 255, 255),
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(AppSizes.paddingInside / 2),
          child: icon
        ),
        SizedBox(width: AppSizes.paddingInside,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.w400, fontSize: AppSizes.fontSizeSmall, color: Colors.white),),
            Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: AppSizes.fontSizeLarge, color: Colors.white),),
          ],
        )
      ],
    );
  }
}
class ExpenseEarningWidget2 extends StatelessWidget {
  const ExpenseEarningWidget2({
    super.key, required this.icon, required this.title, required this.value,
  });
  final Widget icon;
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(AppSizes.paddingInside / 2),
          child: icon
        ),
        SizedBox(width: AppSizes.paddingInside,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.w400, fontSize: AppSizes.fontSizeSmall, color: Colors.black45),),
            Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: AppSizes.fontSizeLarge, color: Colors.black87),),
          ],
        )
      ],
    );
  }
}