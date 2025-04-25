import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_sizes.dart';

class ActiveUsers extends StatelessWidget {
  const ActiveUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.height(context, 100),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.2)),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (_, i) {
          return Container(
            width: 90,
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                        AppSizes.cardRadius,
                      ),
                      child: Image.asset(
                        AppImages.user,
                        height: 50,
                        width: 50,
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 6,
                          backgroundColor: AppColors.scaffoldBg,
                        ),
                        CircleAvatar(
                          radius: 4,
                          backgroundColor: AppColors.active,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  "Soton Ahmed",
                  style: TextStyle(fontSize: AppSizes.fontSizeSmall),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
