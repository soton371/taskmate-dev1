import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_sizes.dart';

class PeopleView extends StatelessWidget {
  const PeopleView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (_, i) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: AppSizes.paddingBody),
          child: Row(
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
                      if(i&1==0)
                        CircleAvatar(
                          radius: 4,
                          backgroundColor: AppColors.active,
                        ),
                    ],
                  ),
                ],
              ),
              SizedBox(width: AppSizes.paddingBody),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Soton Ahmed",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: AppSizes.fontSizeExtraLarge),
                        ),
                      ],
                    ),
                    Text( i&1==0 ?
                    "soton.m360ict@gmail.com" : "⛱️On vacation",
                      style: TextStyle(
                        fontSize: AppSizes.fontSizeSmall,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
