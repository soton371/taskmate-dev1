import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';

class CompletedTaskView extends StatelessWidget {
  const CompletedTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingBody),
        itemCount: 2,
        itemBuilder: (_,i)=>Container(
          decoration: BoxDecoration(
            color: AppColors.scaffoldBg,
            boxShadow: AppColors.boxShadow,
            borderRadius: BorderRadius.circular(AppSizes.cardRadius),
          ),
          margin: EdgeInsets.only(top: AppSizes.paddingBody),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSizes.paddingInside),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(value: true, onChanged: (onChanged) {}),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Google translate agent",
                      style: TextStyle(fontWeight: FontWeight.w500, decoration: TextDecoration.lineThrough),
                    ),
                    Text(
                      "Details",
                      style: TextStyle(
                        color: AppColors.subtitle,
                        fontSize: AppSizes.fontSizeSmall,
                      ),
                    ),
                    Text(
                      "Completed at Thu, 24 Apr",
                      style: TextStyle(
                        color: AppColors.subtitle,
                        fontSize: AppSizes.fontSizeSmall,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
