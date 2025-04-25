import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmate/core/constants/app_colors.dart';
import 'package:taskmate/core/constants/app_sizes.dart';

class RemainingTaskView extends StatelessWidget {
  const RemainingTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.all(AppSizes.paddingBody),
        children: [
          Text(
            "Today",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.seed,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
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
                      Checkbox(value: false, onChanged: (onChanged) {}),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Google translate agent",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Details",
                            style: TextStyle(
                              color: AppColors.subtitle,
                              fontSize: AppSizes.fontSizeSmall,
                            ),
                          ),
                          Text(
                            "10 am",
                            style: TextStyle(
                              color: AppColors.subtitle,
                              fontSize: AppSizes.fontSizeSmall,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ),

          SizedBox(height: AppSizes.paddingBody*2,),

          Text(
            "Sun, 27 Apr",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 3,
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
                    Checkbox(value: false, onChanged: (onChanged) {},),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Google translate agent",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Details",
                          style: TextStyle(
                            color: AppColors.subtitle,
                            fontSize: AppSizes.fontSizeSmall,
                          ),
                        ),
                        Text(
                          "10 am",
                          style: TextStyle(
                            color: AppColors.subtitle,
                            fontSize: AppSizes.fontSizeSmall,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
