import 'package:flutter/material.dart';
import 'package:taskmate/core/constants/app_sizes.dart';

import '../../../core/constants/app_colors.dart';




class CreateCard extends StatelessWidget {
  const CreateCard({super.key, required this.color, required this.title, required this.subTitle, required this.iconData, this.onTap});
  final Color color;
  final String title, subTitle;
  final IconData iconData;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,),
              Text(subTitle, style: TextStyle(fontSize: AppSizes.fontSizeSmall, color: AppColors.subtitle),maxLines: 1,overflow: TextOverflow.ellipsis),
            ],
          )
        ],
      ),
    );
  }
}
