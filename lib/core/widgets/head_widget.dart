import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/profile/pages/profile_page.dart';
import '../constants/app_colors.dart';
import '../constants/app_icons.dart';
import '../constants/app_images.dart';
import '../constants/app_sizes.dart';

class HeadWidget extends StatelessWidget {
  const HeadWidget({
    super.key,
    this.title,
    this.searchHint,
    this.actionIcon,
    this.searchOnTap,
    this.actionOnTap,
  });

  final String? title;
  final String? searchHint;
  final IconData? actionIcon;
  final void Function()? searchOnTap;
  final void Function()? actionOnTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 185,
      decoration: BoxDecoration(
        gradient: AppColors.gradient(
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
        ),
      ),
      padding: EdgeInsets.all(AppSizes.paddingBody),
      child: Column(
        children: [
          SizedBox(height: 50),
          //for name and image
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title ?? "Soton Ahmed",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AppSizes.fontSizeOverLarge,
                  color: Colors.white,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (_) => ProfilePage()),
                  );
                },
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppSizes.cardRadius),
                      child: Image.asset(AppImages.user, height: 40, width: 40),
                    ),
                    CircleAvatar(radius: 6, backgroundColor: AppColors.active),
                  ],
                ),
              ),
            ],
          ),
          //end for name and image
          if (searchHint != null) SizedBox(height: AppSizes.paddingBody),
          //for search and filter
          if (searchHint != null)
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: searchOnTap,
                    child: Container(
                      padding: EdgeInsets.all(AppSizes.paddingInside),
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(
                          AppSizes.textFieldRadius,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(AppIcons.search, color: Colors.white),
                          SizedBox(width: AppSizes.paddingInside,),
                          Text(
                            searchHint ?? "Jump to or search...",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                if (actionIcon != null) SizedBox(width: AppSizes.paddingBody),

                //for filter icon
                if (actionIcon != null)
                  InkWell(
                    onTap: actionOnTap,
                    child: Container(
                      padding: EdgeInsets.all(AppSizes.paddingInside),
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(
                          AppSizes.textFieldRadius,
                        ),
                      ),
                      child: Icon(actionIcon, color: Colors.white),
                    ),
                  ),
              ],
            ),
          //end for search and filter
        ],
      ),
    );
  }
}
