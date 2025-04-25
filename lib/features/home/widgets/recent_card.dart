import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';

class RecentCard extends StatelessWidget {
  const RecentCard({super.key, required this.color, required this.title, required this.subTitle, required this.iconData, this.onTap, this.forActivity});
  final Color color;
  final String title, subTitle;
  final IconData iconData;
  final void Function()? onTap;
  final bool? forActivity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: forActivity == true ? null: EdgeInsets.symmetric(horizontal: AppSizes.paddingBody),
      padding: forActivity == true ? null: EdgeInsets.all(AppSizes.paddingInside),
      decoration: forActivity == true ? null: BoxDecoration(
          border: Border.all(color: AppColors.border, width: 0.5),
          borderRadius: BorderRadius.circular(AppSizes.cardRadius)
      ),
      child: InkWell(
      onTap: onTap,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Icon(iconData, color: color,),),
            SizedBox(width: AppSizes.paddingInside,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,),
                  Text(subTitle, style: TextStyle(fontSize: AppSizes.fontSizeSmall, color: AppColors.subtitle),maxLines: 2,overflow: TextOverflow.ellipsis),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


